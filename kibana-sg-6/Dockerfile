FROM docker.elastic.co/kibana/kibana-oss:6.6.2
USER root
WORKDIR /usr/share/kibana/

RUN chown kibana:kibana config/kibana.yml

# install searchguard Kibana plugin
RUN NODE_OPTIONS="--max-old-space-size=8192" bin/kibana-plugin install https://repo1.maven.org/maven2/com/floragunn/search-guard-kibana-plugin/6.6.2-18.3/search-guard-kibana-plugin-6.6.2-18.3.zip

USER kibana

EXPOSE 5601
