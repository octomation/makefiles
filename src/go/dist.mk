go-dist-check:
	$(AT) goreleaser --clean --skip-publish --snapshot
.PHONY: go-dist-check

go-dist-installer:
	$(AT) godownloader .goreleaser.yml >bin/install
.PHONY: go-dist-installer
