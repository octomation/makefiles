.PHONY: hooks
hooks:
	@ls .git/hooks | grep -v .sample | sed 's|.*|.git/hooks/&|' | xargs rm -f || true
	@for hook in $(GIT_HOOKS); do cp githooks/$$hook .git/hooks/; done
