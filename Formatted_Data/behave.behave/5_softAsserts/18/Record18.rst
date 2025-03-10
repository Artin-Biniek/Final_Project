{
Scenario:EXAMPLE: Use Soft Assertions in behave
=============================================================================

:RELATED TO: `discussion #1094`_

This directory provides a simple example how soft-assertions can be used
in ``behave`` by using the ``assertpy`` package.


HINT:

* Python2.7: "@soft_assertions()" decorator does not seem to work.
  Use ContextManager solution instead, like: ``with soft_assertions(): ...``



Given:Bootstrap
-----------------------------------------------------------------------------

ASSUMPTIONS:

* Python3 is installed (or: Python2.7)
* virtualenv is installed (otherwise use: pip install virtualenv)

Create a virtual-environment with "virtualenv" and activate it::


    $ python3 -mvirtualenv .venv

    # -- STEP 2: Activate the virtualenv
    # CASE 1: BASH-LIKE SHELL (on UNIX-like platform: Linux, macOS, WSL, ...)
    $ source .venv/bin/activate

    # CASE 2: CMD SHELL (on Windows)
    cmd> .venv/Scripts/activate

Install the required Python packages in the virtualenv::

    $ pip install -r py.requirements.txt


Then:Run the Example
-----------------------------------------------------------------------------

::

    # -- USE: -f plain --no-capture  (via "behave.ini" defaults)
    $ ../../bin/behave -f pretty features
    Feature: Use Soft Assertions in behave # features/soft_asserts.feature:1
      RELATED TO: https://github.com/behave/behave/discussions/1094
      Scenario: Failing with Soft Assertions -- CASE 1             # features/soft_asserts.feature:5
        Given a minimum number value of "5"                        # features/steps/number_steps.py:16
        Then the numbers "2" and "12" are in the valid range       # features/steps/number_steps.py:27
          Assertion Failed: soft assertion failures:
          1. Expected <2> to be greater than or equal to <5>, but was not.

        But note that "the step-2 (then step) is expected to fail" # None

      @behave.continue_after_failed_step
      Scenario: Failing with Soft Assertions -- CASE 2             # features/soft_asserts.feature:17
        Given a minimum number value of "5"                        # features/steps/number_steps.py:16
        Then the number "4" is in the valid range                  # features/steps/number_steps.py:21
          Assertion Failed: Expected <4> to be greater than or equal to <5>, but was not.

        And the number "8" is in the valid range                   # features/steps/number_steps.py:21
        But note that "the step-2 and step-3 are expected to fail" # ../../behave4cmd0/note_steps.py:15
        But note that "the step-4 should pass"                     # ../../behave4cmd0/note_steps.py:15

      @behave.continue_after_failed_step
      Scenario: Failing with Soft Assertions -- CASE 1 and CASE 2  # features/soft_asserts.feature:28
        Given a minimum number value of "5"                        # features/steps/number_steps.py:16
        Then the number "2" is in the valid range                  # features/steps/number_steps.py:21
          Assertion Failed: Expected <2> to be greater than or equal to <5>, but was not.

        And the numbers "3" and "4" are in the valid range         # features/steps/number_steps.py:27
          Assertion Failed: soft assertion failures:
          1. Expected <3> to be greater than or equal to <5>, but was not.
          2. Expected <4> to be greater than or equal to <5>, but was not.

        And the number "8" is in the valid range                   # features/steps/number_steps.py:21
        But note that "the step-2 and step-3 are expected to fail" # ../../behave4cmd0/note_steps.py:15
        But note that "the step-4 should pass"                     # ../../behave4cmd0/note_steps.py:15

      Scenario: Passing                                                  # features/soft_asserts.feature:37
        Given a step passes                                              # ../../behave4cmd0/passing_steps.py:23
        And note that "this scenario should be executed and should pass" # ../../behave4cmd0/note_steps.py:15


    Failing scenarios:
      features/soft_asserts.feature:5  Failing with Soft Assertions -- CASE 1
      features/soft_asserts.feature:17  Failing with Soft Assertions -- CASE 2
      features/soft_asserts.feature:28  Failing with Soft Assertions -- CASE 1 and CASE 2

    0 features passed, 1 failed, 0 skipped
    1 scenario passed, 3 failed, 0 skipped
    11 steps passed, 4 failed, 1 skipped, 0 undefined

.. _`discussion #1094`: https://github.com/behave/behave/discussions/1094
}

