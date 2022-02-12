go-dist-check:
	$(AT) goreleaser --snapshot --skip-publish --rm-dist
.PHONY: go-dist-check

go-dist-installer:
	$(AT) godownloader .goreleaser.yml >bin/install
.PHONY: go-dist-installer
