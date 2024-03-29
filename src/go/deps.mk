deps-check:
	$(AT) go mod verify
	$(AT) if command -v egg >/dev/null; then \
		egg deps check license; \
		egg deps check version; \
	fi
.PHONY: deps-check

deps-clean:
	$(AT) go clean -modcache
.PHONY: deps-clean

deps-fetch:
	$(AT) go mod download
	$(AT) if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: deps-fetch

deps-tidy:
	$(AT) go mod tidy
	$(AT) if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: deps-tidy

deps-update: selector = '{{if not (or .Main .Indirect)}}{{.Path}}{{end}}'
deps-update:
	$(AT) if command -v egg >/dev/null; then \
		packages="`egg deps list | tr ' ' '\n' | sed -e 's|$$|/...@latest|'`"; \
	else \
		packages="`go list -f $(selector) -m -mod=readonly all | sed -e 's|$$|/...@latest|'`"; \
	fi; \
	if [[ "$$packages" = "/...@latest" ]]; then exit; fi; \
	for package in $$packages; do go get -d $$package; done
	$(AT) $(MAKE) deps-tidy
.PHONY: deps-update
