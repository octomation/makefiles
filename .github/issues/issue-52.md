---
id: 52
database_id: 855110124
node_id: MDU6SXNzdWU4NTUxMTAxMjQ=
status: closed
title: "refactor verbose target"
labels: []
url: https://github.com/octomation/makefiles/issues/52
created_at: 2021-04-10T16:53:11Z
updated_at: 2021-09-05T17:03:51Z
---

# refactor verbose target

```make
verbose:
	$(eval AT :=) $(eval MAKE := $(MAKE) verbose) @true
.PHONY: verbose
```

it looks better
