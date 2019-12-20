.DEFAULT_GOAL = test-with-coverage

include src/common/env.mk
include src/go/env.mk
include src/go/env.build.mk
include src/go/deps.mk
include src/go/tooling.mk
include src/go/test.unit.mk
include src/go/build.mk

.PHONY: env
env: go-env build-env

.PHONY: refresh
refresh: update deps generate format test build
