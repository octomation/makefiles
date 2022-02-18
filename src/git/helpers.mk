git-clean:
	$(AT) git clean -fdx
.PHONY: git-clean

git-check:
	$(AT) git diff --exit-code >/dev/null
	$(AT) git diff --cached --exit-code >/dev/null
	$(AT) ! git ls-files --others --exclude-standard | grep -q ^
.PHONY: git-check

git-rmdir:
	$(AT) for dir in `git ls-files --others --exclude-standard --directory`; do \
		find $${dir%%/} -depth -type d -empty | xargs rmdir; \
	done
.PHONY: git-rmdir
