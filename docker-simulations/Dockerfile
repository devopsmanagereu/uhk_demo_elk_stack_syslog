FROM ubuntu

RUN apt-get update &&\
    apt-get -y install rsyslog

ARG TYPEARG=router

ENV TYPEENV=$TYPEARG

COPY remote.conf /etc/rsyslog.d/remote.conf

RUN sed -i '/imklog/s/^/#/' /etc/rsyslog.conf

COPY simulation-$TYPEENV.sh /

RUN chmod +x /simulation-$TYPEENV.sh

CMD ["bash", "-c", "/simulation-$TYPEENV.sh"]
