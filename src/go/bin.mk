BIN     = $(shell basename $(shell go list -m))
BINPATH = $(PWD)/bin
COMMIT  = $(shell git rev-parse --verify HEAD)
DATE    = $(shell date +%Y-%m-%dT%T%Z)

export PATH := $(BINPATH):$(PATH)

.PHONY: bin-env
bin-env:
	@echo "BIN:     $(BIN)"
	@echo "BINPATH: $(BINPATH)"
	@echo "COMMIT:  $(COMMIT)"
	@echo "DATE:    $(DATE)"
