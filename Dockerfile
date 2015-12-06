FROM logstash:latest
MAINTAINER Ludek Vesely <ludek.vesely@email.com>

EXPOSE 12345/tcp 12345/udp
CMD ["logstash", "-f", "/logstash.conf"]
ADD logstash.conf /logstash.conf

