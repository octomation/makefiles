# TODO:refactor support relative path
include src/go/build.tool.mk

client:
	$(eval BINARY := $(GOBIN)/client)
	$(eval MAIN := ./cmd/client/main.go)
	@true
.PHONY: client

server:
	$(eval BINARY := $(GOBIN)/server)
	$(eval MAIN := ./cmd/server/main.go)
	@true
.PHONY: server
