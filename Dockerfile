FROM docker.elastic.co/elasticsearch/elasticsearch:7.15.2
COPY --chown=elasticsearch:elasticsearch elasticsearch.yml /usr/share/elasticsearch/config/
COPY --chown=elasticsearch:elasticsearch elasticsearch.keystore /usr/share/elasticsearch/config/
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch repository-azure