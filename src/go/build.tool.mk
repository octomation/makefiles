BINARY  ?= $(GOBIN)/$(shell basename $(MAIN))
LDFLAGS ?= -ldflags "-s -w -X main.version=$(RELEASE) -X main.commit=$(COMMIT) -X main.date=$(DATE)"
MAIN    ?= $(MODULE)

go-build-env:
	@echo "DATE:        $(DATE)"
	@echo "COMMIT:      $(COMMIT)"
	@echo "RELEASE:     $(RELEASE)"
	@echo "BINARY:      $(BINARY)"
	@echo "LDFLAGS:     $(LDFLAGS)"
	@echo "MAIN:        $(MAIN)"
.PHONY: go-build-env

go-build:
	$(AT) go build -o $(BINARY) $(LDFLAGS) $(MAIN)
.PHONY: go-build

go-build-with-race:
	$(AT) go build -race -o $(BINARY) $(LDFLAGS) $(MAIN)
.PHONY: go-build-with-race

go-install:
	$(AT) go install $(LDFLAGS) $(MAIN)
.PHONY: go-install

go-install-clean:
	$(AT) go clean -cache
.PHONY: go-install-clean
