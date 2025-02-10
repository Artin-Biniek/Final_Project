 Scenario: Multiple fixture cleanup-errors cause no abort after first error (case: scenario)
    Given a file named "features/environment.py" with:
      """
      from __future__ import print_function
      from behave.fixture import fixture, use_fixture

      @fixture
      def foo(context):
          print("FIXTURE-SETUP: foo")
          yield
          print("FIXTURE-CLEANUP: foo")

      @fixture
      def bad_with_cleanup_error(context, name):
          print("FIXTURE-SETUP: bad_with_cleanup_error%s" % name)
          yield
          print("FIXTURE-CLEANUP: bad_with_cleanup_error%s" % name)
          raise RuntimeError("BAD_FIXTURE_CLEANUP_ERROR%s" % name)

      def before_tag(context, tag):
          if tag.startswith("fixture.bad_with_cleanup_error"):
              name = tag.replace("fixture.bad_with_cleanup_error", "")
              use_fixture(bad_with_cleanup_error, context, name)
          elif tag.startswith("fixture.foo"):
              use_fixture(foo, context)
      """
    And a file named "features/bad_fixture2.feature" with:
      """
      Feature: Fixture with cleanup error
        @fixture.bad_with_cleanup_error_1
        @fixture.foo
        @fixture.bad_with_cleanup_error_2
        Scenario: Use fixture
          Given a step passes

        Scenario:
          Then another step passes
      """
    When I run "behave -f plain features/bad_fixture2.feature"
    Then it should fail with:
      """
      1 scenario passed, 1 failed, 0 skipped
      2 steps passed, 0 failed, 0 skipped, 0 undefined
      """
    And the command output should contain:
      """
      FIXTURE-SETUP: bad_with_cleanup_error_1
      FIXTURE-SETUP: foo
      FIXTURE-SETUP: bad_with_cleanup_error_2
        Scenario: Use fixture
          Given a step passes ... passed
      FIXTURE-CLEANUP: bad_with_cleanup_error_2
      CLEANUP-ERROR in cleanup_fixture: RuntimeError: BAD_FIXTURE_CLEANUP_ERROR_2
      """
    And the command output should contain:
      """
      FIXTURE-CLEANUP: foo
      FIXTURE-CLEANUP: bad_with_cleanup_error_1
      CLEANUP-ERROR in cleanup_fixture: RuntimeError: BAD_FIXTURE_CLEANUP_ERROR_1
      """
    But note that "all fixture-cleanups are executed (even when errors occur)"
    And note that "fixture-cleanups are executed in reverse order (LIFO)"