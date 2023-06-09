ifndef ENV
	ENV=dev
endif

PROJECT_NAME=laravel-example

provision:
	docker-compose -f environment/ci.yml up --build --force-recreate

upd: dotenv
	docker-compose -f environment/$(ENV).yml up -d --force-recreate

up: dotenv
	docker-compose -f environment/$(ENV).yml up --force-recreate

test:
	docker-compose -p 'tests' -f environment/test.yml up -d

stop:
	docker-compose -f environment/$(ENV).yml stop

down:
	docker-compose -f environment/$(ENV).yml down

down-test:
	docker-compose -p 'tests' -f environment/test.yml down

dotenv:
	cp app/.env.$(ENV) app/.env

stopdockers:
	docker stop $(shell docker ps -a -q)