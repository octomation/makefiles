.PHONY: format
format:
	@goimports -local $(VENDOR) -ungroup -w $(PATHS)

.PHONY: generate
generate:
	@go generate $(PACKAGES)
