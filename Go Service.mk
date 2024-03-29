# sourced by https://github.com/octomation/makefiles

.DEFAULT_GOAL = check
GIT_HOOKS     = post-merge pre-commit pre-push
GO_VERSIONS   = 1.15 1.16
GO111MODULE   = on

include src/common/env.mk
include src/common/helpers.mk
include src/git/env.mk
include src/git/hooks.mk
include src/git/helpers.mk
include src/go/env.mk
include src/go/deps.mk
include src/go/dev.mk
include src/go/test.unit.mk
include src/go/test.integration.mk
include src/go/build.mk
include src/go/build.service.mk
include src/go/dist.mk
include src/go/tools.mk
include src/docker/go.mk

export PATH := $(GOBIN):$(PATH)

init: deps check hooks
	$(AT) git config core.autocrlf input
.PHONY: init

check: test lint
.PHONY: check

clean: build-clean deps-clean install-clean test-clean
.PHONY: clean

deps: deps-fetch tools-install
.PHONY: deps

docs: go-docs
.PHONY: docs

env: go-env build-env tools-env
env:
	@echo "PATH:        $(PATH)"
.PHONY: env

format: go-fmt
.PHONY: format

generate: go-generate format
.PHONY: generate

refresh: deps-tidy update deps generate check build
.PHONY: refresh

update: deps-update tools-update
.PHONY: update

verbose: make-verbose go-verbose
.PHONY: verbose

verify: deps-check generate check git-check
.PHONY: verify
