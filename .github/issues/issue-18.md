---
code: null
id: MDU6SXNzdWU3NDY4ODgxMTE=
databaseId: 746888111
number: 18
url: https://github.com/octomation/makefiles/issues/18
title: "use ?= to allow rewrites env vars"
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
createdAt: 2020-11-19T20:11:12Z
updatedAt: 2021-09-05T16:41:23Z
lastEditedAt: 2020-11-19T20:11:25Z
closedAt: 2020-12-28T17:46:04Z
---

# use ?= to allow rewrites env vars

```make

GO111MODULE ?= on
GOFLAGS     ?= -mod=vendor
GOPRIVATE   ?= go.octolab.org
GOPROXY     ?= direct
LOCAL       ?= $(MODULE)
MODULE      ?= `GO111MODULE=on go list -m $(GOFLAGS)`
PACKAGES    ?= `GO111MODULE=on go list $(GOFLAGS) ./...
PATHS       ?= $(shell echo $(PACKAGES) | sed -e "s|$(MODULE)/||g" | sed -e "s|$(MODULE)|$(PWD)/*.go|g")
TIMEOUT     ?= 10s

```

and remove `GO111MODULE=on`
