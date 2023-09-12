---
code: null
id: I_kwDODZzKdc8AAAABSs6ewg
databaseId: 5550022338
number: 81
url: https://github.com/octomation/makefiles/issues/81
title: "git: hooks: versioned hooks in .github/hooks via core.hooksPath"
issueType: null
labels:
  - "type: improvement"
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
createdAt: 2026-09-23T07:08:06Z
updatedAt: 2026-09-23T07:08:08Z
lastEditedAt: null
closedAt: null
---

# git: hooks: versioned hooks in .github/hooks via core.hooksPath

**Motivation:** git hooks should live in the repository, be versioned and reviewed like any other code, and be active right after `make setup`. Today `src/git/hooks.mk` copies hooks listed in `GIT_HOOKS` from `bin/lib/git/hooks/` into `.git/hooks/`: they are copies, go stale silently, need a separate `make git-hooks` after every change, and `git-unhook` wipes anything else a developer put there.

**Proposal:**

- hooks live in `.github/hooks/` (no new top-level folders), executable, one file per hook;
- `git-config` in `src/git/env.mk` sets `git config core.hooksPath .github/hooks` when the folder exists, so `make setup` wires them in once and edits take effect immediately;
- decide the fate of `bin/lib/git/hooks` + `GIT_HOOKS` + `git-hooks`/`git-unhook`/`git-<hook>`: migrate and drop, or keep as a fallback; the two mechanisms must not both be active (`core.hooksPath` makes `.git/hooks` ignored);
- `git-unhook` becomes `git config --unset core.hooksPath`.

**PoC:** octopot/indexit — `.github/hooks/pre-push` (refuses a `v*` tag without a committed changelog note), `core.hooksPath` set in `git-config`.

**Related issues:**

- octomation/go-tool#556 — release policy and curated changelog notes, the first consumer of versioned hooks.

**Out of scope:** what the hooks check; that is per-project policy.
