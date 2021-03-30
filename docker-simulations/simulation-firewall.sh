#!/bin/bash

service rsyslog start

for i in {0..1000}
do
  seg1=$(( RANDOM % 250  + 1 ))
  seg2=$(( RANDOM % 250  + 1 ))
  seg3=$(( RANDOM % 250  + 1 ))
  seg4=$(( RANDOM % 250  + 1 ))
  rand=$(( RANDOM % 10 ))

  for j in $(eval echo "{0..$rand}")
  	do
  		echo "Dropping packet from host $seg1.$seg2.$seg3.$seg4"
		  logger -p "local2.err" "Dropping packet from host $seg1.$seg2.$seg3.$seg4"
		  rand2=$(( RANDOM % 9))
		  sleep 0.0$rand2
	  done
	  echo "Sleeping for $rand"
    sleep $rand
done
echo "Shutting down"
logger "Shutting down"
sleep 5
