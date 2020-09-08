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

.PHONY: init
init: deps test lint hooks

.PHONY: clean
clean: build-clean deps-clean install-clean test-clean

.PHONY: deps
deps: deps-fetch toolset

.PHONY: env
env: go-env build-env tools-env

.PHONY: format
format: go-fmt

.PHONY: generate
generate: go-generate format

.PHONY: refresh
refresh: deps-tidy update deps generate format test build

.PHONY: update
update: deps-update
