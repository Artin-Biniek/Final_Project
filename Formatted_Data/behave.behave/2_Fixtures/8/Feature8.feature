 Scenario: Use fixture (case: feature)
    Given a file named "features/environment.py" with:
      """
      from __future__ import print_function
      from behave.fixture import fixture, use_fixture

      @fixture
      def foo(context):
          print("FIXTURE-SETUP: foo")
          yield
          print("FIXTURE-CLEANUP: foo")

      def before_tag(context, tag):
          if tag == "fixture.foo":
              use_fixture(foo, context)

      def after_feature(context, feature):
          print("HOOK-CALLED: after_feature: %s" % feature.name)
      """
    And a file named "features/use2.feature" with:
      """
      @fixture.foo
      Feature: Use Fixture for Feature

        Scenario:
          Given a step passes

        Scenario:
          Then another step passes
      """
    When I run "behave -f plain features/use2.feature"
    Then it should pass with:
      """
      1 feature passed, 0 failed, 0 skipped
      2 scenarios passed, 0 failed, 0 skipped
      2 steps passed, 0 failed, 0 skipped, 0 undefined
      """
    And the command output should contain:
      """
      FIXTURE-SETUP: foo
      Feature: Use Fixture for Feature
        Scenario:
          Given a step passes ... passed

        Scenario:
          Then another step passes ... passed

      HOOK-CALLED: after_feature: Use Fixture for Feature
      FIXTURE-CLEANUP: foo
      """
    But note that "the fixture-cleanup after the feature"