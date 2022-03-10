# sourced by https://github.com/octomation/makefiles

.DEFAULT_GOAL = check
GIT_HOOKS     = post-merge pre-commit pre-push
GO_VERSIONS   = 1.19 1.20

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
include src/go/build.service.mk
include src/go/dist.mk
include src/go/tools.mk
include src/docker/go.mk

export PATH := $(GOBIN):$(PATH)

setup: git-config git-hooks go-deps-fetch go-tools-install
.PHONY: setup

clean: go-deps-clean go-dist-clean go-install-clean go-test-clean go-fuzzing-test-clean
.PHONY: clean

drop: clean git-clean git-rmdir
.PHONY: drop

env: go-env go-build-env go-tools-env
env:
	@echo "PATH:        $(PATH)"
.PHONY: env

deps: go-deps-fetch
.PHONY: deps

tools: go-tools-install
.PHONY: tools

update:
	@true # TODO:implement go-deps-update go-tools-update generate
.PHONY: update

format: go-fmt
.PHONY: format

generate: go-generate go-fmt
.PHONY: generate

docs:
	@true # TODO:implement go-docs go-pkg
.PHONY: docs

lint: go-lint
.PHONY: lint

test: go-test
.PHONY: test

test-with-coverage: TIMEOUT=5s
test-with-coverage: go-integration-test-with-coverage
.PHONY: test-with-coverage

check: lint test
.PHONY: check

fast-check: find-todos
fast-check: go-check go-deps-check go-tools-check
fast-check: go-deps-tidy go-tools-tidy go-generate git-check
.PHONY: fast-check

full-check: fast-check go-dist-check check
.PHONY: full-check

full-test: go-test go-fuzzing-test go-integration-test go-performance-test
.PHONY: full-test

client: go-client
.PHONY: client

server: go-server
.PHONY: server

install: go-install
.PHONY: install

verbose: make-verbose go-verbose
.PHONY: verbose
