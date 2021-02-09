server: BINARY = $(GOBIN)/server
server: MAIN   = ./cmd/server/main.go
server: build
.PHONY: server

server-with-race: BINARY = $(GOBIN)/server-race
server-with-race: MAIN   = ./cmd/server/main.go
server-with-race: build-with-race
.PHONY: server-with-race

client: BINARY = $(GOBIN)/client
client: MAIN   = ./cmd/client/main.go
client: build
.PHONY: client
