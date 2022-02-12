> # 🗂 Makefiles
>
> Set of useful Makefiles.

[![Mirror][mirror.icon]][mirror.page]

## 💡 Idea

Build and provide template-specific Makefile for different stacks.

## 🏆 Motivation

We want to build a context-specific Makefile from well-written
and task-specific parts to reuse code and avoid duplication.

## 🤼‍♂️ How to

1. [Install `maintainer` tool][maintainer].
2. Create your own Makefile based on pieces from the `src`.
3. Run the [`make`][make] command.
4. See the `dist` directory.
5. Take profit.

## 🤲 Outputs & outcomes

- [🧩 Template for typical module written on Go](https://github.com/octomation/go-module).
- [🧩 Template for typical CLI tool written on Go](https://github.com/octomation/go-tool).
- [🧩 Template for typical service written on Go](https://github.com/octomation/go-service).

<p align="right">made with ❤️ for everyone</p>

[mirror.page]:      https://bitbucket.org/kamilsk/makefiles
[mirror.icon]:      https://img.shields.io/badge/mirror-bitbucket-blue

[maintainer]:       https://github.com/octomation/maintainer#-installation
[make]:             https://www.gnu.org/software/make/
