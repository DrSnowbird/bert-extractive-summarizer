
build-local:
	docker build -t summary-local -f Dockerfile ./

build-service:
	docker build -t summary-service -t summary-service -f Dockerfile.service ./

run-service: build-service
	docker run --name summary-service -rm -it  -p 18080:8080 summary-service:latest

test-local: build-local
	docker run --name summary-local --rm summary-local:latest bash -i -c "pytest"
