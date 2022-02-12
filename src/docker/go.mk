ifneq (, $(shell PATH="$(PATH)" command -v docker))
ifdef GO_VERSIONS

define go_tpl
go-$(1):
	$$(AT) docker run \
		--rm -it \
		-v $(PWD):/src \
		-w /src \
		golang:$(1) bash
.PHONY: go-$(1)
endef

render_go_tpl = $(eval $(call go_tpl,$(version)))
$(foreach version,$(GO_VERSIONS),$(render_go_tpl))

endif
endif
