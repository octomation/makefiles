make-verbose:
	$(eval AT :=) $(eval MAKE := $(MAKE) verbose) @true
.PHONY: make-verbose

find-todo:
	$(AT) grep \
		--exclude=Makefile \
		--exclude-dir={bin,components,node_modules,vendor} \
		--color \
		--text \
		-inRo -E ' TODO:.*|SkipNow' . || true
.PHONY: find-todo
