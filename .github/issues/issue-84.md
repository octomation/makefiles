---
code: null
id: I_kwDODZzKdc8AAAABSwyesw
databaseId: 5554085555
number: 84
url: https://github.com/octomation/makefiles/issues/84
title: "config: config-vet: validate .github/settings.json against its CUE schema"
issueType: null
labels:
  - "type: feature"
  - "scope: code"
  - "impact: medium"
  - "effort: easy"
assignees:
  - kamilsk
milestone: null
parent: null
issueFields: {}
state: OPEN
stateReason: null
duplicateOf: null
createdAt: 2026-09-23T13:24:11Z
updatedAt: 2026-09-23T13:24:26Z
lastEditedAt: 2026-09-23T13:24:26Z
closedAt: null
---

# config: config-vet: validate .github/settings.json against its CUE schema

**Motivation:** `.github/settings.json` holds the settings that cannot be derived (release policy, required secrets); `.github/settings.cue` documents every field and must keep them valid.

**Contract:** `make config-vet` runs `cue vet -c .github/settings.cue .github/settings.json`, with `cue` installed by `make tools` from the tools module (`//go:generate go install cuelang.org/go/cmd/cue`). A no-op when the files are absent.

**PoC:** octopot/indexit `Makefile`, `.github/settings.{json,cue}`, `tools/tools.go`.

**Related issues:**

- octomation/go-tool#556
- [[issue-82]] — `release-check` depends on it.
