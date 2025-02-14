 Scenario: Feature with a Background and Scenarios
    Given a file named "features/background_example1.feature" with:
        """
        Feature:
          Background:
            Given a background step passes
            And another background step passes

          Scenario: S1
            When a step passes

          Scenario: S2
            Then a step passes
            And another step passes
        """
    When I run "behave -f plain -T features/background_example1.feature"
    Then it should pass with:
        """
        2 scenarios passed, 0 failed, 0 skipped
        7 steps passed, 0 failed, 0 skipped, 0 undefined
        """
    And the command output should contain:
        """
        Feature:
          Background:

          Scenario: S1
            Given a background step passes ... passed
            And another background step passes ... passed
            When a step passes ... passed

          Scenario: S2
            Given a background step passes ... passed
            And another background step passes ... passed
            Then a step passes ... passed
            And another step passes ... passed
        """
    But note that "the Background steps are injected into each Scenario"
    And note that "the Background steps are executed before any Scenario steps"