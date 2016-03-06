#!/bin/bash

if [ "$1" = 'logstash' ]; then
	sed -i "s/ELASTICSEARCH_HOSTS/${ELASTICSEARCH_HOSTS}/g" /logstash.conf
	sed -i "s/ELASTICSEARCH_USER/${ELASTICSEARCH_USER}/g" /logstash.conf
	ELASTICSEARCH_PASSWORD=$(sed 's|/|\\/|g' <<< $ELASTICSEARCH_PASSWORD)
	sed -i "s/ELASTICSEARCH_PASSWORD/${ELASTICSEARCH_PASSWORD}/g" /logstash.conf
	
	COUNTER=1
	while ! curl -s "$ELASTICSEARCH_HOSTS" >/dev/null; do 
		echo -e "Connection to elasticsearch refused";
		sleep 3;
		COUNTER=$[$COUNTER +1]
		if [ $COUNTER -gt 20 ]; then
			echo -e "Unable to connect to elasticsearch!";
			exit 1
		fi
	done
	echo -e "Connection to elasticsearch secceeded";
fi

/docker-entrypoint.sh "$@"
