TOOLFLAGS ?= -mod=

tools-env:
	@echo "GOBIN:       `go env GOBIN`"
	@echo "TOOLFLAGS:   $(TOOLFLAGS)"
.PHONY: tools-env

ifneq (, $(wildcard ./tools/))
tools-fetch: GOFLAGS = $(TOOLFLAGS)
tools-fetch:
	$(AT) cd tools; \
	go mod download; \
	if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: tools-fetch

tools-tidy: GOFLAGS = $(TOOLFLAGS)
tools-tidy:
	$(AT) cd tools; \
	go mod tidy; \
	if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: tools-tidy

tools-install: GOFLAGS = $(TOOLFLAGS)
tools-install: GOTAGS = tools
tools-install: tools-fetch
	$(AT) cd tools; \
	go generate -tags $(GOTAGS) tools.go
.PHONY: tools-install

tools-update: GOFLAGS = $(TOOLFLAGS)
tools-update: selector = '{{if not (or .Main .Indirect)}}{{.Path}}{{end}}'
tools-update:
	$(AT) cd tools; \
	if command -v egg >/dev/null; then \
		packages="`egg deps list | tr ' ' '\n'`"; \
	else \
		packages="`go list -f $(selector) -m -mod=readonly all`"; \
	fi; \
	if [ -z "$$packages" ]; then exit; fi; \
	for package in $$packages; do \
		go mod edit -require=$$package@latest; \
		go mod tidy; \
	done
	$(AT) $(MAKE) tools-tidy tools-install
.PHONY: tools-update
else
tools-disabled:
	@echo have no tools
.PHONY: tools-disabled

tools-fetch: tools-disabled
	@echo >/dev/null
.PHONY: tools-fetch

tools-tidy: tools-disabled
	@echo >/dev/null
.PHONY: tools-tidy

tools-install: tools-disabled
	@echo >/dev/null
.PHONY: tools-install

tools-update: tools-disabled
	@echo >/dev/null
.PHONY: tools-update
endif
