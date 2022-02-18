go-fuzzing-test:
	$(AT) $(GOTEST) -fuzz $(PACKAGES)
.PHONY: go-fuzzing-test

go-fuzzing-test-clean:
	$(AT) go clean -fuzzcache
.PHONY: go-fuzzing-test-clean
