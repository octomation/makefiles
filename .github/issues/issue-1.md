---
code: null
id: MDU6SXNzdWU1NTQxMjEyMDI=
databaseId: 554121202
number: 1
url: https://github.com/octomation/makefiles/issues/1
title: "bug with export directive"
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
createdAt: 2020-01-23T12:15:43Z
updatedAt: 2021-09-05T16:41:19Z
lastEditedAt: null
closedAt: 2020-01-25T20:14:19Z
---

# bug with export directive

if SHELL is not defined then export PATH didn't work properly.

steps to reproduce:
- define export path + shell, exec
```make
print:
    which <file in path>
```
- remove shell, exec the same target

https://www.gnu.org/software/make/manual/make.html#Variables_002fRecursion
https://stackoverflow.com/questions/8941110/how-i-could-add-dir-to-path-in-makefile

<!-- 2020-01-25T20:14Z https://github.com/octomation/makefiles/issues/1#issuecomment-578439207
cannot reproduce
-->
