test-integration:
	@go test \
		-cover \
		-covermode atomic \
		-coverprofile integration.out \
		-race \
		-tags integration \
		./... | column -t | sort -r
.PHONY: test-integration

test-integration-quick:
	@go test -tags integration ./...
.PHONY: test-integration-quick

test-integration-report: test-integration
	@go tool cover -html integration.out
.PHONY: test-integration-report
