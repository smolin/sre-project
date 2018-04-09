# Obs:
build:
	docker build -f docker/elasticsearch.dkr -t sre-elasticsearch docker
	docker build -f docker/logstash.dkr -t sre-logstash docker
	docker build -f docker/kibana.dkr -t sre-kibana docker

up:
	vagrant up

test:
	curl kibana.local:5401

destroy:
	vagrant destroy -f

cert:
	ssh-keygen -f local.kibana.sre-project
	openssl req -new -key local.kibana.sre-project -out local.kibana.sre-project.csr
	openssl x509 -req -days 365 -in local.kibana.sre-project.csr -signkey local.kibana.sre-project -out local.kibana.sre-project.crt

encrypt-key:
	ansible-vault encrypt --output=- secret/local.kibana.sre-project

encrypt-crt:
	ansible-vault encrypt --output=- secret/local.kibana.sre-project.crt
