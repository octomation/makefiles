test:
	@$(GOTEST) -race -timeout $(TIMEOUT) $(PACKAGES) $(GOPIPE)
.PHONY: test

test-clean:
	@go clean -testcache
.PHONY: test-clean

test-quick: GOTAGS = integration,tools
test-quick:
	@go test -run ^Fake$$ -tags $(GOTAGS) ./... | { grep -v 'no tests to run' || true; }
	@$(GOTEST) -timeout $(TIMEOUT) $(PACKAGES) $(GOPIPE)
.PHONY: test-quick

test-verbose:
	@$(GOTEST) -race -timeout $(TIMEOUT) -v $(PACKAGES) $(GOPIPE)
.PHONY: test-verbose

test-with-coverage:
	@$(GOTEST) \
		-cover \
		-covermode atomic \
		-coverprofile c.out \
		-race \
		-timeout $(TIMEOUT) \
		$(PACKAGES) $(GOPIPE)
.PHONY: test-with-coverage

test-with-coverage-report: test-with-coverage
	@go tool cover -html c.out
.PHONY: test-with-coverage-report
