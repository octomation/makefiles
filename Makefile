.DEFAULT_GOAL = compile

.PHONY: compile
compile:
	@ls | grep .mk | go run dist/compile.go
