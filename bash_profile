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

alias tails='tail -f log/development.log'

alias cdms="cd ~/Sites/moonshine/rails/moonshine/"
alias cda='cd ~/Sites/amex/openforum/amexdev'
alias cdq='cd ~/Sites/amex/openforum/amexqa'
alias cdmamp='cd /Applications/MAMP/'
alias cdd='cd ~/dotfiles'
alias cdad='cd /Volumes/amex/openforum/amexdev'

alias ebash='vim ~/.bash_profile'
alias rebash='. ~/.bash_profile'
alias ehosts='sudo mvim /etc/hosts'

alias tmamp='tail -f /Applications/MAMP/logs/*';
alias tache='tail -f /opt/local/apache2/logs/*';
alias sdock='./System/Library/CoreServices/Dock.app/Contents/MacOS/Dock'
alias vimrc='vim ~/.vimrc'
alias gvimrc='vim ~/.gvimrc'

alias jstd='java -jar ~/bin/JsTestDriver-1.3.2.jar'
alias yuic='java -jar ~/bin/yuicompressor-2.4.2/build/yuicompressor-2.4.2.jar'
alias gc='java -jar ~/bin/google-closure-compiler/compiler.jar'

set completion-ignore-case On

# Use vi key bindings
#set -o vi


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

# write a function to compute the current git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \(\1\)/'
}

#export PS1="[ \@ | \h:$WHITE\w$ENDCOLOR] $BLUE\u$ENDCOLOR$ "
#export PS1="[ $WHITE\w$ENDCOLOR ] $BLUE\u$ENDCOLOR$ "
#export PS1="$RED($ORANGE\w$RED) $WHITE\u$RED> $ENDCOLOR"
#PS1="$GREEN($LIME\w$GREEN)$RED\$(parse_rvm_status)$PURPLE\$(parse_git_branch) $WHITE\u$GREEN> $ENDCOLOR"
PS1="$GREEN($LIME\w$GREEN)$PURPLE\$(parse_git_branch) $WHITE\u$GREEN> $ENDCOLOR"


export RUBYOPT="rubygems"
export RDOCOPT="-S -f html -T hanna"

source ~/.amazon-s3

export JSTESTDRIVER_HOME=~/bin/jstestdriver

EDITOR=/usr/bin/vim;

source ~/dotfiles/completion_scripts/git_completion
complete -C ~/dotfiles/completion_scripts/rake_completion -o default rake

##
# Your previous /Users/brianwigginton/.bash_profile file was backed up as /Users/brianwigginton/.bash_profile.macports-saved_2010-08-19_at_20:05:09
##

# MacPorts Installer addition on 2010-08-19_at_20:05:09: adding an appropriate PATH variable for use with MacPorts.
export PATH=~/.gem/ruby/1.8/bin:$PATH:/opt/local/bin:/opt/local/sbin
# Finished adapting your PATH environment variable for use with MacPorts.

# add the android developer toolkit
export PATH=~/bin/:~/bin/android-sdk-mac_x86:~/bin/android-sdk-mac_x86/platform-tools/:$PATH
export PATH=~/bin/spy:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
