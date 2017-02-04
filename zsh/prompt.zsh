# -*- sh -*-

autoload -Uz vcs_info
autoload -Uz colors; colors
autoload -Uz is-at-least

setopt prompt_subst

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' max-exports 3
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr "*"
zstyle ':vcs_info:git:*' formats '[%b] %c%u'
zstyle ':vcs_info:git:*' actionformats '[%b|%a] %c%u'

function notify_precmd {
    prev_command_status=$?

    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"

    if [[ "$TTYIDLE" -gt 8 ]]; then
        notify_title=$([ "$prev_command_status" -eq 0 ] && echo "Command succeeded \U1F646" || echo "Command failed \U1F645")
        osascript -e "display notification \"$prev_command\" with title \"$notify_title\""
    fi
}

function store_command {
    prev_command=$2
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec store_command
add-zsh-hook precmd notify_precmd

PROMPT="%{${fg[green]}%}%n%{${reset_color}%}@%F{blue}localhost%f:%1(v|%F{red}%1v%f|) $ "

OK="✔ "
NG="✘ "
PROMPT_EXIT_STATUS="%(?.%F{green}$OK%f.%F{red}$NG%f) "
PROMPT_PATH="%F{blue}%~%f"

PROMPT="$PROMPT_EXIT_STATUS $PROMPT_PATH %1(v|%F{magenta}%1v%f|)
$ "

RPROMPT=" %F{yellow}[%*]"
