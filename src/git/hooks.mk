ifneq (, $(wildcard bin/lib/git/hooks/))
ifdef GIT_HOOKS

hooks: unhook
	$(AT) for hook in $(GIT_HOOKS); do \
		cp bin/lib/git/hooks/$$hook .git/hooks/; \
	done
.PHONY: hooks

unhook:
	$(AT) ls .git/hooks \
	| grep -v .sample \
	| sed 's|.*|.git/hooks/&|' \
	| xargs rm -f || true
.PHONY: unhook

define hook_tpl
$(1):
	$$(AT) bin/lib/git/hooks/$(1)
.PHONY: $(1)
endef

render_hook_tpl = $(eval $(call hook_tpl,$(hook)))
$(foreach hook,$(GIT_HOOKS),$(render_hook_tpl))

endif
else
hooks:
	@echo have no git hooks
.PHONY: hooks

unhook: ;
.PHONY: unhook
endif
