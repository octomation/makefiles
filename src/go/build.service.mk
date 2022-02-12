include src/go/build.tool.mk # TODO:refactor support relative path

go-client:
	$(eval MAIN := ./cmd/client)
	@true
.PHONY: go-client

go-server:
	$(eval MAIN := ./cmd/server)
	@true
.PHONY: go-server
