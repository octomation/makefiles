# sourced by https://github.com/octomation/makefiles

.DEFAULT_GOAL = check
GIT_HOOKS     = post-merge pre-commit pre-push
GO_VERSIONS   = 1.11 1.12 1.13 1.14 1.15 1.16 1.17 1.18 1.19 1.20
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
include src/go/tools.mk
include src/docker/go.mk

export PATH := $(GOBIN):$(PATH)

setup: deps tools lint test
	$(AT) git config core.autocrlf input
.PHONY: setup

test: go-test
.PHONY: test

lint: go-lint
.PHONY: lint

check: test lint
.PHONY: check

clean: go-deps-clean go-test-clean
.PHONY: clean

deps: go-deps-fetch go-tools-install
.PHONY: deps

docs: go-docs
.PHONY: docs

env: go-env go-tools-env
env:
	@echo "PATH:        $(PATH)"
.PHONY: env

format: go-fmt
.PHONY: format

generate: go-generate format
.PHONY: generate

refresh: go-deps-tidy update deps generate check
.PHONY: refresh

tools: go-tools-install
.PHONY: tools

update: go-deps-update go-tools-update
.PHONY: update

verbose: make-verbose go-verbose
.PHONY: verbose

verify: go-deps-check generate check git-check
.PHONY: verify
