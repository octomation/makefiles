GOFLAGS     ?= -mod=
GOPRIVATE   ?= go.octolab.net
GOPROXY     ?= direct
GOTEST      ?= $(GOBIN)/testit
GOTRACEBACK ?= all
LOCAL       ?= $(MODULE)
MODULE      ?= `go list -m $(GOFLAGS)`
PACKAGES    ?= `go list $(GOFLAGS) ./...`
PATHS       ?= $(shell echo $(PACKAGES) | sed -e "s|$(MODULE)/||g" | sed -e "s|$(MODULE)|$(PWD)/*.go|g")
TIMEOUT     ?= 1s

ifeq (, $(wildcard $(GOTEST)))
	GOTEST = $(shell command -v testit)
endif
ifeq (, $(GOTEST))
	GOTEST = go test
else
	GOTEST := $(GOTEST) --colored
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
	@echo "GO111MODULE: $(strip `go env GO111MODULE`)"
	@echo "GOFLAGS:     $(strip `go env GOFLAGS`)"
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
