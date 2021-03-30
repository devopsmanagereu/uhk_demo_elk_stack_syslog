#!/bin/bash

service rsyslog start

for i in {0..10}
do
  rand=$(( RANDOM % 24))
  echo "Interface FE$rand down"
  logger -p "local0.info" "Interface FE$rand down"
  rand2=$(( RANDOM % 10))
  echo "Sleeping for $rand2"
  sleep $rand2
  echo "Interface FE$rand up"
  logger -p "local0.info" "Interface FE$rand up"
  rand3=$(( RANDOM % 10))
  echo "Sleeping for $rand3"
  sleep $rand3
done
sleep 3
echo "Shutting down"
logger "Shutting down"
sleep 5
