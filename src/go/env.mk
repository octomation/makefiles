GOFLAGS   ?= -mod=
GOPRIVATE ?= go.octolab.net
GOPROXY   ?= direct
LOCAL     ?= $(MODULE)
MODULE    ?= `go list -m $(GOFLAGS)`
PACKAGES  ?= `go list $(GOFLAGS) ./...`
PATHS     ?= $(shell echo $(PACKAGES) | sed -e "s|$(MODULE)/||g" | sed -e "s|$(MODULE)|$(PWD)/*.go|g")
TIMEOUT   ?= 1s

ifeq (, $(PACKAGES))
	PACKAGES = $(MODULE)
endif

ifeq (, $(PATHS))
	PATHS = .
endif

export GOFLAGS   := $(GOFLAGS)
export GOPRIVATE := $(GOPRIVATE)
export GOPROXY   := $(GOPROXY)

go-env:
	@echo "GOFLAGS:     $(strip `go env GOFLAGS`)"
	@echo "GOPRIVATE:   $(strip `go env GOPRIVATE`)"
	@echo "GOPROXY:     $(strip `go env GOPROXY`)"
	@echo "LOCAL:       $(LOCAL)"
	@echo "MODULE:      $(MODULE)"
	@echo "PACKAGES:    $(PACKAGES)"
	@echo "PATHS:       $(strip $(PATHS))"
	@echo "TIMEOUT:     $(TIMEOUT)"
.PHONY: go-env
