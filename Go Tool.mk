# sourced by https://github.com/octomation/makefiles

.DEFAULT_GOAL = test-with-coverage
GIT_HOOKS     = post-merge pre-commit pre-push
GO_VERSIONS   = 1.14 1.15

include src/common/env.mk
include src/go/env.mk
include src/go/deps.mk
include src/go/dev.mk
include src/go/test.unit.mk
include src/go/build.mk
include src/go/dist.mk
include src/go/tools.mk
include src/git/hooks.mk
include src/docker/go.mk

init: deps test lint hooks
	@git config core.autocrlf input
.PHONY: init

clean: build-clean deps-clean install-clean test-clean
.PHONY: clean

deps: deps-fetch toolset
.PHONY: deps

env: go-env build-env tools-env
.PHONY: env

format: go-fmt
.PHONY: format

generate: go-generate format
.PHONY: generate

refresh: deps-tidy update deps generate format test build
.PHONY: refresh

update: deps-update
.PHONY: update
