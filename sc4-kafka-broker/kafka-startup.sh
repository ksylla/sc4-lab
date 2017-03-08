#!/bin/bash

set -e

ZKS=$(
   IFS=','
   read -r TTT <<< "$ZOOKEEPER_SERVERS"
   echo ${TTT}
)
echo $0 await one of $ZKS

# await at least one zookeeper beeing available
echo $0 ===== AWAIT =====
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

echo $0 ===== EXECUTE =====

(   # check for initialization finished
    echo $0 : check kafka broker at $HOST:$PORT
    HOST=localhost
    PORT=9092
    until nc -z $HOST $PORT ; do
        >&2 echo $0 "$HOST:$PORT is not yet initialized - waiting"
        sleep 1
    done
    echo kafka broker $HOST:$PORT is available
    # ensure topics be available / provided
    # create-topic taxi
    echo ===== FINISHED =====
) & # required: execute parallel

echo $0 START KAFKA BROKER
exec /app/bin/kafka-server-start.sh /app/config/server.properties --override zookeeper.connect=$ZOOKEEPER_SERVERS
