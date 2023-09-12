---
code: null
id: I_kwDODZzKdc5PXqwA
databaseId: 1331604480
number: 61
url: https://github.com/octomation/makefiles/issues/61
title: "go: support -fuzzcache by go clean"
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
createdAt: 2022-08-08T09:40:24Z
updatedAt: 2022-08-08T19:35:10Z
lastEditedAt: null
closedAt: 2022-08-08T19:35:10Z
---

# go: support -fuzzcache by go clean

**Motivation:** better cleaning.

> ### go test
>
> The go command now supports additional command line options for the new fuzzing support described above:
>
> go test supports -fuzz, -fuzztime, and -fuzzminimizetime options. For documentation on these see [go help testflag](safari-reader://go.dev/pkg/cmd/go#hdr-Testing_flags).
> go clean supports a -fuzzcache option. For documentation see [go help clean](safari-reader://go.dev/pkg/cmd/go#hdr-Remove_object_files_and_cached_files).
