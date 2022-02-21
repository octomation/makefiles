go-docs:
	$(AT) go doc -all .
.PHONY: go-docs

go-fmt:
	$(AT) goimports -local $(LOCAL) -w $(PATHS)
.PHONY: go-fmt

go-generate:
	$(AT) go generate $(PACKAGES)
.PHONY: go-generate

# How to work with linters
#
#  ```bash
#  $ golangci-lint linters --out-format=json | jq '.[] | {name: .name, url: .origin}'
#  $ golangci-lint linters --out-format=json | jq '.[] | select(.presets[] | contains ("bugs"))'
#  $ golangci-lint linters --out-format=json | jq '.[] | select(.origin == "")'
#  ```
#
# For more experience see https://jqplay.org, https://stedolan.github.io/jq/.
go-lint:
	$(AT) golangci-lint run --enable looppointer ./...
.PHONY: go-lint

go-pkg:
	$(AT) open https://pkg.go.dev/$(MODULE)@$(RELEASE)
.PHONY: go-pkg
