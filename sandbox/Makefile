# ---

AT := @

verbose:
	$(eval AT :=)
	$(eval MAKE := $(MAKE) verbose)
	@echo > /dev/null
.PHONY: verbose

test:
	$(AT) echo test
.PHONY: test

# ---

SHELL := /usr/bin/env bash -euo pipefail -c

env:
	$(AT) echo $(SHELL)
	$(AT) echo $(MAKE)
	$(AT) $(MAKE) test
.PHONY: env

# ---
