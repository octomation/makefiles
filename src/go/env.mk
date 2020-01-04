GO          = GOPRIVATE=$(GOPRIVATE) GOFLAGS=$(GOFLAGS) go
GO111MODULE = on
GOFLAGS     = -mod=vendor
GOPRIVATE   = go.octolab.net
GOPROXY     = direct
LOCAL       = $(MODULE)
MODULE      = $(shell $(GO) list -m)
PACKAGES    = $(shell $(GO) list ./... 2> /dev/null)
PATHS       = $(shell $(GO) list ./... 2> /dev/null | sed -e "s|$(MODULE)/\{0,1\}||g")
TIMEOUT     = 1s

ifeq (, $(PACKAGES))
	PACKAGES = $(MODULE)
endif

ifeq (, $(PATHS))
	PATHS = .
endif

.PHONY: go-env
go-env:
	@echo "GO111MODULE: $(shell $(GO) env GO111MODULE)"
	@echo "GOFLAGS:     $(strip $(shell $(GO) env GOFLAGS))"
	@echo "GOPRIVATE:   $(strip $(shell $(GO) env GOPRIVATE))"
	@echo "GOPROXY:     $(strip $(shell $(GO) env GOPROXY))"
	@echo "LOCAL:       $(LOCAL)"
	@echo "MODULE:      $(MODULE)"
	@echo "PACKAGES:    $(PACKAGES)"
	@echo "PATHS:       $(strip $(PATHS))"
	@echo "TIMEOUT:     $(TIMEOUT)"
