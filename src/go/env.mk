GOBIN       ?= $(PWD)/bin/$(OS)/$(ARCH)
GOFLAGS     ?= -mod=
GOPRIVATE   ?= go.octolab.net
GOPROXY     ?= direct
GOTEST      ?= $(shell PATH="$(PATH)" command -v testit)
GOTESTFLAGS ?=
GOTRACEBACK ?= all
LOCAL       ?= $(MODULE)
MODULE      ?= `go list $(GOFLAGS)`
PACKAGES    ?= `go list $(GOFLAGS) ./...`
PATHS       ?= $(shell echo $(PACKAGES) | sed -e "s|$(MODULE)/||g" | sed -e "s|$(MODULE)|$(PWD)/*.go|g")
TIMEOUT     ?= 1s

ifeq (, $(GOTEST))
	GOTEST = go test
else
	GOTEST := $(GOTEST) go --colored --stacked
endif

ifeq (, $(PACKAGES))
	PACKAGES = $(MODULE)
endif

ifeq (, $(PATHS))
	PATHS = .
endif

export GOBIN       := $(GOBIN)
export GOFLAGS     := $(GOFLAGS)
export GOPRIVATE   := $(GOPRIVATE)
export GOPROXY     := $(GOPROXY)
export GOTRACEBACK := $(GOTRACEBACK)

go-env:
	@echo "GO111MODULE: $(strip `go env GO111MODULE`)"
	@echo "GOBIN:       $(strip `go env GOBIN`)"
	@echo "GOFLAGS:     $(strip `go env GOFLAGS`)"
	@echo "GOPRIVATE:   $(strip `go env GOPRIVATE`)"
	@echo "GOPROXY:     $(strip `go env GOPROXY`)"
	@echo "GOTEST:      $(GOTEST)"
	@echo "GOTESTFLAGS: $(GOTESTFLAGS)"
	@echo "GOTRACEBACK: $(GOTRACEBACK)"
	@echo "GOVERSION:   $(strip `go version | awk '{print $$3}' | sed -e 's|^go||g'`)"
	@echo "LOCAL:       $(LOCAL)"
	@echo "MODULE:      $(MODULE)"
	@echo "PACKAGES:    $(PACKAGES)"
	@echo "PATHS:       $(strip $(PATHS))"
	@echo "TIMEOUT:     $(TIMEOUT)"
.PHONY: go-env

go-verbose:
	$(eval GOTESTFLAGS := -v) @true
.PHONY: go-verbose
