go-performance-test:
	$(AT) $(GOTEST) -bench=. -run=^$(uuidgen) $(GOTESTFLAGS) $(PACKAGES)
.PHONY: go-performance-test
