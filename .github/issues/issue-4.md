---
code: null
id: MDU6SXNzdWU1NjUxOTM1ODI=
databaseId: 565193582
number: 4
url: https://github.com/octomation/makefiles/issues/4
title: "add go mod download"
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
createdAt: 2020-02-14T09:06:50Z
updatedAt: 2021-09-05T16:41:19Z
lastEditedAt: 2020-02-14T09:06:58Z
closedAt: 2020-02-22T18:55:18Z
---

# add go mod download

for pre-filling the local cache or to compute the answers for a Go module proxy

<!-- 2020-02-22T07:02Z https://github.com/octomation/makefiles/issues/4#issuecomment-589926730
> Recommend using go mod download rather than go mod tidy for fetching
dependencies. The tidy function is used to update things and chagnes
the dependency graph. Using the download function avoids any changes.
-->
