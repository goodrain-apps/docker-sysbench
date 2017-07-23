all: build

build:
	@docker build --tag=sysbench:latest .

release: build
	@docker build --tag=sysbench:$(shell cat VERSION) .
