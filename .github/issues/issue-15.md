---
id: 15
database_id: 746885333
node_id: MDU6SXNzdWU3NDY4ODUzMzM=
status: closed
title: "new integration test target"
labels: []
url: https://github.com/octomation/makefiles/issues/15
created_at: 2020-11-19T20:06:53Z
updated_at: 2021-09-05T16:41:22Z
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
