test-integration: GOTAGS = integration
test-integration:
	@go test \
		-cover \
		-covermode atomic \
		-coverprofile integration.out \
		-race \
		-tags $(GOTAGS) \
		./...
.PHONY: test-integration

test-integration-quick: GOTAGS = integration
test-integration-quick:
	@go test -tags $(GOTAGS) ./...
.PHONY: test-integration-quick

test-integration-report: test-integration
	@go tool cover -html integration.out
.PHONY: test-integration-report
