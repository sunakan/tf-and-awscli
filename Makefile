build:
	DIR=${DIR} docker-compose build
ash-aws:
	DIR=${DIR} ENTRYPOINT="" docker-compose run --rm aws ash
ash-tf:
	DIR=${DIR} ENTRYPOINT="" docker-compose run --rm tf ash
v:
	ENTRYPOINT=terraform docker-compose run --rm tf -v
	ENTRYPOINT=aws docker-compose run --rm aws --version

init:
	ENTRYPOINT=terraform DIR=${DIR} docker-compose run --rm tf init
get:
	ENTRYPOINT=terraform DIR=${DIR} docker-compose run --rm tf get
fmt:
	ENTRYPOINT=terraform DIR=${DIR} docker-compose run --rm tf fmt -recursive
plan:
	ENTRYPOINT=terraform DIR=${DIR} docker-compose run --rm tf plan ${ARGS}
apply:
	ENTRYPOINT=terraform DIR=${DIR} docker-compose run --rm tf apply ${ARGS}
destroy:
	ENTRYPOINT=terraform DIR=${DIR} docker-compose run --rm tf destroy
