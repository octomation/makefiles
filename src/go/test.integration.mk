GOTEST ?= `command -v gotest`
ifeq (, $(GOTEST))
	GOTEST = go test
endif

test-integration: GOTAGS = integration
test-integration:
	@$(GOTEST) \
		-cover \
		-covermode atomic \
		-coverprofile integration.out \
		-race \
		-tags $(GOTAGS) \
		./...
.PHONY: test-integration

test-integration-quick: GOTAGS = integration
test-integration-quick:
	@$(GOTEST) -tags $(GOTAGS) ./...
.PHONY: test-integration-quick

test-integration-report: test-integration
	@go tool cover -html integration.out
.PHONY: test-integration-report
