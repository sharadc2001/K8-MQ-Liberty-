#!/bin/bash
docker run -v F:/dockermount/sender:/usr/src/sender -w /usr/src/sender maven mvn clean package
docker run -v F:/dockermount/receiver:/usr/src/receiver -w /usr/src/receiver maven mvn clean package
cp sender/target/sender.war liberty-sender
cp receiver/target/receiver.war liberty-receiver

# Build the images
docker build mq -t sampledockermq_mqfull:1.0
docker build liberty-sender -t sampledockermq_sender:1.0
docker build liberty-receiver -t sampledockermq_receiver:1.0