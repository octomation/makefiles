go-deps-check:
	$(AT) go mod verify
	$(AT) if command -v egg >/dev/null; then \
		egg deps check license; \
		egg deps check version; \
	fi
.PHONY: go-deps-check

go-deps-clean:
	$(AT) go clean -modcache
.PHONY: go-deps-clean

go-deps-fetch:
	$(AT) go mod download
	$(AT) if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: go-deps-fetch

go-deps-tidy:
	$(AT) go mod tidy
	$(AT) if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: go-deps-tidy

go-deps-update: selector = '{{if not (or .Main .Indirect)}}{{.Path}}{{end}}'
go-deps-update:
	$(AT) if command -v egg >/dev/null; then \
		packages="`egg deps list | tr ' ' '\n'`"; \
	else \
		packages="`go list -f $(selector) -m -mod=readonly all`"; \
	fi; \
	if [ -z "$$packages" ]; then exit; fi; \
	for package in $$packages; do \
		go mod edit -require=$$package@latest; \
		go mod tidy; \
	done
	$(AT) $(MAKE) deps-tidy
.PHONY: go-deps-update
