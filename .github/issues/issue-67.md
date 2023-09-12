---
code: null
id: I_kwDODZzKdc5SNxod
databaseId: 1379342877
number: 67
url: https://github.com/octomation/makefiles/issues/67
title: "go: something wrong with go targets"
issueType: null
labels: []
assignees:
  - kamilsk
milestone: null
parent: null
issueFields: {}
state: CLOSED
stateReason: COMPLETED
duplicateOf: null
createdAt: 2022-09-20T12:30:26Z
updatedAt: 2023-01-06T19:56:34Z
lastEditedAt: null
closedAt: 2023-01-06T19:56:34Z
---

# go: something wrong with go targets

**Steps to reproduce**

```bash
$ make test
bash: line 1: Support/JetBrains/Toolbox/scripts: No such file or directory
bash: line 1: Support/JetBrains/Toolbox/scripts: No such file or directory
```

<!-- 2022-09-20T12:55Z https://github.com/octomation/makefiles/issues/67#issuecomment-1252314111
solution is

```
diff --git a/Makefile b/Makefile
index d077029..dfdbd75 100644
--- a/Makefile
+++ b/Makefile
@@ -78,7 +78,7 @@ GOBIN       ?= $(PWD)/bin/$(OS)/$(ARCH)
 GOFLAGS     ?= -mod=
 GOPRIVATE   ?= go.octolab.net
 GOPROXY     ?= direct
-GOTEST      ?= $(shell PATH=$(PATH) command -v testit)
+GOTEST      ?= $(shell PATH="$(PATH)" command -v testit)
 GOTESTFLAGS ?=
 GOTRACEBACK ?= all
 LOCAL       ?= $(MODULE)
@@ -169,7 +169,7 @@ GODOC_HOST ?= localhost:6060

 go-docs:
 	$(AT) (sleep 2 && open http://$(GODOC_HOST)/pkg/$(LOCAL)/) &
-	$(AT) godoc -http=$(GODOC_HOST)
+	$(AT) godoc -http="$(GODOC_HOST)"
 .PHONY: go-docs

 go-fmt:
@@ -311,7 +311,7 @@ tools-update: tools-disabled
 .PHONY: tools-update
 endif

-ifneq (, $(shell PATH=$(PATH) command -v docker))
+ifneq (, $(shell PATH="$(PATH)" command -v docker))
 ifdef GO_VERSIONS

 define go_tpl
```
-->
