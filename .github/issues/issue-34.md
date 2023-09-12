---
code: null
id: MDU6SXNzdWU3ODI2NjQ4MzA=
databaseId: 782664830
number: 34
url: https://github.com/octomation/makefiles/issues/34
title: "bug with test-quick"
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
createdAt: 2021-01-09T18:51:32Z
updatedAt: 2021-09-05T16:40:59Z
lastEditedAt: null
closedAt: 2021-01-09T18:53:34Z
---

# bug with test-quick

- `SHELL ?= /bin/bash -euo pipefail` - pipefail is lost
- `@go test -run ^Fake$$ -tags $(GOTAGS) ./... | grep -v 'no tests to run'` works unproperly if go test run on single-package module without errors
