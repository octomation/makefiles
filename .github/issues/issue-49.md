---
code: null
id: MDU6SXNzdWU4MDk0MjU5ODg=
databaseId: 809425988
number: 49
url: https://github.com/octomation/makefiles/issues/49
title: "check target execution possibility"
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
createdAt: 2021-02-16T15:49:00Z
updatedAt: 2021-09-05T16:41:02Z
lastEditedAt: 2021-02-23T20:33:29Z
closedAt: 2021-02-24T19:52:23Z
---

# check target execution possibility

in some cases, I don't want to use tools/etc, but I use a template and it's not ok to adapt it locally.
it will be great to use check before enabling some targets:

```make
ifeq (, wildcard(tools/*))
  target with stub
else
  valid target
endif
```

candidates:
- [x] tools
- [x] dist without goreleaser/godownloader
- [ ] git hooks
