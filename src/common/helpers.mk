find-todo:
	$(AT) grep \
		--exclude=Makefile \
		--exclude-dir={bin,node_modules,vendor} \
		--color \
		--text \
		-inRo -E ' TODO:.*|SkipNow' . || true
.PHONY: find-todo

make-verbose:
	$(eval AT :=) $(eval MAKE := $(MAKE) verbose) @true
.PHONY: make-verbose
