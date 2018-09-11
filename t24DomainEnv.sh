export USER_MEM_ARGS="-Xms2g -Xmx4g"
export MEM_ARGS="${USER_MEM_ARGS}"
export TAFJ_HOME=/TAFJ
export T24_HOME=/T24/JARS
export EXPORT EXT_PRE_CLASSPATH=/TAFJ/lib/antlr.jar
export TAFJ_T24_CLASSPATH="$TAFJ_HOME/lib/log4j-api.jar:$TAFJ_HOME/lib/TemenosSecurity.jar:$TAFJ_HOME/lib/TAFJCommon.jar:$TAFJ_HOME/lib/TAFJCache.jar:$TAFJ_HOME/lib/cache-api.jar:$TAFJ_HOME/lib/TAFJCompiler.jar:$TAFJ_HOME/lib/TAFJCore.jar:$TAFJ_HOME/lib/TAFJClient.jar:$TAFJ_HOME/lib/TAFJLocking.jar:$TAFJ_HOME/lib/TAFJLogging.jar:$TAFJ_HOME/lib/TAFJVersion.jar:$TAFJ_HOME/ext/TAFJBASIC.jar:$TAFJ_HOME/ext/tComponentFramework.jar"
export TAFJ_T24_CLASSPATH=$TAFJ_T24_CLASSPATH:$TAFJ_HOME/dbdrivers/h2-1.3.161/*:$T24_HOME/*
export EXT_POST_CLASSPATH=$TAFJ_T24_CLASSPATH

#export CLASSPATH=$CLASSPATH:$TAFJ_T24_CLASSPATH