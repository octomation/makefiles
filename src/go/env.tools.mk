BINPATH = $(shell dirname $(PWD))/bin

export PATH := $(BINPATH):$(PATH)

.PHONY: tools-env
tools-env:
	@echo "BINPATH:     $(BINPATH)"
