.PHONY: lint check
lint:
	python -m black mypackage
check:
	python -m black mypackage --check
	python -m mypy mypackage

.PHONY: test
test:
	python -m pytest mypackage

.PHONY: commit
commit: check test

.PHONY: setup
setup:
	git config --local core.hooksPath ./hooks/
	chmod +x ./hooks/pre-commit
	poetry install