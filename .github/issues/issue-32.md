---
code: null
id: MDU6SXNzdWU3ODI2NTMyNjY=
databaseId: 782653266
number: 32
url: https://github.com/octomation/makefiles/issues/32
title: "implement verbose mode for complex rules"
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
createdAt: 2021-01-09T17:43:19Z
updatedAt: 2021-09-05T16:40:58Z
lastEditedAt: null
closedAt: 2021-01-09T18:28:12Z
---

# implement verbose mode for complex rules

```make
AT := @

verbose:
	$(eval AT :=)
	@echo > /dev/null
.PHONY: verbose
```

candidates:

- rmdir
- deps-update, deps-update-all
- toolset
- hooks
- git-check
