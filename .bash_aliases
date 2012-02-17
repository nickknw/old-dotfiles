alias ls='ls -G'
alias vi=gvim
alias l='ls -1'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias ps?='ps -ef | grep -v grep | grep PID; ps -ef | grep -v grep | grep '
alias ba='vi ~/.bash_aliases'
alias sba='source ~/.bash_aliases'
alias vrc='vi ~/.vimrc'
alias vidir="for file in * ; do echo -e '\n\n'--$file--'\n'; cat $file;  done | vim - "
alias apt-i="sudo apt-get install"
alias apt-s="apt-cache search"
alias start_postgres="sudo su - postgres -c '/usr/local/bin/postgres -D /opt/local/var/db/postgresql91/data &'"
