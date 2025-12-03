---
id: 1
database_id: 554121202
node_id: MDU6SXNzdWU1NTQxMjEyMDI=
status: closed
title: "bug with export directive"
labels: []
url: https://github.com/octomation/makefiles/issues/1
created_at: 2020-01-23T12:15:43Z
updated_at: 2021-09-05T16:41:19Z
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
