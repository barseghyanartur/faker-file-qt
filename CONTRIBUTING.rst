Contributor guidelines
======================

.. _documentation: https://faker-file-qt.readthedocs.io/#writing-documentation
.. _testing: https://faker-file-qt.readthedocs.io/#testing
.. _pre-commit: https://pre-commit.com/#installation
.. _black: https://black.readthedocs.io/
.. _isort: https://pycqa.github.io/isort/
.. _doc8: https://doc8.readthedocs.io/
.. _ruff: https://beta.ruff.rs/docs/
.. _pip-tools: https://pip-tools.readthedocs.io/
.. _issues: https://github.com/barseghyanartur/faker-file-qt/issues
.. _discussions: https://github.com/barseghyanartur/faker-file-qt/discussions
.. _pull request: https://github.com/barseghyanartur/faker-file-qt/pulls
.. _support: https://faker-file-qt.readthedocs.io/#support
.. _installation: https://faker-file-qt.readthedocs.io/#installation
.. _prerequisites: https://faker-file-qt.readthedocs.io/#prerequisites

Developer prerequisites
-----------------------
pre-commit
~~~~~~~~~~
Refer to `pre-commit`_ for installation instructions.

TL;DR:

.. code-block:: sh

    pip install pipx --user  # Install pipx
    pipx install pre-commit  # Install pre-commit
    pre-commit install  # Install pre-commit hooks

Installing `pre-commit`_ will ensure you adhere to the project code quality
standards.

Code standards
--------------
`black`_, `isort`_, `ruff`_ and `doc8`_ will be automatically triggered by
`pre-commit`_. Still, if you want to run checks manually:

.. code-block:: sh

    make black
    make doc8
    make isort
    make ruff

Requirements
------------
Requirements are installed as follows.

.. code-block:: sh

    make install

Virtual environment
-------------------
You are advised to work in virtual environment.

TL;DR:

.. code-block:: sh

    python -m venv env
    pip install -e .
    pip install -r examples/requirements/django_3_2_and_flask.txt

Documentation
-------------
Check `documentation`_.

Testing
-------
Check `testing`_.

If you introduce changes or fixes, make sure to test them locally using
all supported environments. For that use tox.

.. code-block:: sh

    make test

In any case, GitHub Actions will catch potential errors, but using tox speeds
things up.

Pull requests
-------------
You can contribute to the project by making a `pull request`_.

For example:

- To fix documentation typos.
- To improve documentation (for instance, to add new recipe or fix
  an existing recipe that doesn't seem to work).
- To introduce a new feature (for instance, add support for a non-supported
  file type).

**Good to know:**

- Test suite makes extensive use of parametrization. Make sure you have added
  your changes in the right place.

**General list to go through:**

- Does your change require documentation update?
- Does your change require update to tests?
- Did you test both Latin and Unicode characters?
- Does your change rely on third-party cloud based service? If so, please
  make sure it's added to tests that should be retried a couple of times.
  Example: ``@pytest.mark.flaky(reruns=5)``.

**When fixing bugs (in addition to the general list):**

- Make sure to add regression tests.

**When adding a new feature (in addition to the general list):**

- Check the licenses of added dependencies carefully and make sure to list them
  in `prerequisites`_.
- Make sure to update the documentation.

Questions
---------
Questions can be asked on GitHub `discussions`_.

Issues
------
For reporting a bug or filing a feature request use GitHub `issues`_.

**Do not report security issues on GitHub**. Check the `support`_ section.
