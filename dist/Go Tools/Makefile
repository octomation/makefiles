.DEFAULT_GOAL = install

SHELL = /bin/bash -euo pipefail

BINPATH     = $(shell dirname $(PWD))/bin
GO111MODULE = on
GOFLAGS     = -mod=vendor
GOPRIVATE   =
GOPROXY     = https://proxy.golang.org,https://gocenter.io,direct

export PATH := $(BINPATH):$(PATH)

.PHONY: tools-env
tools-env:
	@echo "BINPATH:     $(BINPATH)"
	@echo "GO111MODULE: $(shell go env GO111MODULE)"
	@echo "GOFLAGS:     $(strip $(shell go env GOFLAGS))"
	@echo "GOPRIVATE:   $(strip $(shell go env GOPRIVATE))"
	@echo "GOPROXY:     $(strip $(shell go env GOPROXY))"

.PHONY: brew
brew:
	@brew bundle

.PHONY: deps
deps:
	@go mod tidy && go mod vendor && go mod verify

.PHONY: update
update:
	@go get -tags=integration,tools -mod= -u

.PHONY: build
build:
	@egg --build
	@mv bin/* $(BINPATH) && rm -rf bin

.PHONY: egg
egg:
	@go get -d -mod= -u github.com/kamilsk/egg
	@go build -mod= -o $(BINPATH)/egg github.com/kamilsk/egg


.PHONY: install
install: egg build
