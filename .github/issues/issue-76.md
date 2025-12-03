---
id: 76
database_id: 1963311338
node_id: I_kwDODZzKdc51BcDq
status: open
title: "go: goreleaser: replace --skip-publish flag"
labels: ["type: improvement","scope: code","impact: medium","effort: easy"]
url: https://github.com/octomation/makefiles/issues/76
created_at: 2023-10-26T11:27:27Z
updated_at: 2023-10-26T11:27:27Z
---

# go: goreleaser: replace --skip-publish flag

**Motivation:** it's deprecated, see https://goreleaser.com/deprecations/#-skip.

Replace it by `--skip=publish`.
