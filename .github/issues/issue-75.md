---
code: null
id: I_kwDODZzKdc5ztgNH
databaseId: 1941308231
number: 75
url: https://github.com/octomation/makefiles/issues/75
title: "go: docker: change entrypoint name"
issueType: null
labels:
  - "type: improvement"
  - "scope: code"
  - "impact: medium"
  - "effort: easy"
assignees:
  - kamilsk
milestone: "[[milestone-1]]"
parent: null
issueFields: {}
state: OPEN
stateReason: null
duplicateOf: null
createdAt: 2023-10-13T06:14:08Z
updatedAt: 2023-10-13T06:14:09Z
lastEditedAt: null
closedAt: null
---

# go: docker: change entrypoint name

**Motivation:** make it more consistent with toolchain.

E.g.,

```
module go.octolab.org/module

go 1.20

toolchain go1.20.10
```

`golang` has that tag https://hub.docker.com/_/golang/tags

So, I can use the same directive `toolchain go1.20.10` -> `make go1.20.10`, and automate the call: `make toolchain` (it reads toolchain and use appropriate image).

Problem: there is no 1.20.0 image tag.
