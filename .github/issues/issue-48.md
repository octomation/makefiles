---
code: null
id: MDU6SXNzdWU4MDc2OTMyMzY=
databaseId: 807693236
number: 48
url: https://github.com/octomation/makefiles/issues/48
title: "improve deps-update/tools-update"
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
createdAt: 2021-02-13T06:58:23Z
updatedAt: 2021-09-05T16:41:02Z
lastEditedAt: null
closedAt: 2021-02-13T06:58:58Z
---

# improve deps-update/tools-update

replace `go mod -edit` + `go mod download` by `go get -d $$package/...@latest`
