Scenario: Fixture with cleanup-error causes failed (case: scenario)
    Given a file named "features/environment.py" with:
      """
      from __future__ import print_function
      from behave.fixture import fixture, use_fixture

      @fixture
      def bad_with_cleanup_error(context):
          print("FIXTURE-SETUP: bad_with_cleanup_error")
          yield
          print("FIXTURE-CLEANUP: bad_with_cleanup_error")
          raise RuntimeError("BAD_FIXTURE_CLEANUP_ERROR")

      def before_tag(context, tag):
          if tag == "fixture.bad_with_cleanup_error":
              use_fixture(bad_with_cleanup_error, context)
      """
    And a file named "features/bad_fixture.feature" with:
      """
      Feature: Fixture with cleanup error
        @fixture.bad_with_cleanup_error
        Scenario: Use fixture
          Given a step passes

        Scenario:
          Then another step passes
      """
    When I run "behave -f plain features/bad_fixture.feature"
    Then it should fail with:
      """
      1 scenario passed, 1 failed, 0 skipped
      2 steps passed, 0 failed, 0 skipped, 0 undefined
      """
    And the command output should contain:
      """
      FIXTURE-SETUP: bad_with_cleanup_error
        Scenario: Use fixture
          Given a step passes ... passed
      FIXTURE-CLEANUP: bad_with_cleanup_error
      CLEANUP-ERROR in cleanup_fixture: RuntimeError: BAD_FIXTURE_CLEANUP_ERROR
      """
    And the command output should contain:
      """
      File "features/environment.py", line 9, in bad_with_cleanup_error
        raise RuntimeError("BAD_FIXTURE_CLEANUP_ERROR")
      RuntimeError: BAD_FIXTURE_CLEANUP_ERROR
      """
    But note that "traceback shows cleanup-fixture failure location"
    And note that "cleanup error causes scenario to fail (by default)"