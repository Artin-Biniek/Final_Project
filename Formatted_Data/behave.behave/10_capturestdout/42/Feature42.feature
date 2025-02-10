 Scenario: All output is shown when --no-capture is used and all steps pass (CASE 1)
        When I run "behave -f plain -T --no-capture features/capture_stdout.example1.feature"
        Then it should pass
        And the command output should contain:
            """
            Feature:
                Scenario:
                    stdout:Alice;
                    Given a step writes "Alice" to stdout and passes ... passed
                    stdout:Bob;
                    When a step writes "Bob" to stdout and passes ... passed
                    stdout:Charly;
                    Then a step writes "Charly" to stdout and passes ... passed
            """