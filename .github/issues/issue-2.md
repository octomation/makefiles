---
id: 2
database_id: 563479624
node_id: MDU6SXNzdWU1NjM0Nzk2MjQ=
status: closed
title: "use special syntax to list only direct deps instead of jq"
labels: []
url: https://github.com/octomation/makefiles/issues/2
created_at: 2020-02-11T21:11:40Z
updated_at: 2021-09-05T16:41:19Z
---

# use special syntax to list only direct deps instead of jq

```
go list -u -f '{{if (and (not (or .Main .Indirect)) .Update)}}{{.Path}}: {{.Version}} -> {{.Update.Version}}{{end}}' -m all 2> /dev/null
```
