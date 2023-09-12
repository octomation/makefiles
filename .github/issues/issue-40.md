---
code: null
id: MDU6SXNzdWU3OTE3NzQ2NjY=
databaseId: 791774666
number: 40
url: https://github.com/octomation/makefiles/issues/40
title: "makefile has a problem with GOTEST"
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
createdAt: 2021-01-22T07:33:29Z
updatedAt: 2021-09-05T16:41:00Z
lastEditedAt: null
closedAt: 2021-01-22T08:12:18Z
---

# makefile has a problem with GOTEST

see https://travis-ci.com/github/kamilsk/breaker/jobs/474205925

```
$ if [[ $TRAVIS_GO_VERSION == 1.15* ]]; then
  make test-with-coverage
else
  make test
fi

/bin/bash: line 1: -cover: command not found
Makefile:156: recipe for target 'test-with-coverage' failed
make: *** [test-with-coverage] Error 127
The command "if [[ $TRAVIS_GO_VERSION == 1.15* ]]; then
  make test-with-coverage
else
  make test
fi
" exited with 2.
```
