# TODO:refactor support relative path
include src/go/build.tool.mk

server: BINARY = $(GOBIN)/server
server: MAIN   = ./cmd/server/main.go
server: ;
.PHONY: server

client: BINARY = $(GOBIN)/client
client: MAIN   = ./cmd/client/main.go
client: ;
.PHONY: client
