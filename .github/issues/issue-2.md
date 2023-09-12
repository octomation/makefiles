---
code: null
id: MDU6SXNzdWU1NjM0Nzk2MjQ=
databaseId: 563479624
number: 2
url: https://github.com/octomation/makefiles/issues/2
title: "use special syntax to list only direct deps instead of jq"
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
createdAt: 2020-02-11T21:11:40Z
updatedAt: 2021-09-05T16:41:19Z
lastEditedAt: null
closedAt: 2020-02-12T19:07:23Z
---

# use special syntax to list only direct deps instead of jq

```
go list -u -f '{{if (and (not (or .Main .Indirect)) .Update)}}{{.Path}}: {{.Version}} -> {{.Update.Version}}{{end}}' -m all 2> /dev/null
```
