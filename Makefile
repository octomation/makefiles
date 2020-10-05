.DEFAULT_GOAL = compile

compile:
	@ls | grep .mk | go run dist/compiler.go
.PHONY: compile
