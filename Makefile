PYTHON=python
PYTHON_VERSION="3.12"  # Make sure it's a string
ENV_NAME=cq
SHELL=/usr/bin/bash

.PHONY: help run setup clean activate

help:
	@echo "Usage:"
	@echo "  make setup                         - Sets up the environment"
	@echo "  make clean                         - Removes generated files (e.g., .stl, .step)"
	@echo
	@echo "Note: Make sure to activate the environment first using: conda activate cq"

setup:
	$(PYTHON) -c "import sys; major, minor = map(int, '$(PYTHON_VERSION)'.split('.')); assert sys.version_info >= (major, minor), f'Python {$(PYTHON_VERSION)}+ is required.'"
	mamba env list | grep -q "^$(ENV_NAME)\s" || mamba create -n $(ENV_NAME) python cadquery -c conda-forge --override-channels -y

clean:
	@rm -f *.stl *.step
