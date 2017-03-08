#!/bin/bash

set -e

echo $0 START KAFKA BROKER
exec /app/bin/kafka-server-start.sh /app/config/server.properties --override zookeeper.connect=$ZOOKEEPER_SERVERS
