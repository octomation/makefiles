---
code: null
id: I_kwDODZzKdc51BcDq
databaseId: 1963311338
number: 76
url: https://github.com/octomation/makefiles/issues/76
title: "go: goreleaser: replace --skip-publish flag"
issueType: null
labels:
  - "type: improvement"
  - "scope: code"
  - "impact: medium"
  - "effort: easy"
assignees:
  - kamilsk
milestone: "[[milestone-2]]"
parent: null
issueFields: {}
state: OPEN
stateReason: null
duplicateOf: null
createdAt: 2023-10-26T11:27:27Z
updatedAt: 2023-10-26T11:27:27Z
lastEditedAt: null
closedAt: null
---

# go: goreleaser: replace --skip-publish flag

**Motivation:** it's deprecated, see https://goreleaser.com/deprecations/#-skip.

Replace it by `--skip=publish`.
