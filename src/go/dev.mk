.PHONY: go-fmt
go-fmt:
	@if command -v goimports > /dev/null; then \
		goimports -local $(LOCAL) -ungroup -w $(PATHS); \
	else \
		gofmt -s -w $(PATHS); \
	fi

.PHONY: go-generate
go-generate:
	@go generate $(PACKAGES)

.PHONY: lint
lint:
	@golangci-lint run ./...
	@looppointer ./...
