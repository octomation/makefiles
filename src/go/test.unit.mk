go-test:
	$(AT) $(GOTEST) -race -timeout $(TIMEOUT) $(GOTESTFLAGS) $(PACKAGES)
.PHONY: go-test

go-test-clean:
	$(AT) go clean -testcache
.PHONY: go-test-clean

go-test-quick:
	$(AT) $(GOTEST) -timeout $(TIMEOUT) $(GOTESTFLAGS) $(PACKAGES)
.PHONY: go-test-quick

go-test-with-coverage:
	$(AT) $(GOTEST) \
		-cover \
		-covermode atomic \
		-coverprofile c.out \
		-race \
		-timeout $(TIMEOUT) \
		$(GOTESTFLAGS) \
		$(PACKAGES)
.PHONY: go-test-with-coverage

go-test-with-coverage-report: go-test-with-coverage
	$(AT) go tool cover -html c.out
.PHONY: go-test-with-coverage-report
