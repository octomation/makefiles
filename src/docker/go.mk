define go_tpl
.PHONY: go$(1)
go$(1):
	docker run \
		--rm -it \
		-v $(PWD):/src \
		-w /src \
		golang:$(1) bash
endef

render_go_tpl = $(eval $(call go_tpl,$(version)))
$(foreach version,1.11 1.12 1.13 1.14,$(render_go_tpl))
