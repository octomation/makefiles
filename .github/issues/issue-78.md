---
code:
id: I_kwDODZzKdc8AAAABSjpQTQ
databaseId: 5540302925
number: 78
url: https://github.com/octomation/makefiles/issues/78
title: "go: revisit GOPROXY=direct and the unused GOPRIVATE domain"
labels:
  - "type: improvement"
  - "scope: code"
  - "impact: high"
  - "effort: easy"
milestone:
state: OPEN
stateReason:
createdAt: 2026-09-22T13:30:59Z
updatedAt: 2026-09-22T13:30:59Z
lastEditedAt:
closedAt:
---

# go: revisit GOPROXY=direct and the unused GOPRIVATE domain

**Motivation:** `src/go/env.mk` still carries a pair of settings inherited from
`kamilsk/egg` in December 2019, and the conditions that made them free have
changed.

```make
GOPRIVATE   ?= go.octolab.net
GOPROXY     ?= direct
```

History

- `59e22bf` (egg, 2019-12-29) introduced `GOPROXY = direct` while `GOPRIVATE`
  was empty, so it was never a private-module setting.
- `85324b0` (egg, 2020-01-01) filled `GOPRIVATE` with `go.octolab.net`, a domain
  that hosts no modules and is referenced by no project using this template.
- Back then `GOFLAGS = -mod=vendor`, so builds never hit the network and
  `direct` cost nothing. The template later moved to `GOFLAGS ?= -mod=`, and
  `direct` now resolves the entire module graph over git on every clean runner.

Consequences observed in `octopot/indexit`

- Dependency setup takes ~5.5 minutes on a cold runner.
- Concurrent `git fetch --unshallow` into the shared VCS cache races and fails:
  `fatal: shallow file has changed since we read it`
  ([run 35515296577](https://github.com/octopot/indexit/actions/runs/35515296577/job/106090100409)).
  The module that failed was `google.golang.org/protobuf`, a third-party
  transitive dependency, not an OctoLab one.

**Proposal:** keep the direct path where it carries meaning — verifying that the
`go.octolab.org` vanity domain resolves over verified HTTPS on a fresh runner,
as required by [indexit#102](https://github.com/octopot/indexit/issues/102) —
and let everything else use the public proxy.

```make
GOPRIVATE   ?= go.octolab.org
GOPROXY     ?= https://proxy.golang.org,direct
```

`GOPRIVATE` forces OctoLab modules past the proxy and the checksum database, so
a broken vanity domain still fails CI instead of being masked by cached proxy
copies.

Verified in `octopot/indexit` before filing

- `go.octolab.org@v0.12.2` into an empty `GOMODCACHE` still resolves through
  `https://go.octolab.org/?go-get=1` (200 OK), never through the proxy.
- `make go-deps-fetch` on a clean cache: 2m11s, down from 5m48s in CI.
- `make go-build` and `make go-test` pass.

## Acceptance criteria

- [ ] Decide whether `go.octolab.net` is still reserved for anything; drop it
      from the template if not.
- [ ] Update `src/go/env.mk` and regenerate `dist/Go Module`, `dist/Go Service`,
      and `dist/Go Tool`.
- [ ] Confirm the vanity-domain canary still fails when `go.octolab.org` is
      unreachable.
- [ ] Roll the change into consuming projects.
