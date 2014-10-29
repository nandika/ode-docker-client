ode-docker-client
============

Apache ODE Docker based build client.

A shell script ode-docker-client.sh used to initiate a docker container for building Apache ODE source code. 

Docker container run as root user and the artifacts created from the build are under root permissions. The shell script addresses the problem by taking in the information of the login user and running the buildr process with in the docker container as the login user.

Usage:
copy the shell script to the directory where Apache ODE source code exists.

./ode-docker-client.sh clean package test=all

Thanks:
The shell script is based on the post http://marmelab.com/blog/2014/09/10/make-docker-command.html 
Apache Buildr docker image created by vanto

