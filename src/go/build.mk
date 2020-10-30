BINARY  ?= `go env GOBIN`/$(shell basename $(MAIN))
COMMIT  ?= $(shell git rev-parse --verify HEAD)
DATE    ?= $(shell date +%Y-%m-%dT%T%Z)
LDFLAGS ?= -ldflags "-s -w -X main.commit=$(COMMIT) -X main.date=$(DATE)"
MAIN    ?= $(MODULE)

build-env:
	@echo "BINARY:      $(BINARY)"
	@echo "COMMIT:      $(COMMIT)"
	@echo "DATE:        $(DATE)"
	@echo "LDFLAGS:     $(LDFLAGS)"
	@echo "MAIN:        $(MAIN)"
.PHONY: build-env

build:
	@go build -o $(BINARY) $(LDFLAGS) $(MAIN)
.PHONY: build

build-with-race:
	@go build -race -o $(BINARY) $(LDFLAGS) $(MAIN)
.PHONY: build-with-race

build-clean:
	@rm -f $(BINARY)
.PHONY: build-clean

install:
	@go install $(LDFLAGS) $(MAIN)
.PHONY: install

install-clean:
	@go clean -cache
.PHONY: install-clean
