# sourced by https://github.com/octomation/makefiles

.DEFAULT_GOAL = init

init:
	@git submodule update --init --recursive
.PHONY: init

pull:
	@git submodule update --recursive --remote
.PHONY: pull
