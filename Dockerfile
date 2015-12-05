FROM logstash:latest
MAINTAINER Ludek Vesely <ludek.vesely@email.com>

CMD logstash -f /logstash.conf
ADD logstash.conf /logstash.conf

