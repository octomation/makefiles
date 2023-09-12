---
code: null
id: MDU6SXNzdWU4MjMwMDU3MDY=
databaseId: 823005706
number: 50
url: https://github.com/octomation/makefiles/issues/50
title: "tools-update didn't work properly"
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
createdAt: 2021-03-05T11:38:46Z
updatedAt: 2022-03-26T18:11:34Z
lastEditedAt: null
closedAt: 2022-03-26T18:11:34Z
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

<!-- 2021-03-05T11:40Z https://github.com/octomation/makefiles/issues/50#issuecomment-791365877
maybe it's happening because I also depend on `google.golang.org/protobuf v1.25.0`
in this case it try to find that version of `github.com/grpc-ecosystem/grpc-gateway/v2` which compatible with the version of protobuf.
-->

<!-- 2021-03-05T11:49Z https://github.com/octomation/makefiles/issues/50#issuecomment-791370257
Also I have a lot of indirect deps (go-service) and one for go-tool:

```
require (
	github.com/golang/mock v1.5.0
	github.com/golangci/golangci-lint v1.38.0
	github.com/kyoh86/looppointer v0.1.7
	golang.org/x/exp v0.0.0-20210220032938-85be41e4509f
	golang.org/x/text v0.3.4 // indirect
	golang.org/x/tools v0.1.0
)
```
-->

<!-- 2021-04-10T18:56Z https://github.com/octomation/makefiles/issues/50#issuecomment-817187278
it depends on https://github.com/kamilsk/egg/issues/62
-->
