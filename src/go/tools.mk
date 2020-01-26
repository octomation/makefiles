BINPATH = $(shell dirname $(PWD))/bin

export GOBIN := $(BINPATH)
export PATH  := $(BINPATH):$(PATH)

.PHONY: tools-env
tools-env:
	@echo "BINPATH:     $(BINPATH)"
	@echo "GOBIN:       `go env GOBIN`"
	@echo "PATH:        $$PATH"

.PHONY: build
build: install

.PHONY: build-clean
build-clean:
	@go clean -cache

.PHONY: install
install:
	@go generate tools.go

.PHONY: install-clean
install-clean:
	@if command -v egg > /dev/null; then \
		tools="`egg tools list`"; \
		for tool in $$tools; do rm -f $(BINPATH)/$$tool; done; \
	else \
		tools="$(shell cat tools.go | grep 'go:generate' | awk '{print $$NF}' | xargs basename)"; \
		for tool in $$tools; do rm -f $(BINPATH)/$$tool; done; \
	fi
