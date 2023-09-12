---
code: null
id: I_kwDODZzKdc8AAAABSlGhNw
databaseId: 5541830967
number: 79
url: https://github.com/octomation/makefiles/issues/79
title: "go: dist: go-dist-installer has no maintained godownloader"
issueType: null
labels:
  - "type: bug"
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
createdAt: 2026-09-22T15:40:59Z
updatedAt: 2026-09-22T15:42:23Z
lastEditedAt: null
closedAt: null
---

# go: dist: go-dist-installer has no maintained godownloader

**Motivation:** `src/go/dist.mk` generates the installation script with a tool
that no longer has a usable source.

```make
go-dist-installer:
	$(AT) godownloader .goreleaser.yml >bin/install
```

- `github.com/goreleaser/godownloader` is archived and marked DEPRECATED
  upstream; its last push was 2021-07-17.
- It cannot be installed at all, because its own `go.mod` carries `replace`
  directives: `go install github.com/goreleaser/godownloader@v0.1.0` fails with
  "The go.mod file for the module providing named packages contains one or more
  replace directives."
- Consuming projects reached it through `github.com/kamilsk/godownloader`, a
  fork that is no longer maintained and is being dropped from tools modules.

The generated scripts are still in use: `install.octolab.org` serves them, and
`bin/install` is committed in each project, so nothing is broken until the
script has to be regenerated. `octopot/indexit` has already removed the fork
from `tools/go.mod`, which leaves `go-dist-installer` without a binary.

## Acceptance criteria

- [ ] Decide the fate of `go-dist-installer`: pick a maintained generator,
      vendor a static installer template, or drop the target.
- [ ] If a replacement is chosen, the regenerated `bin/install` keeps the
      platform matrix documented in `octomation/install` (darwin and linux,
      amd64 and arm64) and the `-b <dir>`, `-h`, `-dx` flags.
- [ ] Update `src/go/dist.mk` and regenerate the `dist` Makefiles.
- [ ] Roll the change into consuming projects.

## Out of scope

- Republishing the existing scripts on `install.octolab.org`.
