#!/bin/bash


until /app/bin/kafka-topics.sh --zookeeper $ZOOKEEPER_SERVERS --list | fgrep -q taxi ;do
    >&2 echo "XXX topic taxi is unavailable - waiting"
    sleep 1
done
echo XXX OK topic taxi is available

/app/bin/kafka-console-consumer.sh --zookeeper $ZOOKEEPER_SERVERS --from-beginning --topic taxi
