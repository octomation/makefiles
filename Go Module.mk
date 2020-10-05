# sourced by https://github.com/octomation/makefiles

.DEFAULT_GOAL = test-with-coverage
GIT_HOOKS     = post-merge pre-commit pre-push
GO_VERSIONS   = 1.11 1.12 1.13 1.14 1.15

include src/common/env.mk
include src/common/helpers.mk
include src/go/env.mk
include src/go/deps.mk
include src/go/dev.mk
include src/go/test.unit.mk
include src/go/test.integration.mk
include src/git/hooks.mk
include src/docker/go.mk

init: deps test lint hooks
	@git config core.autocrlf input
.PHONY: init

clean: deps-clean test-clean
.PHONY: clean

deps: deps-fetch
.PHONY: deps

env: go-env
.PHONY: env

format: go-fmt
.PHONY: format

generate: go-generate format
.PHONY: generate

refresh: deps-tidy update deps generate format test
.PHONY: refresh

update: deps-update
.PHONY: update
