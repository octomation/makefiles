.DEFAULT_GOAL = test-with-coverage

include src/common/env.mk
include src/go/env.mk
include src/go/env.bin.mk
include src/go/deps.mk
include src/go/tooling.mk
include src/go/test.unit.mk
include src/go/build.mk
