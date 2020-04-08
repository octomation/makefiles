.PHONY: go1.11-alpine
go1.11-alpine:
	docker run \
		--rm -it \
		-v $(PWD):/src \
		-w /src \
		golang:1.11-alpine bash

.PHONY: go1.12-alpine
go1.12-alpine:
	docker run \
		--rm -it \
		-v $(PWD):/src \
		-w /src \
		golang:1.12-alpine bash

.PHONY: go1.13-alpine
go1.13-alpine:
	docker run \
		--rm -it \
		-v $(PWD):/src \
		-w /src \
		golang:1.13-alpine bash

.PHONY: go1.14-alpine
go1.14-alpine:
	docker run \
		--rm -it \
		-v $(PWD):/src \
		-w /src \
		golang:1.14-alpine bash
