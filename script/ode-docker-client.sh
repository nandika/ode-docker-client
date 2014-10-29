#!/bin/sh
echo $@

BUILDR_ARGS="$@"
CONTAINER_USERNAME="dummy"
CONTAINER_GROUPNAME="dummy"
HOMEDIR="/home/$CONTAINER_USERNAME"
GROUP_ID=$(id -g)
USER_ID=$( id -u)

CREATE_USER_COMMAND="groupadd -f -g $GROUP_ID $CONTAINER_GROUPNAME && useradd -u $USER_ID -g $CONTAINER_GROUPNAME $CONTAINER_USERNAME && mkdir --parent $HOMEDIR && chown -R $CONTAINER_USERNAME:$CONTAINER_GROUPNAME $HOMEDIR &&"

docker run --rm -e JAVADOC=no -e JAVA_OPTS -v `pwd`:/workspace -v $HOME/.m2:/home/dummy/.m2 --entrypoint bash vanto/apache-buildr:latest-jruby-jdk7 -c "$CREATE_USER_COMMAND su $CONTAINER_USERNAME -c '/opt/jruby/bin/jruby -S buildr $BUILDR_ARGS'" 

