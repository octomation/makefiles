BINARY  = $(GOBIN)/$(shell basename $(MAIN))
BINPATH = $(PWD)/bin
COMMIT  = $(shell git rev-parse --verify HEAD)
DATE    = $(shell date +%Y-%m-%dT%T%Z)
GOBIN   = $(BINPATH)
LDFLAGS = -ldflags "-s -w -X main.commit=$(COMMIT) -X main.date=$(DATE)"
MAIN    = $(MODULE)

export PATH := $(BINPATH):$(PATH)

.PHONY: build-env
build-env:
	@echo "BINARY:      $(BINARY)"
	@echo "BINPATH:     $(BINPATH)"
	@echo "COMMIT:      $(COMMIT)"
	@echo "DATE:        $(DATE)"
	@echo "LDFLAGS:     $(LDFLAGS)"

.PHONY: build
build:
	@$(GO) build -o $(BINARY) $(LDFLAGS) $(MAIN)

.PHONY: build-clean
build-clean:
	@$(GO) clean -cache

.PHONY: install
install: build

.PHONY: install-clean
install-clean:
	@rm -f $(BINARY)
