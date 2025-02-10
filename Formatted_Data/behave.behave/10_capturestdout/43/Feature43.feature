Scenario: All output is shown up to first failing step when --no-capture is used (CASE 2)
        When I run "behave -f plain -T --no-capture features/capture_stdout.example2.feature"
        Then it should fail with:
            """
            0 scenarios passed, 1 failed, 0 skipped
            1 step passed, 1 failed, 1 skipped, 0 undefined
            """
        And the command output should contain:
            """
            Feature:
                Scenario:
                    stdout:Alice;
                    Given a step writes "Alice" to stdout and passes ... passed
                    stdout:Bob;
                    When a step writes "Bob" to stdout and fails ... failed
            """
        But the command output should not contain:
            """
            stdout:Charly;
            """