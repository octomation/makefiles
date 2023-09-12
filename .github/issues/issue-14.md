---
code: null
id: MDU6SXNzdWU3MzQ3MjI5MDc=
databaseId: 734722907
number: 14
url: https://github.com/octomation/makefiles/issues/14
title: "go service template doesn't contain target for service and client binaries"
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
createdAt: 2020-11-02T18:21:07Z
updatedAt: 2021-09-05T16:41:22Z
lastEditedAt: 2020-11-02T18:22:17Z
closedAt: 2020-12-28T20:01:50Z
---

# go service template doesn't contain target for service and client binaries

good example

```makefile
ops: MAIN = ./cmd/control/main.go
ops: BINARY = $(BINPATH)/ops
ops: build
.PHONY: ops
```

`make service client`
