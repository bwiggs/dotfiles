# Global Settings
set completion-ignore-case On

# Global Variables
export RUBYOPT="rubygems"
export RDOCOPT="-S -f html"
export JSTESTDRIVER_HOME=~/bin/jstestdriver
export EDITOR=/usr/bin/vim;

# Comletion Scripts
source ~/dotfiles/completion_scripts/git_completion
complete -C ~/dotfiles/completion_scripts/rake_completion -o default rake

# ls command aliases
alias ls="ls -G"
alias ll="ls -lh"
alias l="ll"
alias lll="ll"
alias la="ll -a"
alias lla="ll -a"
alias lsa="ls -a"
alias lt='ll -t'
alias lrt='ll -rt'
alias lart="ll -lart"
alias lsd="ls -d */"
alias lld="ll -d */"

# quick dir changes
alias cdmamp='cd /Applications/MAMP/'
alias cdd='cd ~/dotfiles'

# quick commands
alias tails='tail -f log/development.log'
alias ebash='vim ~/.bash_profile'
alias rebash='. ~/.bash_profile'
alias ehosts='sudo mvim /etc/hosts'
alias tmamp='tail -f /Applications/MAMP/logs/*';
alias tache='tail -f /var/log/apache2/*';
alias vimrc='vim ~/.vimrc'
alias gvimrc='vim ~/.gvimrc'
alias rmlogs="sudo rm -f /private/var/log/asl/*.asl"
alias ephp="sudo vim /etc/php.ini"
alias apr="sudo apachectl restart"

# local machine settings
local_profile=~/.local_profile
if [ -f $local_profile ]; then
	source $local_profile
fi

# local amazon settings
amazon_config="~/.amazon-s3"
if [ -f $amazon_config ]; then
	source $amazon_config
fi

# Colors
BLACK="\[\e[0;30m\]"
BLUE="\[\e[1;34m\]"
GREEN="\[\e[0;32m\]"
LIME="\[\e[1;32m\]"
CYAN="\[\e[0;36m\]"
ORANGE="\[\e[1;31m\]"
RED="\[\e[0;31m\]"
PURPLE="\[\e[0;35m\]"
BROWN="\[\e[0;33m\]"
WHITE="\[\e[1;37m\]"
ENDCOLOR="\[\e[m\]"

# parse rvm current status
parse_rvm_status() {
  rvm current 2> /dev/null
}

# get the current git branch name
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \(\1\)/'
}

# Command Prompts
#export PS1="[ \@ | \h:$WHITE\w$ENDCOLOR] $BLUE\u$ENDCOLOR$ "
#export PS1="[ $WHITE\w$ENDCOLOR ] $BLUE\u$ENDCOLOR$ "
#export PS1="$RED($ORANGE\w$RED) $WHITE\u$RED> $ENDCOLOR"
#PS1="$GREEN($LIME\w$GREEN)$RED\$(parse_rvm_status)$PURPLE\$(parse_git_branch) $WHITE\u$GREEN> $ENDCOLOR"
#PS1="$GREEN($LIME\w$GREEN)$PURPLE\$(parse_git_branch) $WHITE\u$GREEN> $ENDCOLOR"
PS1="$BLUE($CYAN\w$BLUE)\$(parse_git_branch) $WHITE>$ENDCOLOR "

# PATHs
export PATH=~/bin:~/bin/android-sdk-mac_x86:~/bin/android-sdk-mac_x86/platform-tools:$PATH
export PATH=~/bin/spy:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=~/Sites/amex/travel_insiders/code/repo/www/lib/Cake/Console:$PATH
export PATH="$PATH"
export NODE_PATH="~/node_modules:/usr/local/lib/node_modules:/usr/local/bin/"
export NODE_PATH='/usr/local/lib/jsctags:${NODE_PATH}'
################################################################
# DO NOT EDIT BELOW THIS LINE
################################################################

# MacPorts Installer addition on 2010-08-19_at_20:05:09: adding an appropriate PATH variable for use with MacPorts.
export PATH=~/.gem/ruby/1.8/bin:$PATH:/opt/local/bin:/opt/local/sbin
# Finished adapting your PATH environment variable for use with MacPorts.

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# pythonbrew
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

# source ~/dotfiles/python-dev-env.sh
