---
id: 49
database_id: 809425988
node_id: MDU6SXNzdWU4MDk0MjU5ODg=
status: closed
title: "check target execution possibility"
labels: []
url: https://github.com/octomation/makefiles/issues/49
created_at: 2021-02-16T15:49:00Z
updated_at: 2021-09-05T16:41:02Z
---

# check target execution possibility

in some cases, I don't want to use tools/etc, but I use a template and it's not ok to adapt it locally.
it will be great to use check before enabling some targets:

```make
ifeq (, wildcard(tools/*))
  target with stub
else
  valid target
endif
```

candidates:
- [x] tools
- [x] dist without goreleaser/godownloader
- [ ] git hooks
