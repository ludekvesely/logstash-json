#!/bin/bash

if [ "$1" = 'logstash' ]; then
	sed -i "s/ELASTICSEARCH_HOSTS/${ELASTICSEARCH_HOSTS}/g" /logstash.conf
	sed -i "s/ELASTICSEARCH_USER/${ELASTICSEARCH_USER}/g" /logstash.conf
	sed -i "s/ELASTICSEARCH_PASSWORD/${ELASTICSEARCH_PASSWORD}/g" /logstash.conf
fi

/docker-entrypoint.sh "$@"

