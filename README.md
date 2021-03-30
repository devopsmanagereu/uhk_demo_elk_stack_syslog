# ELK stack with configuration for syslog

## Notes
Default port for syslog is 514, however in docker it would need higher privileges, because ports up to 1000 are dedicated to system.  
In our case we use 5140.  
Forward to logstash https://www.tecmint.com/setup-rsyslog-client-to-send-logs-to-rsyslog-server-in-centos-7/  
Syslog example in Packet Tracer https://www.youtube.com/watch?v=LSMegsNQti4  
Logger levels https://man7.org/linux/man-pages/man1/logger.1.html

## Testing on CentOS
```
yum install -y nc
echo -n "test message" | nc -4u -w1 <host> <udp port>
echo -n "<100>Mar 23 21:31:04 10.10.10.4 postfix/smtpd[31499]: Test message" | nc -4u -w1 10.10.10.4 5140
```

## For testing rsyslog directly on CentOS, it is necessary to disable selinux
```
/etc/selinux/config -> disabled
```

## Docker images build
```
cd docker-simulations
docker build -t switch1 --build-arg TYPEARG=switch1 .
docker build -t switch2 --build-arg TYPEARG=switch2 .
docker build -t switch3 --build-arg TYPEARG=switch3 .
docker build -t router --build-arg TYPEARG=router .
docker build -t firewall --build-arg TYPEARG=firewall .
```

## Starting docker containers
```
docker run -d --network elk-docker_elk_stack_network router
docker run -d --network elk-docker_elk_stack_network switch1
docker run -d --network elk-docker_elk_stack_network switch2
docker run -d --network elk-docker_elk_stack_network switch3
docker run -d --network elk-docker_elk_stack_network firewall
```
