TOOLFLAGS ?= -mod=

tools-env:
	@echo "GOBIN:       `go env GOBIN`"
	@echo "TOOLFLAGS:   $(TOOLFLAGS)"
.PHONY: tools-env

toolset:
	@( \
		GOFLAGS=$(TOOLFLAGS); \
		cd tools; \
		go mod tidy; \
		go mod download; \
		if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi; \
		go generate tools.go; \
	)
.PHONY: toolset
