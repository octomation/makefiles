---
code: null
id: MDU6SXNzdWU4MjMzMTAwODY=
databaseId: 823310086
number: 51
url: https://github.com/octomation/makefiles/issues/51
title: "strategy for go update is not reliable"
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
createdAt: 2021-03-05T18:12:19Z
updatedAt: 2022-03-26T18:23:50Z
lastEditedAt: null
closedAt: 2022-03-26T18:23:50Z
---

# strategy for go update is not reliable

example for `maintainer`

```bash
$ make update
...
go get: can't request version "latest" of pattern "go.octolab.org/..." that includes the main module (go.octolab.org/toolset/maintainer)
```

<!-- 2021-04-10T18:55Z https://github.com/octomation/makefiles/issues/51#issuecomment-817187120
it depends on https://github.com/kamilsk/egg/issues/61
-->
