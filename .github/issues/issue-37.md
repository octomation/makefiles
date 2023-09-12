---
code: null
id: MDU6SXNzdWU3ODM3MjcxOTY=
databaseId: 783727196
number: 37
url: https://github.com/octomation/makefiles/issues/37
title: "deps-update has issue with simple module"
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
createdAt: 2021-01-11T21:44:04Z
updatedAt: 2021-09-05T16:40:59Z
lastEditedAt: null
closedAt: 2021-01-12T20:25:22Z
---

# deps-update has issue with simple module

```bash
$ make deps-update
go get .@latest: can't request explicit version of path in main module
make: *** [deps-update] Error 1
```
