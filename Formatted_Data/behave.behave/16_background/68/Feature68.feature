  Scenario: Failing Background Step does not prevent that other Scenarios are executed

    If a Background step fails sometimes
    it should be retried in the remaining Scenarios where it might pass.

    Given a file named "features/background_fails_sometimes_example.feature" with:
        """
        Feature:

          Background: B2
            Given a background step fails sometimes

          Scenario: S1
            Given a step passes

          Scenario: S2
            When another step passes

          Scenario: S3
            Then another step passes
        """
    And a file named "features/environment.py" with:
        """
        scenarios_count = 0

        def before_scenario(context, scenario):
            global scenarios_count
            context.scenarios_count = scenarios_count
            scenarios_count += 1
        """
    When I run "behave -f plain -T features/background_fails_sometimes_example.feature"
    Then it should fail with:
        """
        1 scenario passed, 2 failed, 0 skipped
        2 steps passed, 2 failed, 2 skipped, 0 undefined
        """
    And the command output should contain:
        """
        Feature:
            Background: B2

            Scenario: S1
              Given a background step fails sometimes ... failed
          Assertion Failed: XFAIL: background step

            Scenario: S2
              Given a background step fails sometimes ... passed
              When another step passes ... passed

            Scenario: S3
              Given a background step fails sometimes ... failed
          Assertion Failed: XFAIL: background step
        """