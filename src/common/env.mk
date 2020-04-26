SHELL := /bin/bash -euo pipefail # `explain set -euo pipefail`

OS   = $(shell uname -s)
ARCH = $(shell uname -m)
