# sourced by https://github.com/octomation/makefiles

.DEFAULT_GOAL = init

.PHONY: init
init:
	@git submodule update --init --recursive

.PHONY: pull
pull:
	@git submodule update --recursive --remote
