#!/bin/bash

set -e

IFS=':'
read -r -a RESULT <<< "$KAFKA_BROKER"
HOST=${RESULT[0]}
PORT=${RESULT[1]}
IFS=' '
        
        
echo $0 : check kafka broker at $HOST:$PORT
if [ -n "$PORT" -a -n "$HOST" ] ;then
    until nc -z $HOST $PORT ; do
        echo waiting for $HOST $PORT
        >&2 echo "$HOST:$PORT is unavailable - sleeping"
        sleep 1
    done
    echo "$HOST:$PORT is available"
fi


echo MAKE KAFKA TOPIC

MAKETOPIC_CMD="/app/bin/kafka-topics.sh --zookeeper $ZOOKEEPER_SERVERS \
     --create --topic taxi \
     --partitions 1 --replication-factor 1"

echo $MAKETOPIC_CMD
exec $MAKETOPIC_CMD

