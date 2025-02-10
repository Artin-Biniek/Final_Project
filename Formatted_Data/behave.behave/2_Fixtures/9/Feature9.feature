 Scenario: Use fixture (case: step)
    Given a file named "features/environment.py" with:
      """
      from __future__ import print_function

      def after_scenario(context, scenario):
          print("HOOK-CALLED: after_scenario: %s" % scenario.name)
      """
    And an empty file named "behave4me/__init__.py"
    And a file named "behave4me/fixtures.py" with:
      """
      from __future__ import print_function
      from behave import fixture

      @fixture
      def foo(context, name):
          print("FIXTURE-SETUP: foo%s" % name)
          yield 42
          print("FIXTURE-CLEANUP: foo%s" % name)
      """
    And a file named "features/steps/fixture_steps2.py" with:
      """
      from __future__ import print_function
      from behave import step, use_fixture
      from behave4me.fixtures import foo

      @step(u'I use fixture "{fixture_name}"')
      def step_use_fixture(context, fixture_name):
          if fixture_name.startswith("foo"):
              name = fixture_name.replace("foo", "")
              the_fixture = use_fixture(foo, context, name)
              setattr(context, fixture_name, the_fixture)
          else:
              raise LookupError("Unknown fixture: %s" % fixture_name)
      """
    And a file named "features/use3.feature" with:
      """
      @fixture.foo
      Feature:

        Scenario: Use Fixture
          Given I use fixture "foo_1"
          Then a step passes

        Scenario:
          Then another step passes
      """
    When I run "behave -f plain features/use3.feature"
    Then it should pass with:
      """
      2 scenarios passed, 0 failed, 0 skipped
      3 steps passed, 0 failed, 0 skipped, 0 undefined
      """
    And the command output should contain:
      """
      Feature:
        Scenario: Use Fixture
          Given I use fixture "foo_1" ... passed
          Then a step passes ... passed
        HOOK-CALLED: after_scenario: Use Fixture
        FIXTURE-CLEANUP: foo_1
      """
    But note that "the fixture-cleanup occurs after the scenario"