POSTGRES_HOME=/usr/local/bin
GROOVY_HOME=/usr/local/Cellar/groovy/2.1.3/libexec
GRAILS_HOME=/usr/local/Cellar/grails/2.1.1/libexec

PATH=$POSTGRES_HOME:$GROOVY_HOME:$PATH
PATH=$PATH:/opt/local/lib/swipl-5.11.32/bin/i386-darwin11.2.0/
PATH=~/Applications/Racket\ v5.3/bin/:$PATH
PATH=~/bin/:$PATH
PATH=~/Library/Haskell/ghc-7.0.4/lib/darcs-2.8.1/bin/:$PATH
PATH=~/Library/Haskell/ghc-7.0.4/lib/CCA-0.1.3/bin/:$PATH
PATH=~/Library/Haskell/ghc-7.0.4/lib/hlint-1.8.33/bin/:$PATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f "~/development/ri/trunk/settings-mirror.xml" ]; then
	export M2_SETTINGS="~/development/ri/trunk/settings-mirror.xml"
fi
if [ "X`uname`" = "XDarwin" ]; then
    export COMMAND_MODE=unix2003
fi
export JAVA_HOME=/opt/gls/ri/java-6-sun
export M2_HOME=/opt/maven/apache-maven-3.0.1
export MAVEN_OPTS="-Xmx1024m -Xms512m -XX:MaxPermSize=256m"
export ANT_HOME=/opt/ant/apache-ant-1.7.1
export ANT_OPTS="-Xmx1024m -XX:MaxPermSize=256m"
export PATH=$JAVA_HOME/bin:$M2_HOME/bin:$ANT_HOME/bin:$PATH
export BUILD_ENV_SET=true
export JBOSS_HOME=/opt/gls/ri/jboss-4.2.3.GA
export JBOSS_DEPLOY=$JBOSS_HOME/server/default/deploy

alias gvim=mvim
alias c='pbcopy'
alias isisdb='echo -ne "\033];isis db\007"; psql -U proteo -d objectTestDB; echo -ne "\033];Default\007"'
alias isistestdb='echo -ne "\033];isis test db\007"; psql -U proteo -d autoTestDB; echo -ne "\033];Default\007"'
alias sassgo='cd ~/development/isis/activity-management-ui/sass/; echo -ne "\033];compass\007"; compass watch -e production; echo -ne "\033];Default\007"; cd -'
alias ribuild='cd ~/development/ri/; mvn clean install -Dskip_tests=true -DskipTests'
alias rimigrate='cd ~/development/ri/jars/migrator/target/; java -jar migrator.jar'
alias riclient='cd ~/development/ri/jars/proteuslims/devhelper/; mvn exec:java'
alias riserver='/opt/gls/ri/jboss-4.2.3.GA/bin/run.sh -b 0.0.0.0'
alias migrate_both='cd ~/development/isis; mvn clean install -Pmigrate -Ddatabase=autoTestDB; mvn clean install -Pmigrate -Ddatabase=objectTestDB'
alias aistart='/opt/gls/ri/LIMSServerAI/current/bin/automatedinformatics.wrapper.sh start'

source ~/.aws/nick.knowlson@genologics.com/setenv.sh
#source ~/development/ri/trunk/set-env.sh

