FROM logstash:2.1.0
MAINTAINER Ludek Vesely <ludek.vesely@email.com>

EXPOSE 12345/tcp 12345/udp
CMD ["logstash", "-f", "/logstash.conf"]
ENTRYPOINT ["/run.sh"]

ENV ELASTICSEARCH_HOSTS localhost:9200
ENV ELASTICSEARCH_USER foo
ENV ELASTICSEARCH_PASSWORD bar

ADD run.sh /run.sh
RUN chmod +x /run.sh

ADD logstash.conf /logstash.conf

