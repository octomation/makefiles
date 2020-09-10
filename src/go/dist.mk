dist-check:
	@goreleaser --snapshot --skip-publish --rm-dist
.PHONY: dist-check

dist-dump:
	@godownloader .goreleaser.yml > bin/install
.PHONY: dist-dump
