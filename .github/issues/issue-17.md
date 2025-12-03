---
id: 17
database_id: 746887313
node_id: MDU6SXNzdWU3NDY4ODczMTM=
status: closed
title: "review test-with-coverage"
labels: []
url: https://github.com/octomation/makefiles/issues/17
created_at: 2020-11-19T20:09:59Z
updated_at: 2021-09-05T16:41:23Z
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
