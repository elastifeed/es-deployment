# Simple makefile containing rules to start/stop eleasticsearch test setup

start-elasticsearch:
	@docker-compose -f elasticsearch/elasticsearch.yml up -d

logs-elasticsearch:
	@docker-compose -f elasticsearch/elasticsearch.yml logs

stop-selasticsearch:
	@docker-compose -f elasticsearch/elasticsearch.yml down
