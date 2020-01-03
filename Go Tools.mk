# sourced by https://github.com/octomation/makefiles

.DEFAULT_GOAL = install

include src/common/env.mk
include src/go/env.tools.mk
include src/go/deps.mk
include src/go/build.tools.mk

.PHONY: clean
clean: build-clean deps-clean install-clean
