.PHONY: clean install test release black isort fluff build_docs rebuild_docs

# Clean up Python bytecodes, optimized files, caches
clean:
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -delete
	rm -f .coverage
	rm -rf .pytest_cache
	rm -rf build dist *.egg-info
	rm -rf docs/_build
	rm -rf htmlcov
	rm -rf .tox/

# Clean virtualenv
clean-venv:
	pip freeze | while read p; do pip uninstall -y "$p"; done

# Install the package locally for development
install:
	pip install -e .[dev]

# Install the package locally for development
uninstall:
	pip uninstall faker-file-qt -y

# Run app
make run:
	python faker_file_qt.py

# Run tests
test:
	pytest

# Make a release
release:
	python setup.py sdist bdist_wheel
	twine upload dist/*

# Run Black for code formatting
black:
	black .

# Run iSort for import sorting
isort:
	isort .

# Run ruff
ruff:
	ruff check .

doc8:
	doc8 .

# Run fluff for SQL linting, assuming you're using SQLFluff
fluff:
	sqlfluff lint .

# Build documentation
build_docs:
	cd docs && make html

# Rebuild documentation
rebuild_docs: clean
	cd docs && make html

detect-secrets-create-baseline:
	detect-secrets scan > .secrets.baseline

detect-secrets-update-baseline:
	detect-secrets scan --baseline .secrets.baseline
