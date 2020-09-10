deps-check:
	@go mod verify
	@if command -v egg > /dev/null; then \
		egg deps check license; \
		egg deps check version; \
	fi
.PHONY: deps-check

deps-clean:
	@go clean -modcache
.PHONY: deps-clean

deps-fetch:
	@go mod download
	@if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: deps-fetch

deps-tidy:
	@go mod tidy
	@if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: deps-tidy

deps-update: selector = '{{if not (or .Main .Indirect)}}{{.Path}}{{end}}'
deps-update:
	@if command -v egg > /dev/null; then \
		packages="`egg deps list`"; \
	else \
		packages="`go list -f $(selector) -m -mod=readonly all`"; \
	fi; \
	if [[ "`go version`" == *1.1[1-3]* ]]; then \
		go get -d -mod= -u $$packages; \
	else \
		go get -d -u $$packages; \
	fi; \
	if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: deps-update

deps-update-all:
	@if [[ "`go version`" == *1.1[1-3]* ]]; then \
		go get -d -mod= -u ./...; \
	else \
		go get -d -u ./...; \
	fi; \
	if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: deps-update-all
