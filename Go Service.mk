# sourced by https://github.com/octomation/makefiles

.DEFAULT_GOAL = test-with-coverage

include src/common/env.mk
include src/go/env.mk
include src/go/deps.mk
include src/go/test.unit.mk
include src/docker/env.mk
