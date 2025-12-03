---
id: 45
database_id: 806139706
node_id: MDU6SXNzdWU4MDYxMzk3MDY=
status: closed
title: "replace test-verbose and others by GOTESTFLAGS"
labels: []
url: https://github.com/octomation/makefiles/issues/45
created_at: 2021-02-11T07:14:46Z
updated_at: 2021-09-05T16:41:01Z
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
