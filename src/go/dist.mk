dist-check:
	$(AT) goreleaser --snapshot --skip-publish --rm-dist
.PHONY: dist-check

dist-dump:
	$(AT) godownloader .goreleaser.yml > bin/install
.PHONY: dist-dump
