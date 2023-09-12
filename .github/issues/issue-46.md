---
code: null
id: MDU6SXNzdWU4MDYxNDI0NzM=
databaseId: 806142473
number: 46
url: https://github.com/octomation/makefiles/issues/46
title: "SHELL with ?= not work"
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
createdAt: 2021-02-11T07:19:47Z
updatedAt: 2021-09-05T16:41:01Z
lastEditedAt: null
closedAt: 2021-02-12T19:03:49Z
---

# SHELL with ?= not work

- test it first in sandbox
- add a possibility to read shell from env (/usr/bin/env)

<!-- 2021-02-11T07:21Z https://github.com/octomation/makefiles/issues/46#issuecomment-777248136
```make
SHELL ?= /usr/local/bin/bash -euo pipefail

env:
    echo $(SHELL) # prints /usr/bin/sh
.PHONY: env
```
-->
