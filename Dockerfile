FROM fluent/fluentd:latest

USER root

# Installation des plugins Ruby pour Elasticsearch + OpenSearch (OpenDistro)
RUN apk add --no-cache --update --virtual .build-deps \
      build-base ruby-dev \
  && gem install \
      fluent-plugin-elasticsearch \
      fluent-plugin-opensearch \
  && apk del .build-deps \
  && rm -rf /var/cache/apk/* /usr/lib/ruby/gems/*/cache/*.gem

# On laisse la config par défaut de l'image fluent/fluentd
USER fluent
