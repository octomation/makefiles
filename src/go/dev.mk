GODOC_HOST ?= localhost:6060

go-docs:
	$(AT) (sleep 2 && open http://$(GODOC_HOST)/pkg/$(LOCAL)/) &
	$(AT) godoc -http=$(GODOC_HOST)
.PHONY: go-docs

go-fmt:
	$(AT) if command -v goimports >/dev/null; then \
		goimports -local $(LOCAL) -ungroup -w $(PATHS); \
	else \
		gofmt -s -w $(PATHS); \
	fi
.PHONY: go-fmt

go-generate:
	$(AT) go generate $(PACKAGES)
.PHONY: go-generate

go-pkg:
	$(AT) open https://pkg.go.dev/$(MODULE)@$(RELEASE)
.PHONY: go-pkg

lint:
	$(AT) if command -v golangci-lint >/dev/null; then \
		golangci-lint run --enable looppointer ./...; \
	else \
		echo have no golangci-lint binary; \
	fi
.PHONY: lint
