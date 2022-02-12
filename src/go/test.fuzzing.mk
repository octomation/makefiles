go-test-fuzzing:
	$(AT) $(GOTEST) -fuzz $(PACKAGES)
.PHONY: go-test-fuzzing

go-test-fuzzing-clean:
	$(AT) go clean -fuzzcache
.PHONY: go-test-fuzzing-clean
