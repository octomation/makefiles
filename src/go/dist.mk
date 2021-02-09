dist-check:
	$(AT) if command -v goreleaser >/dev/null; then \
		goreleaser --snapshot --skip-publish --rm-dist; \
	else \
		echo have no goreleaser binary; \
	fi
.PHONY: dist-check

dist-dump:
	$(AT) if command -v godownloader >/dev/null; then \
		godownloader .goreleaser.yml >bin/install; \
	else \
		echo have no godownloader binary; \
	fi
.PHONY: dist-dump
