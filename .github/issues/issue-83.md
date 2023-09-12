---
code: null
id: I_kwDODZzKdc8AAAABSwybWw
databaseId: 5554084699
number: 83
url: https://github.com/octomation/makefiles/issues/83
title: "doctor: compare the repository with GitHub and explain fixes"
issueType: null
labels:
  - "type: feature"
  - "scope: code"
  - "impact: medium"
  - "effort: medium"
assignees:
  - kamilsk
milestone: null
parent: null
issueFields: {}
state: OPEN
stateReason: null
duplicateOf: null
createdAt: 2026-09-23T13:24:06Z
updatedAt: 2026-09-23T13:24:08Z
lastEditedAt: null
closedAt: null
---

# doctor: compare the repository with GitHub and explain fixes

**Motivation:** configuration drift (Pages, secrets, default branch, goreleaser config) surfaces only when a release fails in CI, long after the change.

**Contract:** `make doctor` runs `node .github/scripts/release.mjs doctor` with the local `gh` auth and prints one line per check: `ok`, `fail` or `unverified`, each failure with what to fix and where (file, setting, secret scope, permissions). Exits 1 on any `fail`; `unverified` is never reported as passed.

**PoC:** octopot/indexit `Makefile`, `.github/workflows/doctor.yml`.

**Related issues:**

- octomation/go-tool#556
