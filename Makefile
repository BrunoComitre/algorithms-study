SHELL := /bin/bash

.PHONY: help install lint format install_hooks test sec pep8 clean

help:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

# all: clean install test 

install:
    @poetry install

lint:
    @echo
    isort --diff -c .
    @echo
    blue --check --diff --color .
    @echo
    flake8 .
    @echo
    mypy .
    @echo
    bandit -r catdog/
    @echo
    # pip-audit
    
    # @blue --check .
    # @isort --check .
    # @prospector


format:
    @isort .
    @blue .
    pyupgrade --py310-plus **/*.py

install_hooks:
	@scripts/install_hooks.sh

test:
    pytest --cov-report term-missing --cov-report html --cov-branch \
           --cov catdog/
    # @pytest -v

sec:
    @pip-audit

pep8:
	# Flake8 ignores 
	#   F841 (local variable assigned but never used, useful for debugging on exception)
	#   W504 (line break after binary operator, I prefer to put `and|or` at the end)
	#   F403 (star import `from foo import *` often used in __init__ files)
	@flake8 talkshow --ignore=F403,W504,F841
	@flake8 tests --ignore=F403,W504,F841

clean:
	@find . -name '*.pyc' -exec rm -rf {} \;
	@find . -name '__pycache__' -exec rm -rf {} \;
	@find . -name 'Thumbs.db' -exec rm -rf {} \;
	@find . -name '*~' -exec rm -rf {} \;
	rm -rf .cache
	rm -rf build
	rm -rf dist
	rm -rf *.egg-info
	rm -rf htmlcov
	rm -rf .tox/
	rm -rf docs/_build
