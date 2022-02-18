go-integration-test: GOTAGS = $(GOTAGS) integration
go-integration-test:
	$(AT) $(GOTEST) -race -tags $(GOTAGS) -timeout $(TIMEOUT) $(GOTESTFLAGS) $(PACKAGES)
.PHONY: go-test-integration-quick

go-integration-test-with-coverage: GOTAGS = $(GOTAGS) integration
go-integration-test-with-coverage:
	$(AT) $(GOTEST) \
		-cover \
		-covermode atomic \
		-coverprofile i.out \
		-race \
		-tags $(GOTAGS) \
		-timeout $(TIMEOUT) \
		$(GOTESTFLAGS) \
		$(PACKAGES)
.PHONY: go-integration-test-with-coverage

go-integration-test-with-coverage-report: go-integration-test-with-coverage
	$(AT) go tool cover -html i.out
.PHONY: go-integration-test-with-coverage-report
