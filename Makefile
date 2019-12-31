.env:
	cp env.sample .env
build: .env
	docker-compose build
bash: .env
	docker-compose run --rm app bash
v: .env
	ENTRYPOINT=terraform docker-compose run --rm app -v
	ENTRYPOINT=aws docker-compose run --rm app --version
