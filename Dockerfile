FROM docker.elastic.co/elasticsearch/elasticsearch:7.15.2
COPY --chown=elasticsearch:elasticsearch elasticsearch.yml /usr/share/elasticsearch/config/