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
