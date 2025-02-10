Scenario: Captured output is suppressed if scenario passes (CASE 1: --capture)
        When I run "behave -f plain -T --capture features/capture_stderr.example1.feature"
        Then it should pass
        And the command output should contain:
            """
            Feature:
                Scenario:
                    Given a step writes "Alice" to stderr and passes ... passed
                    When a step writes "Bob" to stderr and passes ... passed
                    Then a step writes "Charly" to stderr and passes ... passed
            """
        But the command output should not contain:
            """
            stderr:Alice;
            """