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
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Required so scala shell works properly
export TERM=xterm-color

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

# Java
export JAVA_HOME=/usr/lib/jvm/default-java
export PATH=$JAVA_HOME/bin:$PATH

# Ant
export ANT_HOME=/home/lrodero/Software/apache-ant-1.10.0
export PATH=$ANT_HOME/bin:$PATH

# Apache Maven
export MVN_HOME=/home/lrodero/Software/apache-maven-3.3.9
export PATH=$MVN_HOME/bin:$PATH

# JavaCard
export JC_HOME=/home/lrodero/Software/java_card_kit-2.2.2/java_card_kit-2_2_2
export PATH=$JC_HOME/bin:$PATH

# Vim-Gvim NOT NEEDED, Vim and Gvim configurations are set in .vimrc
# alias vim='vim -c "set expandtab" -c "set tabstop=4" -c "set shiftwidth=4" -c "set nu" -c "syntax on"'
# alias gvim='gvim -c "set expandtab" -c "set tabstop=4" -c "set shiftwidth=4" -c "set nu" -c "set guifont=DejaVu\ Sans\ Mono\ 9" -c "syntax on" '
#Neovim true color support
export NVIM_TUI_ENABLE_TRUE_COLOR=1
#Neovim cursor shape support
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# Scala
export SCALA_HOME=/home/lrodero/Software/scala-2.12.2
#export SCALA_HOME=/home/lrodero/Software/scala-2.10.6
export PATH=$SCALA_HOME/bin:$PATH

# Sbt // Not needed, we use the sbt package in Debian
#export SBT_HOME=/home/lrodero/Software/sbt-launcher-packaging-0.13.13
#export PATH=$SBT_HOME/bin:$PATH

# Required for having several ruby versions available, see
# http://ryanbigg.com/2014/10/ubuntu-ruby-ruby-install-chruby-and-you
# This was in turn required to install jekyll to create the blog
# in github as defined in
# https://help.github.com/articles/using-jekyll-with-pages/
# as ruby with version >= 2 is required.
#source /usr/local/share/chruby/chruby.sh
#source /usr/local/share/chruby/auto.sh

# Postgres 
export POSTGRES_HOME=/home/postgres/Software/postgresql-9.5.1
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$POSTGRES_HOME/lib
export PATH=$PATH:$POSTGRES_HOME/bin
export MANPATH=$MANPATH:$POSTGRES_HOME/man

# For eclipse using the style configuration defined in $HOME/.gtkrc-2.0
export SWT_GTK3=0

# Cassandra
export PATH=/home/lrodero/Software/apache-cassandra-3.10/bin:$PATH

# git-aware prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\] "

# conscript, required to get giter8, which in turn is needed to 
# create play applications with command like sbt new playframework/play-scala-seed.g8
# (see https://playframework.com/documentation/2.5.x/NewApplication)
export CONSCRIPT_HOME=/home/lrodero/Software/conscript
export CONSCRIPT_OPTS="-XX:MaxPermSize=512M -Dfile.encoding=UTF-8"
export PATH=$CONSCRIPT_HOME/bin:$PATH

# Install Ruby Gems to ~/Software/gems'
# (following the instructions at https://jekyllrb.com/docs/installation/#requirements)
export GEM_HOME=/home/lrodero/Software/gems
export PATH=/home/lrodero/Software/gems/bin:$PATH
