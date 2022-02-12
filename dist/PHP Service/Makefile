# sourced by https://github.com/octomation/makefiles

AT    := @
ARCH  := $(shell uname -m | tr '[:upper:]' '[:lower:]')
OS    := $(shell uname -s | tr '[:upper:]' '[:lower:]')
DATE  := $(shell date -u +%Y-%m-%dT%T%Z)
SHELL := /usr/bin/env bash -euo pipefail -c

make-verbose:
	$(eval AT :=) $(eval MAKE := $(MAKE) verbose) @true
.PHONY: make-verbose

find-todo:
	$(AT) grep \
		--exclude=Makefile \
		--exclude-dir={bin,components,node_modules,vendor} \
		--color \
		--text \
		-inRo -E ' TODO:.*|SkipNow' . || true
.PHONY: find-todo

