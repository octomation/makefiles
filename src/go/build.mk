BINARY  ?= $(BINPATH)/$(shell basename $(MAIN))
BINPATH ?= $(PWD)/bin/$(OS)/$(ARCH)
COMMIT  ?= $(shell git rev-parse --verify HEAD)
DATE    ?= $(shell date +%Y-%m-%dT%T%Z)
LDFLAGS ?= -ldflags "-s -w -X main.commit=$(COMMIT) -X main.date=$(DATE)"
MAIN    ?= $(MODULE)

export GOBIN := $(BINPATH)
export PATH  := $(BINPATH):$(PATH)

build-env:
	@echo "BINARY:      $(BINARY)"
	@echo "BINPATH:     $(BINPATH)"
	@echo "COMMIT:      $(COMMIT)"
	@echo "DATE:        $(DATE)"
	@echo "GOBIN:       `go env GOBIN`"
	@echo "LDFLAGS:     $(LDFLAGS)"
	@echo "MAIN:        $(MAIN)"
	@echo "PATH:        $$PATH"
.PHONY: build-env

build:
	@go build -o $(BINARY) $(LDFLAGS) $(MAIN)
.PHONY: build

build-clean:
	@rm -f $(BINARY)
.PHONY: build-clean

install:
	@go install $(LDFLAGS) $(MAIN)
.PHONY: install

install-clean:
	@go clean -cache
.PHONY: install-clean
