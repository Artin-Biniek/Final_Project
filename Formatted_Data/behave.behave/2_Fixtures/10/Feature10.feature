 Scenario: Use multiple fixtures (with setup/cleanup)
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
      def bar(context):
          def cleanup_bar():
              print("FIXTURE-CLEANUP: bar")

          print("FIXTURE-SETUP: bar")
          context.add_cleanup(cleanup_bar)

      def before_tag(context, tag):
          if tag == "fixture.foo":
              use_fixture(foo, context)
          elif tag == "fixture.bar":
              use_fixture(bar, context)
      """
    And a file named "features/two.feature" with:
      """
      Feature: Use multiple Fixtures
        @fixture.foo
        @fixture.bar
        Scenario: Two Fixtures
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
      FIXTURE-SETUP: foo
      FIXTURE-SETUP: bar
        Scenario: Two Fixtures
          Given a step passes ... passed
      FIXTURE-CLEANUP: bar
      FIXTURE-CLEANUP: foo
      """
    But note that "the fixture-cleanup occurs in reverse order (LIFO)"