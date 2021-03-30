#!/bin/bash

service rsyslog start

for i in {0..1000}
do
  rand=$(( RANDOM % 24))
  echo "MAC address mismatch. Unknown address 00:1B:44:11:3A:B7 on Interface FE$rand"
  logger -p "local0.crit" "MAC address mismatch. Unknown address 00:1B:44:11:3A:B7 on Interface FE$rand"
  rand2=$(( RANDOM % 10 + 10))
  echo "Sleeping for $rand2"
  sleep $rand2
done
sleep 3
echo "Shutting down"
logger "Shutting down"
sleep 5
