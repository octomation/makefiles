---
code: null
id: MDU6SXNzdWU4NTUxMTAxMjQ=
databaseId: 855110124
number: 52
url: https://github.com/octomation/makefiles/issues/52
title: "refactor verbose target"
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
createdAt: 2021-04-10T16:53:11Z
updatedAt: 2021-09-05T17:03:51Z
lastEditedAt: 2021-04-10T17:50:28Z
closedAt: 2021-09-05T17:03:51Z
---

# refactor verbose target

```make
verbose:
	$(eval AT :=) $(eval MAKE := $(MAKE) verbose) @true
.PHONY: verbose
```

it looks better
