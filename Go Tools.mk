.DEFAULT_GOAL = install

include src/common/env.mk
include src/go/env.tools.mk
include src/common/brew.mk
include src/go/deps.mk
include src/go/build.tools.mk

.PHONY: install
install: egg build
