COMMIT  := $(shell git rev-parse --short --verify HEAD)
RELEASE := $(shell git describe --tags 2>/dev/null | rev | cut -d - -f3- | rev)

git-config:
	$(AT) git config core.autocrlf input
.PHONY: git-config
