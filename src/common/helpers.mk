find-todos:
	$(AT) grep \
		--exclude-dir={bin,docs} \
		--exclude-dir={node_modules,vendor} \
		--exclude-dir={.docz,.next} \
		--color \
		--text \
		-inRo -E ' TODO:.*|SkipNow' . | grep -v ' TODO:.*|SkipNow' || true
.PHONY: find-todos

help:
	@LC_ALL=C $(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null \
	| awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' \
	| sort \
	| egrep -v -e '^[^[:alnum:]]' -e '^$@$$' || true
.PHONY: help

make-verbose:
	$(eval AT :=) $(eval MAKE := $(MAKE) verbose) @true
.PHONY: make-verbose
