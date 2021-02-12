AT    := @
ARCH  := $(shell uname -m | tr '[:upper:]' '[:lower:]')
OS    := $(shell uname -s | tr '[:upper:]' '[:lower:]')
DATE  := $(shell date +%Y-%m-%dT%T%Z)

SHELL ?= /bin/bash -euo pipefail

make-verbose:
	$(eval AT :=)
	@echo > /dev/null
.PHONY: make-verbose
