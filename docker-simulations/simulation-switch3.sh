#!/bin/bash

service rsyslog start

echo "Booting"
logger "Booting"
sleep 30
echo "Boot error"
logger -p "local0.crit" "Boot error"
sleep 5
