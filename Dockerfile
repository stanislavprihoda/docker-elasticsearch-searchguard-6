FROM docker.elastic.co/elasticsearch/elasticsearch-oss:6.6.2
USER root
WORKDIR /usr/share/elasticsearch/

RUN chown elasticsearch:elasticsearch config/elasticsearch.yml
RUN chown -R elasticsearch:elasticsearch data

# install searchguard plugin 
RUN bin/elasticsearch-plugin install -b com.floragunn:search-guard-6:6.6.2-24.2
COPY ./install_demo_configuration.sh plugins/search-guard-6/tools/
RUN chmod +x plugins/search-guard-6/tools/install_demo_configuration.sh && ./plugins/search-guard-6/tools/install_demo_configuration.sh -y

USER elasticsearch

EXPOSE 9200
