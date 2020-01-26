.PHONY: deps
deps:
	@go mod tidy
	@if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi

.PHONY: deps-clean
deps-clean:
	@go clean -modcache

.PHONY: update
update: selector = '.Require[] | select(.Indirect != true) | .Path'
update:
	@if command -v egg > /dev/null; then \
		packages="`egg deps list`"; \
		go get -mod= -u $$packages; \
	elif command -v jq > /dev/null; then \
		packages="`go mod edit -json | jq -r $(selector)`"; \
		go get -mod= -u $$packages; \
	else \
		packages="$(shell cat go.mod | grep -v '// indirect' | grep '\t' | awk '{print $$1}')"; \
		go get -mod= -u $$packages; \
	fi
