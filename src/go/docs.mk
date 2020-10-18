GODOC_HOST ?= localhost:6060

docs:
	@(sleep 2 && open http://$(GODOC_HOST)/pkg/$(LOCAL)/) &
	@godoc -http=$(GODOC_HOST)
.PHONY: docs
