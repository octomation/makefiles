dist-check:
	$(AT) goreleaser --snapshot --skip-publish --rm-dist
.PHONY: dist-check

dist-installer:
	$(AT) godownloader .goreleaser.yml >bin/install
.PHONY: dist-installer
