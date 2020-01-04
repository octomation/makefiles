.PHONY: test
test:
	@$(GO) test -race -timeout $(TIMEOUT) $(PACKAGES)

.PHONY: test-clean
test-clean:
	@$(GO) clean -testcache

.PHONY: test-with-coverage
test-with-coverage:
	@$(GO) test -cover -timeout $(TIMEOUT) $(PACKAGES) | column -t | sort -r

.PHONY: test-with-coverage-profile
test-with-coverage-profile:
	@$(GO) test -cover -covermode count -coverprofile c.out -timeout $(TIMEOUT) $(PACKAGES)
