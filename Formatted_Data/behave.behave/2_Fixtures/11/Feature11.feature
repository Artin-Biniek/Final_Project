Scenario: Use same fixture twice with different args
    Given a file named "features/environment.py" with:
      """
      from __future__ import print_function
      from behave.fixture import fixture, use_fixture

      @fixture
      def foo(context, name):
          name2 = "foo%s" % name
          print("FIXTURE-SETUP: %s" % name2)
          setattr(context, name2, 1)
          yield
          print("FIXTURE-CLEANUP: %s" % name2)

      def before_tag(context, tag):
          if tag.startswith("fixture.foo"):
              # -- FIXTURE-TAG SCHEMA: fixture.foo*
              name = tag.replace("fixture.foo", "")
              use_fixture(foo, context, name)
      """
    And a file named "features/two.feature" with:
      """
      Feature: Use same Fixture twice
        @fixture.foo_1
        @fixture.foo_2
        Scenario: Use Fixtures
          Given a step passes

        Scenario:
          Then another step passes
      """
    When I run "behave -f plain features/two.feature"
    Then it should pass with:
      """
      2 scenarios passed, 0 failed, 0 skipped
      2 steps passed, 0 failed, 0 skipped, 0 undefined
      """
    And the command output should contain:
      """
      FIXTURE-SETUP: foo_1
      FIXTURE-SETUP: foo_2
        Scenario: Use Fixtures
          Given a step passes ... passed
      FIXTURE-CLEANUP: foo_2
      FIXTURE-CLEANUP: foo_1
      """
    But note that "the fixture-cleanup occurs in reverse order (LIFO)"