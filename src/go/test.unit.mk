test:
	@go test -race -timeout $(TIMEOUT) $(PACKAGES)
.PHONY: test

test-clean:
	@go clean -testcache
.PHONY: test-clean

test-quick: GOTAGS = integration,tools
test-quick:
	@go test -run ^Fake$$ -tags $(GOTAGS) ./... | { grep -v 'no tests to run' || true; }
	@go test -timeout $(TIMEOUT) $(PACKAGES)
.PHONY: test-quick

test-verbose:
	@go test -race -timeout $(TIMEOUT) -v $(PACKAGES)
.PHONY: test-verbose

test-with-coverage:
	@go test \
		-cover \
		-covermode atomic \
		-coverprofile c.out \
		-race \
		-timeout $(TIMEOUT) \
		$(PACKAGES)
.PHONY: test-with-coverage

test-with-coverage-report: test-with-coverage
	@go tool cover -html c.out
.PHONY: test-with-coverage-report
