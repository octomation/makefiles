GOFLAGS     ?= -mod=
GOPIPE      ?= $(GOBIN)/panicparse
GOPRIVATE   ?= go.octolab.net
GOPROXY     ?= direct
GOTEST      ?= $(GOBIN)/gotest
GOTRACEBACK ?= all
LOCAL       ?= $(MODULE)
MODULE      ?= `go list -m $(GOFLAGS)`
PACKAGES    ?= `go list $(GOFLAGS) ./...`
PATHS       ?= $(shell echo $(PACKAGES) | sed -e "s|$(MODULE)/||g" | sed -e "s|$(MODULE)|$(PWD)/*.go|g")
TIMEOUT     ?= 1s

ifeq (, $(wildcard $(GOTEST)))
	GOTEST = $(shell command -v gotest)
endif
ifeq (, $(GOTEST))
	GOTEST = go test
endif

ifeq (, $(wildcard $(GOPIPE)))
	GOPIPE = $(shell command -v panicparse)
endif
ifneq (, $(GOPIPE))
	GOPIPE := 2>&1|$(GOPIPE)
endif

ifeq (, $(PACKAGES))
	PACKAGES = $(MODULE)
endif

ifeq (, $(PATHS))
	PATHS = .
endif

export GOFLAGS     := $(GOFLAGS)
export GOPRIVATE   := $(GOPRIVATE)
export GOPROXY     := $(GOPROXY)
export GOTRACEBACK := $(GOTRACEBACK)

go-env:
	@echo "GOFLAGS:     $(strip `go env GOFLAGS`)"
	@echo "GOPIPE:      $(GOPIPE)"
	@echo "GOPRIVATE:   $(strip `go env GOPRIVATE`)"
	@echo "GOPROXY:     $(strip `go env GOPROXY`)"
	@echo "GOTEST:      $(GOTEST)"
	@echo "GOTRACEBACK: $(GOTRACEBACK)"
	@echo "LOCAL:       $(LOCAL)"
	@echo "MODULE:      $(MODULE)"
	@echo "PACKAGES:    $(PACKAGES)"
	@echo "PATHS:       $(strip $(PATHS))"
	@echo "TIMEOUT:     $(TIMEOUT)"
.PHONY: go-env
