---
id: 40
database_id: 791774666
node_id: MDU6SXNzdWU3OTE3NzQ2NjY=
status: closed
title: "makefile has a problem with GOTEST"
labels: []
url: https://github.com/octomation/makefiles/issues/40
created_at: 2021-01-22T07:33:29Z
updated_at: 2021-09-05T16:41:00Z
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
