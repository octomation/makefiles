test:
	@go test -race -timeout $(TIMEOUT) $(PACKAGES)
.PHONY: test

test-clean:
	@go clean -testcache
.PHONY: test-clean

test-with-coverage:
	@go test \
		-cover \
		-covermode atomic \
		-coverprofile c.out \
		-race \
		-timeout $(TIMEOUT) \
		$(PACKAGES) | column -t | sort -r
.PHONY: test-with-coverage

test-with-coverage-report: test-with-coverage
	@go tool cover -html c.out
.PHONY: test-with-coverage-report
