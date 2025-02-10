 Scenario: Use invalid fixture (with two yields or more)
    Given a file named "features/environment.py" with:
      """
      from __future__ import print_function
      from behave.fixture import fixture, use_fixture

      @fixture
      def invalid_fixture(context):
          # -- CASE: Setup-only
          print("FIXTURE-SETUP: invalid")
          yield
          print("FIXTURE-CLEANUP: invalid")
          yield
          print("OOPS: Too many yields used")

      def before_tag(context, tag):
          if tag == "fixture.invalid":
              use_fixture(invalid_fixture, context)
      """
    And a file named "features/invalid_fixture.feature" with:
      """
      Feature: Fixture with more than one yield
        @fixture.invalid
        Scenario: Use invalid fixture
          Given a step passes

        Scenario:
          Then another step passes
      """
    When I run "behave -f plain features/invalid_fixture.feature"
    Then it should fail with:
      """
      1 scenario passed, 1 failed, 0 skipped
      2 steps passed, 0 failed, 0 skipped, 0 undefined
      """
    And the command output should contain:
      """
      FIXTURE-SETUP: invalid
        Scenario: Use invalid fixture
          Given a step passes ... passed
      FIXTURE-CLEANUP: invalid
      CLEANUP-ERROR in cleanup_fixture: InvalidFixtureError: Has more than one yield: <function invalid_fixture at
      """
    But note that "cleanup errors cause scenario to fail (by default)"