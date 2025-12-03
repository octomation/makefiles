---
id: 37
database_id: 783727196
node_id: MDU6SXNzdWU3ODM3MjcxOTY=
status: closed
title: "deps-update has issue with simple module"
labels: []
url: https://github.com/octomation/makefiles/issues/37
created_at: 2021-01-11T21:44:04Z
updated_at: 2021-09-05T16:40:59Z
---

# deps-update has issue with simple module

```bash
$ make deps-update 
go get .@latest: can't request explicit version of path in main module
make: *** [deps-update] Error 1
```
