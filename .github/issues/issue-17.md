---
code: null
id: MDU6SXNzdWU3NDY4ODczMTM=
databaseId: 746887313
number: 17
url: https://github.com/octomation/makefiles/issues/17
title: "review test-with-coverage"
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
createdAt: 2020-11-19T20:09:59Z
updatedAt: 2021-09-05T16:41:23Z
lastEditedAt: null
closedAt: 2020-12-28T17:55:27Z
---

# review test-with-coverage

```make

.PHONY: test-with-coverage
test-with-coverage:
	@go test -cover -covermode atomic -coverprofile c.out -race -timeout $(TIMEOUT) $(PACKAGES) | column -t | sort -r

.PHONY: test-with-coverage-report
test-with-coverage-report: test-with-coverage
	@go tool cover -html c.out

```

remove `test-with-coverage-profile`
