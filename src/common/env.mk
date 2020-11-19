AT    := @
OS    := $(shell uname -s | tr '[:upper:]' '[:lower:]')
ARCH  := $(shell uname -m | tr '[:upper:]' '[:lower:]')

SHELL ?= /bin/bash -euo pipefail

verbose:
	$(eval AT :=)
	@echo > /dev/null
.PHONY: verbose
