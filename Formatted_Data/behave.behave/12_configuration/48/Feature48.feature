Scenario: Command-line args are provided (CASE 2)
        When I run "behave -f plain features"
        Then it should pass with:
            """
            2 features passed, 0 failed, 0 skipped
            2 scenarios passed, 0 failed, 0 skipped
             """
        And the command output should contain:
            """
            Feature: Alice
                Scenario: A1
                    Given a step passes ... passed
                    When a step passes ... passed
                    Then a step passes ... passed

            Feature: Bob
                Scenario: B1
                    When a step passes ... passed
            """
        But the command output should not contain:
            """
            Feature: Charly
            """