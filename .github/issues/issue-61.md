---
id: 61
database_id: 1331604480
node_id: I_kwDODZzKdc5PXqwA
status: closed
title: "go: support -fuzzcache by go clean"
labels: []
url: https://github.com/octomation/makefiles/issues/61
created_at: 2022-08-08T09:40:24Z
updated_at: 2022-08-08T19:35:10Z
---

# go: support -fuzzcache by go clean

**Motivation:** better cleaning.

> ### go test
>
> The go command now supports additional command line options for the new fuzzing support described above:
>
> go test supports -fuzz, -fuzztime, and -fuzzminimizetime options. For documentation on these see [go help testflag](safari-reader://go.dev/pkg/cmd/go#hdr-Testing_flags).
> go clean supports a -fuzzcache option. For documentation see [go help clean](safari-reader://go.dev/pkg/cmd/go#hdr-Remove_object_files_and_cached_files).
