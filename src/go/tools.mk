BINPATH = $(shell dirname $(PWD))/bin
LOCAL   = $(shell dirname $(MODULE))

export PATH := $(BINPATH):$(PATH)

.PHONY: tools-env
tools-env:
	@echo "BINPATH:     $(BINPATH)"

.PHONY: build
build: install

.PHONY: build-clean
build-clean:
	@$(GO) clean -cache

.PHONY: install
install:
	@ROOT=$(dir $(BINPATH)) $(GO) generate tools.go

.PHONY: install-clean
install-clean:
	@if command -v egg > /dev/null; then \
		tools="$(shell egg tools list)"; \
		for tool in $$tools; do rm -f $(BINPATH)/$$tool; done; \
	else \
		tools="$(shell cat tools.go | grep 'go:generate' | awk '{print $$NF}' | xargs basename)"; \
		for tool in $$tools; do rm -f $(BINPATH)/$$tool; done; \
	fi
