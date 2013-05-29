# Use bash-completion, if available
if [ -f `brew --prefix`/etc/bash_completion ]; then
   .  `brew --prefix`/etc/bash_completion
fi

PS1='\u@\h:\w$(__git_ps1 " (%s)")\$ '

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

PATH=~/bin/:$PATH
PATH=~/Library/Haskell/ghc-7.0.4/lib/darcs-2.8.1/bin/:$PATH
PATH=~/Library/Haskell/ghc-7.0.4/lib/CCA-0.1.3/bin/:$PATH
PATH=~/Library/Haskell/ghc-7.0.4/lib/hlint-1.8.33/bin/:$PATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH
export INPUTRC=~/.inputrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#export JAVA_HOME=/usr/lib/jvm/java-6-openjdk/
#export GRAILS_HOME=~/grails/grails-1.3.7/
#export PATH=$GRAILS_HOME/bin/:$PATH

source ~/.autojump/etc/profile.d/autojump.bash

