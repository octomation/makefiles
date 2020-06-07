# sourced by https://github.com/octomation/makefiles

.DEFAULT_GOAL = test-with-coverage
GIT_HOOKS     = post-merge pre-commit pre-push
GO_VERSIONS   = 1.11 1.12 1.13 1.14

include src/common/env.mk
include src/go/env.mk
include src/go/deps.mk
include src/go/dev.mk
include src/go/test.unit.mk
include src/git/hooks.mk
include src/docker/go.mk

.PHONY: init
init: deps test lint hooks

.PHONY: clean
clean: deps-clean test-clean

.PHONY: deps
deps: deps-fetch

.PHONY: env
env: go-env

.PHONY: format
format: go-fmt

.PHONY: generate
generate: go-generate format

.PHONY: refresh
refresh: deps-tidy update deps generate format test

.PHONY: update
update: deps-update
