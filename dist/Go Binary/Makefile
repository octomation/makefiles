SHELL = /bin/bash -euo pipefail

GO111MODULE = on
GOFLAGS     = -mod=vendor
MODULE      = $(shell go list -m)
PACKAGES    = $(shell go list ./...)
PATHS       = $(shell go list ./... | sed -e "s|\s+$(shell go list -m)/\{0,1\}||g")
TIMEOUT     = 1s

.PHONY: go-env
go-env:
	@echo "GO111MODULE: $(shell go env GO111MODULE)"
	@echo "GOFLAGS:     $(shell go env GOFLAGS)"
	@echo "MODULE:      $(MODULE)"
	@echo "PACKAGES:    $(PACKAGES)"
	@echo "PATHS:       $(PATHS)"
	@echo "TIMEOUT:     $(TIMEOUT)"

BIN     = $(shell basename $(shell go list -m))
BINPATH = $(PWD)/bin
COMMIT  = $(shell git rev-parse --verify HEAD)
DATE    = $(shell date +%Y-%m-%dT%T%Z)

export PATH := $(BINPATH):$(PATH)

.PHONY: bin-env
bin-env:
	@echo "BIN:     $(BIN)"
	@echo "BINPATH: $(BINPATH)"
	@echo "COMMIT:  $(COMMIT)"
	@echo "DATE:    $(DATE)"

