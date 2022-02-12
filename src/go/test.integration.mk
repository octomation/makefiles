go-test-integration: GOTAGS = $(GOTAGS) integration
go-test-integration:
	$(AT) $(GOTEST) \
		-cover \
		-covermode atomic \
		-coverprofile integration.out \
		-race \
		-tags $(GOTAGS) \
		$(GOTESTFLAGS) \
		$(PACKAGES)
.PHONY: go-test-integration

go-test-integration-quick: GOTAGS = $(GOTAGS) integration
go-test-integration-quick:
	$(AT) $(GOTEST) -tags $(GOTAGS) $(GOTESTFLAGS) $(PACKAGES)
.PHONY: go-test-integration-quick

go-test-integration-report: go-test-integration
	$(AT) go tool cover -html integration.out
.PHONY: go-test-integration-report
