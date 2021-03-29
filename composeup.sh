#!/bin/sh

dockerbuild.sh 

echo Run nodewebapp up

docker run -it -d -p 3070:3070 nodewebapp:v2