alias ls='ls --color=auto'
alias vi=gvim
alias l='ls -1'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias ps?='ps aux | grep -v grep | grep '
alias ba='vi ~/.bash_aliases'
alias sba='source ~/.bash_aliases'
alias vrc='vi ~/.vimrc'
alias vidir="for file in * ; do echo -e '\n\n'--$file--'\n'; cat $file;  done | vim - "
