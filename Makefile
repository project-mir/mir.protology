PYTHON := pipenv run python

.PHONY: all
all:

.PHONY: check
check:
	$(PYTHON) -m pytest

.PHONY: sdist
sdist:
	$(PYTHON) setup.py sdist

.PHONY: wheel
wheel:
	$(PYTHON) setup.py bdist_wheel

.PHONY: TAGS
TAGS:
	ctags -e -R mir

.PHONY: distclean
distclean:
	rm -rf build dist *.egg-info
	rm -f .coverage

.PHONY: upload
upload: sdist wheel
	$(PYTHON) -m twine upload --skip-existing dist/*

.PHONY: pipenv
pipenv:
	pipenv install --dev
