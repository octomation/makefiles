BINPATH = $(PWD)/bin
BINARY  = $(BINPATH)/$(shell basename $(shell go list -m))
COMMIT  = $(shell git rev-parse --verify HEAD)
DATE    = $(shell date +%Y-%m-%dT%T%Z)
LDFLAGS = -ldflags "-s -w -X main.commit=$(COMMIT) -X main.date=$(DATE)"

export PATH := $(BINPATH):$(PATH)

.PHONY: build-env
build-env:
	@echo "BINARY:      $(BINARY)"
	@echo "BINPATH:     $(BINPATH)"
	@echo "COMMIT:      $(COMMIT)"
	@echo "DATE:        $(DATE)"
	@echo "LDFLAGS:     $(LDFLAGS)"
