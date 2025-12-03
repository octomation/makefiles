---
id: 50
database_id: 823005706
node_id: MDU6SXNzdWU4MjMwMDU3MDY=
status: closed
title: "tools-update didn't work properly"
labels: []
url: https://github.com/octomation/makefiles/issues/50
created_at: 2021-03-05T11:38:46Z
updated_at: 2022-03-26T18:11:34Z
---

# tools-update didn't work properly

at go-service:

```bash
$ make update
...
$ git diff tools/go.mod
-       github.com/golangci/golangci-lint v1.37.1
+       github.com/golangci/golangci-lint v1.38.0
```

but expected

```bash
$ make update
...
$ git diff tools/go.mod
-       github.com/golangci/golangci-lint v1.37.1
-       github.com/grpc-ecosystem/grpc-gateway/v2 v2.2.0
+       github.com/golangci/golangci-lint v1.38.0
+       github.com/grpc-ecosystem/grpc-gateway/v2 v2.3.0
-       google.golang.org/protobuf v1.25.0
+       google.golang.org/protobuf v1.25.1-0.20201208041424-160c7477e0e8
```

so, why it's happening as above?
