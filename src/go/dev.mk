.PHONY: dist
dist:
	@godownloader .goreleaser.yml > .github/install.sh

.PHONY: format
format:
	@goimports -local $(LOCAL) -ungroup -w $(PATHS)

.PHONY: generate
generate:
	@$(GO) generate $(PACKAGES)
