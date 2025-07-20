build:
	docker build . -t nightlybible/hysteria
push:
	docker push nightlybible/hysteria
all: build push