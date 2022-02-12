test-integration: GOTAGS = $(GOTAGS) integration
test-integration:
	$(AT) $(GOTEST) \
		-cover \
		-covermode atomic \
		-coverprofile integration.out \
		-race \
		-tags $(GOTAGS) \
		$(GOTESTFLAGS) \
		$(PACKAGES)
.PHONY: test-integration

test-integration-quick: GOTAGS = $(GOTAGS) integration
test-integration-quick:
	$(AT) $(GOTEST) -tags $(GOTAGS) $(GOTESTFLAGS) $(PACKAGES)
.PHONY: test-integration-quick

test-integration-report: test-integration
	$(AT) go tool cover -html integration.out
.PHONY: test-integration-report
