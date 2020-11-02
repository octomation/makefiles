# sourced by https://github.com/octomation/makefiles

.DEFAULT_GOAL = test-with-coverage
GIT_HOOKS     = post-merge pre-commit pre-push
GO_VERSIONS   = 1.14 1.15
GO111MODULE   = on

include src/common/env.mk
include src/common/helpers.mk
include src/go/env.mk
include src/go/bin.mk
include src/go/deps.mk
include src/go/dev.mk
include src/go/docs.mk
include src/go/test.unit.mk
include src/go/test.integration.mk
include src/go/build.mk
include src/go/dist.mk
include src/go/tools.mk
include src/git/hooks.mk
include src/git/helpers.mk
include src/docker/go.mk

export PATH := `go env GOBIN`:$(PATH)


init: deps test lint hooks
	@git config core.autocrlf input
.PHONY: init

clean: build-clean deps-clean install-clean test-clean
.PHONY: clean

deps: deps-fetch toolset
.PHONY: deps

env: go-env build-env tools-env
env:
	@echo "PATH:        $$PATH"
.PHONY: env

format: go-fmt
.PHONY: format

generate: go-generate format
.PHONY: generate

refresh: deps-tidy update deps generate test build
.PHONY: refresh

update: deps-update
.PHONY: update

verify: deps-check generate git-check lint test
.PHONY: verify
