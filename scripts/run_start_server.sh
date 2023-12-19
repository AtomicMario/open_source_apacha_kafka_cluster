#!/bin/bash

sed -i s/localhost:2181/$ZOOKEEPER_HOST:$ZOOKEEPER_PORT/g $KAFKA_PATH/config/server.properties

sed -i s/broker.id=0/broker.id=$BROKER_ID/g config/server.properties

$KAFKA_PATH/bin/kafka-server-start.sh $KAFKA_PATH/config/server.properties
