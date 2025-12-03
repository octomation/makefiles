---
id: 18
database_id: 746888111
node_id: MDU6SXNzdWU3NDY4ODgxMTE=
status: closed
title: "use ?= to allow rewrites env vars"
labels: []
url: https://github.com/octomation/makefiles/issues/18
created_at: 2020-11-19T20:11:12Z
updated_at: 2021-09-05T16:41:23Z
---

# use ?= to allow rewrites env vars

```make

GO111MODULE ?= on
GOFLAGS     ?= -mod=vendor
GOPRIVATE   ?= go.octolab.org
GOPROXY     ?= direct
LOCAL       ?= $(MODULE)
MODULE      ?= `GO111MODULE=on go list -m $(GOFLAGS)`
PACKAGES    ?= `GO111MODULE=on go list $(GOFLAGS) ./...
PATHS       ?= $(shell echo $(PACKAGES) | sed -e "s|$(MODULE)/||g" | sed -e "s|$(MODULE)|$(PWD)/*.go|g")
TIMEOUT     ?= 10s

```

and remove `GO111MODULE=on`
