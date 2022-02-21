find-todos:
	$(AT) grep \
		--exclude-dir={bin,docs,node_modules,vendor} \
		--color \
		--text \
		-inRo -E ' TODO:.*|SkipNow' . | grep -v ' TODO:.*|SkipNow' || true
.PHONY: find-todos

make-verbose:
	$(eval AT :=) $(eval MAKE := $(MAKE) verbose) @true
.PHONY: make-verbose
