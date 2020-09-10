test:
	@go test -race -timeout $(TIMEOUT) $(PACKAGES)
.PHONY: test

test-clean:
	@go clean -testcache
.PHONY: test-clean

test-with-coverage:
	@go test -cover -timeout $(TIMEOUT) $(PACKAGES) | column -t | sort -r
.PHONY: test-with-coverage

test-with-coverage-profile:
	@go test -cover -covermode count -coverprofile c.out -timeout $(TIMEOUT) $(PACKAGES)
.PHONY: test-with-coverage-profile

test-with-coverage-report: test-with-coverage-profile
	@go tool cover -html c.out
.PHONY: test-with-coverage-report
