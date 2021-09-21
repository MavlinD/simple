[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

TERM=xterm-256color
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;

esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  if command -v ip >null; then
    PS1='\[\e[0;92m\]\u\[\e[0;1;38;5;200m\]@\[\e[0;38;5;190m\]$(ip route get 1.1.1.1 | awk -F"src " '"'"'NR==1{split($2,a," ");print a[1]}'"'"')\[\e[0;38;5;240m\]<\[\e[0;38;5;33m\]\H\[\e[0;38;5;240m\]> \[\e[0;38;5;202m\]\w \[\e[0;1;38;5;75m\]$ \[\e[0m\]'
  else
    PS1='\[\e[0;92m\]\u\[\e[0;1;38;5;200m\]@\[\e[0;38;5;156m\]install iproute2\[\e[0;38;5;243m\]<\[\e[0;38;5;229m\]\H\[\e[0;38;5;243m\]> \[\e[0;38;5;202m\]\w \[\e[0;1;38;5;75m\]$ \[\e[0m\]'
  fi
else

  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;
*) ;;

esac

if [ $UID -ne 0 ]; then
  alias m="micro"
  alias rel="source ~/.bashrc"
fi

export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history
# export PROMPT_COMMAND='history -a' && export HISTFILE=/home/appuser/commandhistory/.bash_history
