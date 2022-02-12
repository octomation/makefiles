ifneq (, $(wildcard bin/lib/git/hooks/))
ifdef GIT_HOOKS

git-hooks: git-unhook
	$(AT) for hook in $(GIT_HOOKS); do \
		cp bin/lib/git/hooks/$$hook .git/hooks/; \
	done
.PHONY: git-hooks

git-unhook:
	$(AT) ls .git/hooks \
	| grep -v .sample \
	| sed 's|.*|.git/hooks/&|' \
	| xargs rm -f || true
.PHONY: git-unhook

define hook_tpl
git-$(1):
	$$(AT) bin/lib/git/hooks/$(1)
.PHONY: git-$(1)
endef

render_hook_tpl = $(eval $(call hook_tpl,$(hook)))
$(foreach hook,$(GIT_HOOKS),$(render_hook_tpl))

endif
else
git-hooks:
	@echo have no git hooks
.PHONY: git-hooks

git-unhook: ;
.PHONY: git-unhook
endif
