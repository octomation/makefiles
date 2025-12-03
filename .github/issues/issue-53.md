---
id: 53
database_id: 855118109
node_id: MDU6SXNzdWU4NTUxMTgxMDk=
status: closed
title: "run tests"
labels: []
url: https://github.com/octomation/makefiles/issues/53
created_at: 2021-04-10T17:33:38Z
updated_at: 2022-08-08T19:35:46Z
---

# run tests

- [ ] define test suite for each dist
- [ ] define Taskfile with tests function
  - [ ] compgen -A function | grep 'test_'
  - [ ] for loop each of them
  - [x] add alias to the dotfiles
- [ ] extend testit to check
  - [ ] stdout/stderr: `testit assert equal golden/file.txt -- some command` (how to test stdout, stderr, stdout&stderr ?)
  - [ ] git state (assert git diff), verify git state before execution to prevent state corruption
