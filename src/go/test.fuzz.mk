# TODO:support check if it's available for Go (since 1.18, but flag parse is better)
# TODO:integrate add to the root Makefiles

fuzz:
	$(AT) $(GOTEST) -fuzz $(PACKAGES)
.PHONY: fuzz

fuzz-clean:
	$(AT) go clean -fuzzcache
.PHONY: fuzz-clean
