GODOC_HOST ?= localhost:6060

go-docs:
	@(sleep 2 && open http://$(GODOC_HOST)/pkg/$(LOCAL)/) &
	@godoc -http=$(GODOC_HOST)
.PHONY: go-docs

go-fmt:
	@if command -v goimports > /dev/null; then \
		goimports -local $(LOCAL) -ungroup -w $(PATHS); \
	else \
		gofmt -s -w $(PATHS); \
	fi
.PHONY: go-fmt

go-generate:
	@go generate $(PACKAGES)
.PHONY: go-generate

lint:
	@golangci-lint run ./...
	@looppointer ./...
.PHONY: lint
