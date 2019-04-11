# Elastifeed infrastructure scripts

**!!! DEVELOPMENT !!!** deployment of Elasticsearch and Kibana


# How to use it?

Make sure to have the latest version of [Docker](https://github.com/docker/docker-install#usage) installed on your system.

## Make-targets

  - `make start-elasticsearch` Spins up one [Elasticsearch](https://www.elastic.co/de/products/elasticsearch) instance and additionally [Kibana](https://www.elastic.co/de/products/kibana)
  - `make stop-elasticsearch` Stops the previously started deployment
  - `make logs-elasticsearch` Shows log output of the deployment

## Access

  *Elasticsearch* can be accessed on `(localhost|hostip):9200` ([click](http://localhost:9200))

  *Kibana* can be accessed on `(localhost|hostip):5601` ([click](http://localhost:5601))
