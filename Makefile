.DEFAULT_GOAL = compile

compile:
	@ls | grep .mk | maintainer makefile build
.PHONY: compile
