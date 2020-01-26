.PHONY: test
test:
	@go test -race -timeout $(TIMEOUT) $(PACKAGES)

.PHONY: test-clean
test-clean:
	@go clean -testcache

.PHONY: test-with-coverage
test-with-coverage:
	@go test -cover -timeout $(TIMEOUT) $(PACKAGES) | column -t | sort -r

.PHONY: test-with-coverage-profile
test-with-coverage-profile:
	@go test -cover -covermode count -coverprofile c.out -timeout $(TIMEOUT) $(PACKAGES)
