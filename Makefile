all: build

build:
	@docker build --tag=grtools:latest .

release: build
	@docker build --tag=grtools:$(shell cat VERSION) .
