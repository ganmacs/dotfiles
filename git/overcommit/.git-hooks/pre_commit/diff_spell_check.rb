module Overcommit::Hook::PreCommit
  class DiffSpellCheck < Base
    DIFF_HUNK_REGEX = /
      ^@@\s
      [^\s]+\s           # Ignore old file range
      \+(\d+)(?:,(\d+))? # Extract range of hunk containing start line and number of lines
      \s@@.*$
    /x

    MISSPELLING_REGEX = /^[&#]\s(?<word>\w+)(?:.+?:\s(?<suggestions>.*))?/

    def run
      msg = ''
      modified_files.map do |file|
        begin
          msg += extract_modified_body(file)
        rescue => e
          [:fail, e]
        end
      end

      if msg == ''
        :pass
      else
        [:warn, msg]
      end
    end

    private

    def extract_modified_body(file_path)
      msg = ''

      File.open(file_path) do |f|
        `git diff --no-color --no-ext-diff -U0 --cached -- "#{file_path}"`.
          scan(DIFF_HUNK_REGEX) do |start_line, lines_added|
          lines_added = (lines_added || 0).to_i
          start_line = start_line.to_i

          f.each_line.with_index(1) do |e, i|
            next unless i.between?(start_line, start_line + lines_added)
            next if e == "\n" || e == ''

            if (t = check_spell(e))
              msg += "#{file_path}:#{i}: #{t}"
            else
              next
            end
          end

          f.rewind
        end
      end

      msg
    end

    def check_spell(txt)
      misspelling = false

      body = txt.dup
      result = execute(command + [tmpfile(body)])
      raise "Error running spellcheck: #{result.stderr.chomp}" unless result.success?

      result.stdout.scan(MISSPELLING_REGEX).map do |word, _suggestions|
        misspelling = true
        body.gsub!(word, "[[#{word}]]")
      end

      misspelling && body
    end

    def tmpfile(txt)
      ::Tempfile.open('tmp') do |file|
        file.write(txt)
        file.path
      end
    end
  end
end
