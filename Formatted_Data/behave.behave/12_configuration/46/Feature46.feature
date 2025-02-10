 Scenario: Used default paths from behave configfile
        When I run "behave -f plain"
        Then it should pass with:
            """
            2 features passed, 0 failed, 0 skipped
            2 scenarios passed, 0 failed, 0 skipped
            """
        And the command output should contain:
            """
            Feature: Bob
                Scenario: B1
                    When a step passes ... passed

            Feature: Charly
                Scenario: C1
                    Then a step passes ... passed
            """
        But the command output should not contain:
            """
            Feature: Alice
            """