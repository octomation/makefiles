---
code: null
id: MDU6SXNzdWU1ODk1ODU1Nzg=
databaseId: 589585578
number: 8
url: https://github.com/octomation/makefiles/issues/8
title: "make update has a problem with go 1.14"
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
createdAt: 2020-03-28T14:17:00Z
updatedAt: 2021-09-05T16:41:20Z
lastEditedAt: null
closedAt: 2020-03-29T06:45:53Z
---

# make update has a problem with go 1.14

```
$ make update
flag provided but not defined: -mod
usage: go get [-d] [-t] [-u] [-v] [-insecure] [build flags] [packages]
Run 'go help get' for details.
make: *** [update] Error 2
```

<!-- 2020-03-28T14:18Z https://github.com/octomation/makefiles/issues/8#issuecomment-605453295
solution is

```make
.PHONY: update
update: selector = '{{if not (or .Main .Indirect)}}{{.Path}}{{end}}'
update:
	@if command -v egg > /dev/null; then \
		packages="`egg deps list`"; \
	else \
		packages="`go list -f $(selector) -m all`"; \
	fi; GOFLAGS=-mod= go get -d -u $$packages
```
-->
