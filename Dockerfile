FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y \
    default-jdk \
    wget 
RUN rm -rf /var/lib/apt/lists/*

ENV KAFKA_PATH=/usr/local/kafka
ENV PATH=$KAFKA_PATH:$KAFKA_PATH/bin:$PATH
ENV ZOOKEEPER_HOST=apache-zookeeper-server
ENV ZOOKEEPER_PORT=2181
ENV KAFKA_PORT=9092

RUN wget https://dlcdn.apache.org/kafka/3.6.0/kafka_2.13-3.6.0.tgz && \
    tar xzf kafka_2.13-3.6.0.tgz && \
    mv kafka_2.13-3.6.0 $KAFKA_PATH && \
    rm -rf kafka_2.13-3.6.0.tgz

COPY scripts $KAFKA_PATH

WORKDIR $KAFKA_PATH

RUN chmod +x *.sh

EXPOSE 2181 9092
