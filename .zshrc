# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dpoggi"
DEFAULT_USER="nick.knowlson"

# good lord this is annoying. It doesn't even recognize mvim or tree ffs
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git rake rvm osx bundler brew autojump colored-man grails svn)

# Customize to your needs...
source $ZSH/oh-my-zsh.sh
source ~/.profile
source ~/.aliases

export PATH=$PATH:/Users/nick.knowlson/.autojump/bin:/Users/nick.knowlson/.rvm/gems/ruby-1.9.3-p385/bin:/Users/nick.knowlson/.rvm/gems/ruby-1.9.3-p385@global/bin:/Users/nick.knowlson/.rvm/rubies/ruby-1.9.3-p385/bin:/Users/nick.knowlson/.rvm/bin:/Users/nick.knowlson/Library/Haskell/ghc-7.0.4/lib/hlint-1.8.33/bin/:/Users/nick.knowlson/Library/Haskell/ghc-7.0.4/lib/CCA-0.1.3/bin/:/Users/nick.knowlson/Library/Haskell/ghc-7.0.4/lib/darcs-2.8.1/bin/:/Users/nick.knowlson/bin/:'/Users/nick.knowlson/Applications/Racket v5.3/bin/':/usr/local/bin:/usr/local/Cellar/groovy/2.1.3/libexec:/opt/grails/grails-1.3.7/bin:/opt/maven/apache-maven-3.0.1/bin:/opt/ant/apache-ant-1.7.1/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/opt/local/lib/swipl-5.11.32/bin/i386-darwin11.2.0/:/Users/nick.knowlson/.rvm/bin
