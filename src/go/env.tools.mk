GO    = GOPRIVATE=$(GOPRIVATE) GOFLAGS=$(GOFLAGS) go

BINPATH     = $(shell dirname $(PWD))/bin
GO111MODULE = on
GOFLAGS     = -mod=vendor
GOPRIVATE   = go.octolab.net
GOPROXY     = direct
MODULE      = $(shell $(GO) list -m)

export PATH := $(BINPATH):$(PATH)

.PHONY: env
env:
	@echo "BINPATH:     $(BINPATH)"
	@echo "GO111MODULE: $(shell $(GO) env GO111MODULE)"
	@echo "GOFLAGS:     $(strip $(shell $(GO) env GOFLAGS))"
	@echo "GOPRIVATE:   $(strip $(shell $(GO) env GOPRIVATE))"
	@echo "GOPROXY:     $(strip $(shell $(GO) env GOPROXY))"
	@echo "MODULE:      $(MODULE)"
