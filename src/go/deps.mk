.PHONY: deps
deps:
	@go mod download
	@if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi

.PHONY: deps-check
deps-check:
	@go mod verify
	@if command -v egg > /dev/null; then \
		egg deps check license; \
		egg deps check version; \
	fi

.PHONY: deps-clean
deps-clean:
	@go clean -modcache

.PHONY: deps-shake
deps-shake:
	@go mod tidy

.PHONY: update
update: selector = '{{if not (or .Main .Indirect)}}{{.Path}}{{end}}'
update:
	@if command -v egg > /dev/null; then \
		packages="`egg deps list`"; \
	else \
		packages="`go list -f $(selector) -m all`"; \
	fi; go get -mod= -u $$packages

.PHONY: update-all
update-all:
	@go get -mod= -u ./...
