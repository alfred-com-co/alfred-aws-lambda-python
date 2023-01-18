build-and-start:
	docker compose up --build -d

start:
	docker compose up -d

clean:
	docker compose down -v

stop:
	docker compose down

bash:
	docker exec -it lambda-function-project-container bash

coverage-html:
	docker exec -it lambda-function-project-container python -m coverage html

coverage-report:
	docker exec -it lambda-function-project-container python -m coverage report

test:
	docker exec -it lambda-function-project-container python -m coverage run -m unittest tests

test-and-report: test coverage-report
