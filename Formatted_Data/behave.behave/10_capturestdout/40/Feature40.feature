 Scenario: Captured output is suppressed if scenario passes
        When I run "behave -f plain -T --capture features/capture_stdout.example1.feature"
        Then it should pass
        And the command output should contain:
            """
            Feature:
                Scenario:
                    Given a step writes "Alice" to stdout and passes ... passed
                    When a step writes "Bob" to stdout and passes ... passed
                    Then a step writes "Charly" to stdout and passes ... passed
            """
        But the command output should not contain:
            """
            stdout:Alice;
            """