#!/bin/bash

set -e

ZKS=$(
   IFS=','
   read -r TTT <<< "$ZOOKEEPER_SERVERS"
   echo ${TTT}
)
echo $0 await one of $ZKS

# await at least one zookeeper beeing available
while true ;do
    for ZK in $ZKS ;do
        NCDEST=$(
          IFS=':'
          read -r TTT <<< "$ZK"
          echo $TTT
        )
        echo do: nc -z $NCDEST
        if nc -z $NCDEST ;then
            break 2  # OK: this zookeeper is available
        fi
    done
    >&2 echo "none of $ZOOKEEPER_SERVERS is yet available - waiting"
    sleep 1
done

echo $0 START KAFKA BROKER
exec /app/bin/kafka-server-start.sh /app/config/server.properties --override zookeeper.connect=$ZOOKEEPER_SERVERS
