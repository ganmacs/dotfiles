module Overcommit::Hook::Shared
  module Tags
    def run
      execute_in_background(command)
      :pass
    end
  end
end
