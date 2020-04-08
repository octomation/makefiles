# sourced by https://github.com/octomation/makefiles

.DEFAULT_GOAL = test-with-coverage

include src/common/env.mk
include src/go/env.mk
include src/go/deps.mk
include src/go/dev.mk
include src/go/test.unit.mk
include src/docker/go.mk

.PHONY: clean
clean: deps-clean test-clean

.PHONY: deps
deps: module-deps

.PHONY: env
env: go-env

.PHONY: generate
generate: go-generate format

.PHONY: refresh
refresh: deps-shake update deps generate format test
