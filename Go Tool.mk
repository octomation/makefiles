# sourced by https://github.com/octomation/makefiles

.DEFAULT_GOAL = test-with-coverage

include src/common/env.mk
include src/go/env.mk
include src/go/deps.mk
include src/go/dev.mk
include src/go/test.unit.mk
include src/go/build.mk
include src/go/dist.mk
include src/go/tools.mk

.PHONY: clean
clean: build-clean deps-clean install-clean test-clean

.PHONY: deps
deps: module-deps toolset

.PHONY: env
env: go-env build-env tools-env

.PHONY: generate
generate: go-generate format

.PHONY: refresh
refresh: deps-shake update deps generate format test build
