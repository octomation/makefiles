SHELL = /bin/bash -euo pipefail

GO111MODULE = on
GOFLAGS     = -mod=vendor
GOPRIVATE   = go.octolab.net
GOPROXY     = direct
LOCAL       = $(MODULE)
MODULE      = `go list -m`
PACKAGES    = `go list ./... 2> /dev/null`
PATHS       = $(shell echo $(PACKAGES) | sed -e "s|$(MODULE)/\{0,1\}||g")
TIMEOUT     = 1s

ifeq (, $(PACKAGES))
	PACKAGES = $(MODULE)
endif

ifeq (, $(PATHS))
	PATHS = .
endif

export GO111MODULE := $(GO111MODULE)
export GOFLAGS     := $(GOFLAGS)
export GOPRIVATE   := $(GOPRIVATE)
export GOPROXY     := $(GOPROXY)

.PHONY: go-env
go-env:
	@echo "GO111MODULE: `go env GO111MODULE`"
	@echo "GOFLAGS:     $(strip `go env GOFLAGS`)"
	@echo "GOPRIVATE:   $(strip `go env GOPRIVATE`)"
	@echo "GOPROXY:     $(strip `go env GOPROXY`)"
	@echo "LOCAL:       $(LOCAL)"
	@echo "MODULE:      $(MODULE)"
	@echo "PACKAGES:    $(PACKAGES)"
	@echo "PATHS:       $(strip $(PATHS))"
	@echo "TIMEOUT:     $(TIMEOUT)"

