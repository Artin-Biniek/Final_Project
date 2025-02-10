 Scenario: All output is shown when --no-capture-stderr is used and all steps pass (CASE 1)
        When I run "behave -f plain -T --no-capture-stderr features/capture_stderr.example1.feature"
        Then it should pass
        And the command output should contain:
            """
            stderr:Alice;
            stderr:Bob;
            stderr:Charly;
            """
        And the command output should contain:
            """
            Feature:
                Scenario:
                    Given a step writes "Alice" to stderr and passes ... passed
                    When a step writes "Bob" to stderr and passes ... passed
                    Then a step writes "Charly" to stderr and passes ... passed
            """