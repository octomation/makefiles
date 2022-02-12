TOOLFLAGS ?= -mod=

go-tools-env:
	@echo "GOBIN:       `go env GOBIN`"
	@echo "TOOLFLAGS:   $(TOOLFLAGS)"
.PHONY: go-tools-env

ifneq (, $(wildcard ./tools/))
go-tools-fetch: GOFLAGS = $(TOOLFLAGS)
go-tools-fetch:
	$(AT) cd tools; go mod download; \
	if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: go-tools-fetch

go-tools-tidy: GOFLAGS = $(TOOLFLAGS)
go-tools-tidy:
	$(AT) cd tools; go mod tidy; \
	if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: go-tools-tidy

go-tools-check: GOFLAGS = $(TOOLFLAGS)
go-tools-check:
	$(AT) cd tools; go mod verify; \
	if command -v egg >/dev/null; then \
		egg deps check license; \
		egg deps check version; \
	fi
.PHONY: go-tools-check

go-tools-install: GOFLAGS = $(TOOLFLAGS)
go-tools-install: GOTAGS = tools
go-tools-install: go-tools-fetch
	$(AT) cd tools; go generate -tags $(GOTAGS) tools.go
.PHONY: go-tools-install

go-tools-update: GOFLAGS = $(TOOLFLAGS)
go-tools-update: selector = '{{if not (or .Main .Indirect)}}{{.Path}}{{end}}'
go-tools-update:
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
.PHONY: go-tools-update
else
go-tools-disabled:
	@echo have no tools
.PHONY: go-tools-disabled

go-tools-fetch: go-tools-disabled
	@true
.PHONY: go-tools-fetch

go-tools-tidy: go-tools-disabled
	@true
.PHONY: go-tools-tidy

go-tools-install: go-tools-disabled
	@true
.PHONY: go-tools-install

go-tools-update: go-tools-disabled
	@true
.PHONY: go-tools-update
endif
