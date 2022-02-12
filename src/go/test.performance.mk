test-performance:
	$(AT) $(GOTEST) -bench=. -run=^$(uuidgen) $(GOTESTFLAGS) $(PACKAGES)
.PHONY: test-performance
