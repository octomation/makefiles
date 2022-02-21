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
include src/go/test.fuzzing.mk
include src/go/test.performance.mk
include src/go/tools.mk
include src/docker/go.mk

export PATH := $(GOBIN):$(PATH)

setup: git-config git-hooks go-deps-fetch go-tools-install
.PHONY: setup

clean: go-deps-clean go-test-clean go-fuzzing-test-clean
.PHONY: clean

drop: git-clean git-rmdir clean
.PHONY: drop

env: go-env go-tools-env
env:
	@echo "PATH:        $(PATH)"
.PHONY: env

deps: go-deps-fetch
.PHONY: deps

tools: go-tools-install
.PHONY: tools

format: go-fmt
.PHONY: format

generate: go-generate go-fmt
.PHONY: generate

check: lint test
.PHONY: check

lint: go-lint
.PHONY: lint

test: go-test
.PHONY: test

test-with-coverage: TIMEOUT=2s
test-with-coverage: go-integration-test-with-coverage
.PHONY: test-with-coverage

full-check: find-todos
full-check: go-check go-deps-check go-tools-check
full-check: go-deps-tidy go-tools-tidy go-generate git-check
.PHONY: full-check

full-test: go-test go-fuzzing-test go-integration-test go-performance-test
.PHONY: full-test

verbose: make-verbose go-verbose
.PHONY: verbose
