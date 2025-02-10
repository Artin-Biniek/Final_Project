 Scenario: Captured output is shown up to first failure if scenario fails
        When I run "behave -f plain -T --capture features/capture_stdout.example2.feature"
        Then it should fail with:
            """
            0 scenarios passed, 1 failed, 0 skipped
            1 step passed, 1 failed, 1 skipped, 0 undefined
            """
        And the command output should contain:
            """
            Feature:
                Scenario:
                    Given a step writes "Alice" to stdout and passes ... passed
                    When a step writes "Bob" to stdout and fails ... failed
            Assertion Failed: XFAIL, step with: Bob;
            Captured stdout:
            stdout:Alice;
            stdout:Bob;
            """
        But the command output should not contain:
            """
            stdout:Charly;
            """