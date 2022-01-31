BINARY  ?= $(GOBIN)/$(shell basename $(MAIN))
LDFLAGS ?= -ldflags "-s -w -X main.commit=$(COMMIT) -X main.date=$(DATE)"
MAIN    ?= $(MODULE)

build-env:
	@echo "DATE:        $(DATE)"
	@echo "COMMIT:      $(COMMIT)"
	@echo "RELEASE:     $(RELEASE)"
	@echo "BINARY:      $(BINARY)"
	@echo "LDFLAGS:     $(LDFLAGS)"
	@echo "MAIN:        $(MAIN)"
.PHONY: build-env

build:
	$(AT) go build -o $(BINARY) $(LDFLAGS) $(MAIN)
.PHONY: build

build-with-race:
	$(AT) go build -race -o $(BINARY) $(LDFLAGS) $(MAIN)
.PHONY: build-with-race

install:
	$(AT) go install $(LDFLAGS) $(MAIN)
.PHONY: install

install-clean:
	$(AT) go clean -cache
.PHONY: install-clean
