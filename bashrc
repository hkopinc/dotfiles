# .bashrc

# User specific aliases and functions

# safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# ls
alias ll='ls -lh'

# grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# prompt
LBLUE="\[\033[1;34m\]"
LGREEN="\[\033[1;32m\]"
LRED="\[\033[1;31m\]"
RES_COLOR="\[\033[0m\]"
PS1=$RES_COLOR"["$LBLUE"ENV"$RES_COLOR"][\u@"$LRED"\h"$RES_COLOR" \w]\n\$"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Set screen window title
case "$TERM" in
screen*)
  PROMPT_COMMAND='echo -ne "\033k$HOSTNAME\033\\"'
  ;;
esac

# bash history save time
HISTTIMEFORMAT='%F %T  '
# increase history size
HISTSIZE='10000'
HISTFILESIZE='50000'

# auto completion
complete -cf sudo
complete -cf man
