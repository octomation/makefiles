---
code: null
id: I_kwDODZzKdc5PdOCS
databaseId: 1333059730
number: 62
url: https://github.com/octomation/makefiles/issues/62
title: "go: work: makefiles for go don't support workspace"
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
createdAt: 2022-08-09T10:39:24Z
updatedAt: 2022-08-09T14:39:14Z
lastEditedAt: null
closedAt: 2022-08-09T14:39:14Z
---

# go: work: makefiles for go don't support workspace

**Steps to reproduce**

- define work file
```
go 1.18

use (
	inbox/github
	inbox/trello
)
```

- run format
```bash
$ make format
sed: 1: "s|go.octolab.org/tact/i ...": unterminated substitute pattern
sed: 1: "s|go.octolab.org/tact/i ...": unterminated substitute pattern
stat go.octolab.org/tact/inbox/trello: no such file or directory
stat -ungroup: no such file or directory
stat -w: no such file or directory
```

**Debugging**

```bash
$ go list -m
go.octolab.org/tact/inbox/github
go.octolab.org/tact/inbox/trello
```
