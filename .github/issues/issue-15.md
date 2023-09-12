---
code: null
id: MDU6SXNzdWU3NDY4ODUzMzM=
databaseId: 746885333
number: 15
url: https://github.com/octomation/makefiles/issues/15
title: "new integration test target"
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
createdAt: 2020-11-19T20:06:53Z
updatedAt: 2021-09-05T16:41:22Z
lastEditedAt: null
closedAt: 2020-12-28T17:49:41Z
---

# new integration test target

```make

test-integration:
	@go test \
		-cover \
		-covermode atomic \
		-race \
		-tags=integration \
		-coverprofile integration.out \
		./... | column -t | sort -r
.PHONY: test-integration

test-integration-report: test-with-coverage
	@go tool cover -html integration.out
.PHONY: test-integration-report

```
