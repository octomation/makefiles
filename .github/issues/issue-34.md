---
id: 34
database_id: 782664830
node_id: MDU6SXNzdWU3ODI2NjQ4MzA=
status: closed
title: "bug with test-quick"
labels: []
url: https://github.com/octomation/makefiles/issues/34
created_at: 2021-01-09T18:51:32Z
updated_at: 2021-09-05T16:40:59Z
---

# bug with test-quick

- `SHELL ?= /bin/bash -euo pipefail` - pipefail is lost
- `@go test -run ^Fake$$ -tags $(GOTAGS) ./... | grep -v 'no tests to run'` works unproperly if go test run on single-package module without errors
