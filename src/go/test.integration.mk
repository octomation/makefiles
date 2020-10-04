test-integration:
	@go test \
		-cover \
		-covermode atomic \
		-race \
		-tags=integration \
		-coverprofile integration.out \
		./... | column -t | sort -r
.PHONY: test-integration

test-integration-report: test-integration
	@go tool cover -html integration.out
.PHONY: test-integration-report
