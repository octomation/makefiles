.PHONY: build
build:
	@go build -o $(BINARY) $(LDFLAGS) .

.PHONY: dist
dist:
	@godownloader .goreleaser.yml > .github/install.sh
