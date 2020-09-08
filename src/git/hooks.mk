ifdef GIT_HOOKS

.PHONY: hooks
hooks: unhook
	@for hook in $(GIT_HOOKS); do cp githooks/$$hook .git/hooks/; done

.PHONY: unhook
unhook:
	@ls .git/hooks | grep -v .sample | sed 's|.*|.git/hooks/&|' | xargs rm -f || true

define hook_tpl
.PHONY: $(1)
$(1):
	@githooks/$(1)
endef

render_hook_tpl = $(eval $(call hook_tpl,$(hook)))
$(foreach hook,$(GIT_HOOKS),$(render_hook_tpl))

endif
