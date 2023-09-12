---
code: null
id: MDU6SXNzdWU3Nzg4OTAwMTc=
databaseId: 778890017
number: 28
url: https://github.com/octomation/makefiles/issues/28
title: "add verify target"
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
createdAt: 2021-01-05T11:23:03Z
updatedAt: 2021-09-05T16:40:57Z
lastEditedAt: null
closedAt: 2021-01-05T16:45:07Z
---

# add verify target

```make
verify: deps-check generate git-check|git-verify lint test
```
