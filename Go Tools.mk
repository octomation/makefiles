# sourced by https://github.com/octomation/makefiles

.DEFAULT_GOAL = install

include src/common/env.mk
include src/go/env.mk
include src/go/deps.mk
include src/go/tools.mk

.PHONY: clean
clean: build-clean deps-clean install-clean

.PHONY: env
env: go-env tools-env

.PHONY: refresh
refresh: update deps install
