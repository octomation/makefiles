---
id: 32
database_id: 782653266
node_id: MDU6SXNzdWU3ODI2NTMyNjY=
status: closed
title: "implement verbose mode for complex rules"
labels: []
url: https://github.com/octomation/makefiles/issues/32
created_at: 2021-01-09T17:43:19Z
updated_at: 2021-09-05T16:40:58Z
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
