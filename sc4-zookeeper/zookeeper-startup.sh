#!/bin/bash

set -e

SEC=$DELAY
echo this is a zookeeper container statring with delay $DELAY seconds

if [ -n "$DELAY" ] ;then
    echo TEST-DELAY SECONDS $SEC
    sleep $SEC
    echo TEST-DELAY SECONDS $SEC elapsed
fi

echo do: exec /opt/zookeeper/bin/zkServer.sh start-foreground
exec /opt/zookeeper/bin/zkServer.sh start-foreground
