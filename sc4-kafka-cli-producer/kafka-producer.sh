#!/bin/bash


until /app/bin/kafka-topics.sh --zookeeper $ZOOKEEPER_SERVERS --list | fgrep -q taxi ;do
    >&2 echo "XXX topic taxi is unavailable - waiting"
    sleep 1
done
echo $0 OK topic taxi is available

/app/bin/kafka-console-producer.sh --broker-list $KAFKA_BROKER_LIST --topic taxi <<EOF
initial line from producer
EOF
echo $0 console producer stopped

echo $0 keep the container active: nc -l 8888 
nc -l 8888
