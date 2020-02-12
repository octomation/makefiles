.PHONY: deps
deps:
	@go mod tidy
	@if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi

.PHONY: deps-clean
deps-clean:
	@go clean -modcache

.PHONY: update
update: selector = '{{if not (or .Main .Indirect)}}{{.Path}}{{end}}'
update:
	@if command -v egg > /dev/null; then \
		packages="`egg deps list`"; \
	else \
		packages="`go list -f $(selector) -m all`"; \
	fi; go get -mod= -u $$packages
