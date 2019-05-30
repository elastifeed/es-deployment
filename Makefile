development:
	@kubectl apply -f namespace.yaml
	@kubectl apply -f elasticsearch_remote.yaml
	@kubectl apply -f es_pusher.yaml
	@kubectl apply -f es_rss.yaml
	@kubectl apply -f es_extractor.yaml
