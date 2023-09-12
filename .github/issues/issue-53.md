---
code: null
id: MDU6SXNzdWU4NTUxMTgxMDk=
databaseId: 855118109
number: 53
url: https://github.com/octomation/makefiles/issues/53
title: "run tests"
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
createdAt: 2021-04-10T17:33:38Z
updatedAt: 2022-08-08T19:35:46Z
lastEditedAt: 2021-04-10T18:44:19Z
closedAt: 2022-08-08T19:35:45Z
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

<!-- 2021-04-10T18:44Z https://github.com/octomation/makefiles/issues/53#issuecomment-817185815
https://github.com/kamilsk/dotfiles/issues/142
-->

<!-- 2022-08-08T19:35Z https://github.com/octomation/makefiles/issues/53#issuecomment-1208529540
won't do. it's difficult with low benefits
-->
