git-verify:
	@git diff --exit-code >/dev/null
	@git diff --cached --exit-code >/dev/null
	@! git ls-files --others --exclude-standard | grep -q ^
.PHONY: git-verify
