.PHONY: deps
deps:
	@$(GO) mod tidy
	@if [[ "$(shell $(GO) env GOFLAGS)" =~ -mod=vendor ]]; then $(GO) mod vendor; fi

.PHONY: deps-clean
deps-clean:
	@$(GO) clean -modcache

.PHONY: update
update: selector = '.Require[] | select(.Indirect != true) | .Path'
update:
	@if command -v egg > /dev/null; then \
		packages="$(shell egg deps list)"; \
		$(GO) get -mod= -u $$packages; \
	elif command -v jq > /dev/null; then \
		packages="$(shell $(GO) mod edit -json | jq -r $(selector))"; \
		$(GO) get -mod= -u $$packages; \
	else \
		packages="$(shell cat go.mod | grep -v '// indirect' | grep '\t' | awk '{print $$1}')"; \
		$(GO) get -mod= -u $$packages; \
	fi
