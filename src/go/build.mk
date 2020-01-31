BINARY  = $(BINPATH)/$(shell basename $(MAIN))
BINPATH = $(PWD)/bin
COMMIT  = $(shell git rev-parse --verify HEAD)
DATE    = $(shell date +%Y-%m-%dT%T%Z)
LDFLAGS = -ldflags "-s -w -X main.commit=$(COMMIT) -X main.date=$(DATE)"
MAIN    = $(MODULE)

export GOBIN := $(BINPATH)
export PATH  := $(BINPATH):$(PATH)

.PHONY: build-env
build-env:
	@echo "BINARY:      $(BINARY)"
	@echo "BINPATH:     $(BINPATH)"
	@echo "COMMIT:      $(COMMIT)"
	@echo "DATE:        $(DATE)"
	@echo "GOBIN:       `go env GOBIN`"
	@echo "LDFLAGS:     $(LDFLAGS)"
	@echo "MAIN:        $(MAIN)"
	@echo "PATH:        $$PATH"

.PHONY: build
build:
	@go build -o $(BINARY) $(LDFLAGS) $(MAIN)

.PHONY: build-clean
build-clean:
	@rm -f $(BINARY)

.PHONY: install
install:
	@go install $(LDFLAGS) $(MAIN)

.PHONY: install-clean
install-clean:
	@go clean -cache
