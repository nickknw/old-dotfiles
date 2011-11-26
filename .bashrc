if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export JAVA_HOME=/usr/lib/jvm/java-6-openjdk/
export GRAILS_HOME=~/grails/grails-1.3.7/
export PATH=$GRAILS_HOME/bin/:$PATH
