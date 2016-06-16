# .bashrc

export VISUAL=vim
export EDITOR="$VISUAL"

alias git-root='cd "$(git rev-parse --show-toplevel)"'
alias tmux='tmux -2'
alias pgoogle='ping google.com'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias ls='ls --color=auto'
alias ll='ls -lh'

alias grep='grep --color=auto'

# git
export GIT_PS1_SHOWDIRTYSTATE=1

# prompt
export PROMPT_DIRTRIM=2
LBLUE="\[\033[1;34m\]"
LGREEN="\[\033[1;32m\]"
LRED="\[\033[1;31m\]"
LYELLOW="\[\033[1;33m\]"
RES_COLOR="\[\033[0m\]"
PS1=$LBLUE"\w"$LYELLOW"\$(__git_ps1) "$RES_COLOR"\$ "

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

ssh() {
    tmux rename-window "$*"
    command ssh "$@"
    tmux set-window-option automatic-rename "on" 1>/dev/null
}

# bash history save time
HISTTIMEFORMAT='%F %T  '
# increase history size
HISTSIZE='10000'
HISTFILESIZE='50000'

# auto completion
complete -cf sudo
complete -cf man

# less with colors
if [[ $- == *i* ]]; then
    export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # blinking - green
    export LESS_TERMCAP_md=$(tput bold; tput setaf 1) # bold - red
    export LESS_TERMCAP_me=$(tput sgr0)
    export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
    export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
    export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 2) # underline - green
    export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
fi


# bookmarks
export MARKPATH=$HOME/.marks
function jump {
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
    ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
    rm -i "$MARKPATH/$1"
}
function marks {
    ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}
_completemarks() {
  local curw=${COMP_WORDS[COMP_CWORD]}
  local wordlist=$(find $MARKPATH -type l -printf "%f\n")
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}
complete -F _completemarks jump unmark
