GO111MODULE = on
GOFLAGS     = -mod=vendor
MODULE      = $(shell go list -m)
PACKAGES    = $(shell go list ./...)
PATHS       = $(shell go list ./... | sed -e "s|\s+$(shell go list -m)/\{0,1\}||g")
TIMEOUT     = 1s
VENDOR      = $(dir $(MODULE))

.PHONY: go-env
go-env:
	@echo "GO111MODULE: $(shell go env GO111MODULE)"
	@echo "GOFLAGS:     $(shell go env GOFLAGS)"
	@echo "MODULE:      $(MODULE)"
	@echo "PACKAGES:    $(PACKAGES)"
	@echo "PATHS:       $(PATHS)"
	@echo "TIMEOUT:     $(TIMEOUT)"
