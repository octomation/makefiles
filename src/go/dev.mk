GODOC_HOST ?= http://localhost:6060

go-docs:
	$(AT) (sleep 2 && open $(GODOC_HOST)/pkg/$(LOCAL)/) &
	$(AT) godoc -http=$(GODOC_HOST)
.PHONY: go-docs

go-fmt:
	$(AT) goimports -local $(LOCAL) -w $(PATHS)
.PHONY: go-fmt

go-generate:
	$(AT) go generate $(PACKAGES)
.PHONY: go-generate

go-pkg:
	$(AT) open https://pkg.go.dev/$(MODULE)@$(RELEASE)
.PHONY: go-pkg

go-lint:
	$(AT) golangci-lint run --enable looppointer ./...
.PHONY: go-lint
