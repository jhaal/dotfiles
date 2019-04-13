# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
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
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    # PS1="\[\e[31m\]\u@\[\e[m\]\[\e[32m\]\h@\[\e[m\]\[\e[33m\]\s_\[\e[m\]\[\e[31m\]\W\[\e[m\]\\$\[\e[37m\]\$"
    PS1="\[\e[31m\]\u@\[\e[m\]\[\e[32m\]\h\[\e[m\]\[\e[33m\][\s]\[\e[m\]\[\e[31m\]\w\[\033[37m\]\\$"

else
    # PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1="\[\e[31m\]\u@\[\e[m\]\[\e[32m\]\h\[\e[m\]\[\e[33m\][\s]\[\e[m\]\[\e[31m\]\w\[\033[37m\]\\$"
fi
# unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|urxvt*)
    # PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    # PS1="\h@\u\w\\$\[$(tput sgr0)\]"
    # PS1="\[\e[31m\]\u\[\e[m\]\[\e[32m\]\h\[\e[m\]\[\e[33m\]\s\[\e[m\]\[\e[31m\]\W\[\e[m\]\\$ "
    # PS1="${debian_chroot:+($debian_chroot)}\[\e[31m\]\u@\[\e[m\]\[\e[32m\]\h@\[\e[m\]\[\e[33m\]\s_\[\e[m\]\[\e[31m\]\W\[\e[m\]\\$\[\e[37m\]"
    PS1="\[\e[31m\]\u@\[\e[m\]\[\e[32m\]\h\[\e[m\]\[\e[33m\][\s]\[\e[m\]\[\e[31m\]\w\[\033[37m\]\\$"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# OpenFOAM Version - 2.4.0 source call
#alias of240='source /home/user01/OpenFOAM/OpenFOAM-2.4.0/etc/bashrc $FOAM_SETTINGS'
#OpenFOAM Version - 4.1 source call 
alias of41='source /home/user01/OpenFOAM/OpenFOAM-4.1/etc/bashrc $FOAM_SETTINGS'

# Intel FORTRAN - 2017 Compiler environment for LINUX for 64bit
PATH="$PATH":/opt/intel/compilers_and_libraries_2017.4.196/linux/mpi/intel64/bin
source /opt/intel/impi/2017.3.196/intel64/bin/mpivars.sh intel64 
source /opt/intel/bin/compilervars.sh intel64 
source /opt/intel/bin/ifortvars.sh intel64
# added by Anaconda3 4.4.0 installer
export PATH="/home/user01/anaconda3/bin:$PATH"
# added by Anaconda2 4.4.0 installer
export PATH="/home/user01/anaconda2/bin:$PATH"

#openmpi path specification
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu/openmpi/lib/

# PGI Compiler options
PGI=/opt/pgi;
PATH=/opt/pgi/linux86-64/17.10/bin:$PATH;
MANPATH=$MANPATH:/opt/pgi/linux86-64/17.10/man;
LM_LICENSE_FILE=$LM_LICENSE_FILE:/opt/pgi/license.dat;

neofetch
bind '"\e[A": history-search-backward'
