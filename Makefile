
build-local:
	docker build -t summary-local -f Dockerfile ./

build-service:
	docker build --name summary-service -t summary-service -f Dockerfile.service ./

run-service: build-service
	docker run --rm -it --name summary-service -p 18080:8080 summary-service:latest

test-local: build-local
	docker run --rm --name summary-local summary-local:latest bash -i -c "pytest"
