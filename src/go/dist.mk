.PHONY: dist-check
dist-check:
	@goreleaser --snapshot --skip-publish --rm-dist

.PHONY: dist-dump
dist-dump:
	@godownloader .goreleaser.yml > bin/install
