 Scenario: Captured output is shown up to first failure if scenario fails (CASE 1: --capture)
        When I run "behave -f plain -T --capture features/capture_stderr.example2.feature"
        Then it should fail with:
            """
            0 scenarios passed, 1 failed, 0 skipped
            1 step passed, 1 failed, 1 skipped, 0 undefined
            """
        And the command output should contain:
            """
            Feature:
                Scenario:
                    Given a step writes "Alice" to stderr and passes ... passed
                    When a step writes "Bob" to stderr and fails ... failed
            Assertion Failed: XFAIL, step with: Bob;
            Captured stderr:
            stderr:Alice;
            stderr:Bob;
            """
        But the command output should not contain:
            """
            stderr:Charly;
            """