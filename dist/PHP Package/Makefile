# sourced by https://github.com/octomation/makefiles

OS    := $(shell uname -s | tr '[:upper:]' '[:lower:]')
ARCH  := $(shell uname -m | tr '[:upper:]' '[:lower:]')

SHELL ?= /bin/bash -euo pipefail

todo:
	@grep \
		--exclude=Makefile \
		--exclude-dir={bin,components,node_modules,vendor} \
		--color \
		--text \
		-nRo -E ' TODO:.*|SkipNow' . || true
.PHONY: todo


