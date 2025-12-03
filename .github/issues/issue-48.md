---
id: 48
database_id: 807693236
node_id: MDU6SXNzdWU4MDc2OTMyMzY=
status: closed
title: "improve deps-update/tools-update"
labels: []
url: https://github.com/octomation/makefiles/issues/48
created_at: 2021-02-13T06:58:23Z
updated_at: 2021-09-05T16:41:02Z
---

# improve deps-update/tools-update

replace `go mod -edit` + `go mod download` by `go get -d $$package/...@latest`
