---
id: 26
database_id: 778866938
node_id: MDU6SXNzdWU3Nzg4NjY5Mzg=
status: closed
title: "exclude bin dir for todo"
labels: []
url: https://github.com/octomation/makefiles/issues/26
created_at: 2021-01-05T10:54:13Z
updated_at: 2021-09-05T16:40:57Z
---

# exclude bin dir for todo

```bash
$ make todo
./paas/rpcprotocol/rater.go:51: TODO:legacy
./bin/darwin/x86_64/golangci-lint:13933:SkipNow
./bin/darwin/x86_64/golangci-lint:14403:SkipNow
./bin/darwin/x86_64/golangci-lint:17188: TODO: pushState with updated state and read it on page load,
./bin/darwin/x86_64/golangci-lint:17333: TODO: Implement smarter auto-zoom using the viewBox attribute
./bin/darwin/x86_64/golangci-lint:17372: TODO: scale the graph with the viewBox attribute.
./components/makefiles/vendor.mk:20: TODO:.*|SkipNow' . || true
```
