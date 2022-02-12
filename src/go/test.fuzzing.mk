test-fuzzing:
	$(AT) $(GOTEST) -fuzz $(PACKAGES)
.PHONY: test-fuzzing

test-fuzzing-clean:
	$(AT) go clean -fuzzcache
.PHONY: test-fuzzing-clean
