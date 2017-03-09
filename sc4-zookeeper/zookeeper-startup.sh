#!/bin/bash

set -e

SEC=$DELAY
echo this is a zookeeper container starting with delay of $DELAY seconds

if [ -n "$DELAY" ] ;then
    echo DELAY $SEC SECONDS: sleep $SEC 
    sleep $SEC
    echo DELAY of $SEC seconds elapsed
fi

echo do: exec /opt/zookeeper/bin/zkServer.sh start-foreground
exec /opt/zookeeper/bin/zkServer.sh start-foreground
