---
id: 75
database_id: 1941308231
node_id: I_kwDODZzKdc5ztgNH
status: open
title: "go: docker: change entrypoint name"
labels: ["type: improvement","scope: code","impact: medium","effort: easy"]
url: https://github.com/octomation/makefiles/issues/75
created_at: 2023-10-13T06:14:08Z
updated_at: 2023-10-13T06:14:09Z
---

# go: docker: change entrypoint name

**Motivation:** make it more consistent with toolchain.

E.g.,

```
module go.octolab.org/module

go 1.20

toolchain go1.20.10
```

`golang` has that tag https://hub.docker.com/_/golang/tags

So, I can use the same directive `toolchain go1.20.10` -> `make go1.20.10`, and automate the call: `make toolchain` (it reads toolchain and use appropriate image).

Problem: there is no 1.20.0 image tag.
