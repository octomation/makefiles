---
id: 14
database_id: 734722907
node_id: MDU6SXNzdWU3MzQ3MjI5MDc=
status: closed
title: "go service template doesn't contain target for service and client binaries"
labels: []
url: https://github.com/octomation/makefiles/issues/14
created_at: 2020-11-02T18:21:07Z
updated_at: 2021-09-05T16:41:22Z
---

# go service template doesn't contain target for service and client binaries

good example

```makefile
ops: MAIN = ./cmd/control/main.go
ops: BINARY = $(BINPATH)/ops
ops: build
.PHONY: ops
```

`make service client`
