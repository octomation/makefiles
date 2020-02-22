.PHONY: format
format:
	@goimports -local $(LOCAL) -ungroup -w $(PATHS)

.PHONY: generate
generate:
	@go generate $(PACKAGES)
