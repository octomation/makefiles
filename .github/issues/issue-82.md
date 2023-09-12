---
code: null
id: I_kwDODZzKdc8AAAABSwyYTg
databaseId: 5554083918
number: 82
url: https://github.com/octomation/makefiles/issues/82
title: "release: release-check: offline release tag guardrail"
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
createdAt: 2026-09-23T13:24:03Z
updatedAt: 2026-09-23T13:24:28Z
lastEditedAt: 2026-09-23T13:24:28Z
closedAt: null
---

# release: release-check: offline release tag guardrail

**Motivation:** a broken release should be caught before the tag leaves the machine, by the same check the `pre-push` hook and CI run.

**Contract:** `make release-check TAG=vX.Y.Z` runs `config-vet`, then `node .github/scripts/release.mjs check $(TAG)` (offline: tag pattern, the note exists in the tagged commit and matches the worktree, frontmatter and H1, no MDX, the tag is on its release branch), then `goreleaser check`. Without `TAG` it prints usage and exits 2. It builds nothing; snapshots stay in `go-dist-check`.

**PoC:** octopot/indexit `Makefile`, `.github/scripts/release.mjs`.

**Related issues:**

- octomation/go-tool#556 — release policy and curated notes.
- [[issue-81]] — the hook that runs the same check.
- [[issue-84]] — `config-vet`, run first.
