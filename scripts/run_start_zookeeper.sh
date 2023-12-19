#!/bin/bash

sed -i s/localhost:2181/$ZOOKEEPER_HOST:$ZOOKEEPER_PORT/g $KAFKA_PATH/config/server.properties

$KAFKA_PATH/bin/zookeeper-server-start.sh $KAFKA_PATH/config/zookeeper.properties
