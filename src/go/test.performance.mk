go-test-performance:
	$(AT) $(GOTEST) -bench=. -run=^$(uuidgen) $(GOTESTFLAGS) $(PACKAGES)
.PHONY: go-test-performance
