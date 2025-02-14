 Scenario: Failing Background Step causes all Scenarios to fail
    Given a file named "features/background_fail_example.feature" with:
        """
        Feature:

          Background: B1
            Given a background step passes
            And a background step fails
            And another background step passes

          Scenario: S1
            When a step passes

          Scenario: S2
            Then a step passes
            And another step passes
        """
    When I run "behave -f plain -T features/background_fail_example.feature"
    Then it should fail with:
        """
        0 scenarios passed, 2 failed, 0 skipped
        2 steps passed, 2 failed, 5 skipped, 0 undefined
        """
    And the command output should contain:
        """
        Feature:
          Background: B1

          Scenario: S1
            Given a background step passes ... passed
            And a background step fails ... failed
        Assertion Failed: XFAIL: background step

          Scenario: S2
            Given a background step passes ... passed
            And a background step fails ... failed
        Assertion Failed: XFAIL: background step
        """
    And note that "the failing Background step causes all Scenarios to fail"