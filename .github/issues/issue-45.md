---
code: null
id: MDU6SXNzdWU4MDYxMzk3MDY=
databaseId: 806139706
number: 45
url: https://github.com/octomation/makefiles/issues/45
title: "replace test-verbose and others by GOTESTFLAGS"
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
createdAt: 2021-02-11T07:14:46Z
updatedAt: 2021-09-05T16:41:01Z
lastEditedAt: null
closedAt: 2021-02-12T18:51:06Z
---

# replace test-verbose and others by GOTESTFLAGS

```make
GOTESTFLAGS ?=

verbose:
	$(eval GOTESTFLAGS := $(GOTESTFLAGS) -v)
	@echo > /dev/null
.PHONY: verbose

test:
	@test $(GOTESTFLAGS) ./...
.PHONY: test
```

```bash
$ make verbose test
```

<!-- 2021-02-11T07:15Z https://github.com/octomation/makefiles/issues/45#issuecomment-777246148
I have to make verbose on top-level, rename current verbose to verbose-make, add verbose-go
-->
