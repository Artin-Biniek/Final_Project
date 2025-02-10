Scenario: Command-line args can override default paths in configfile
        When I run "behave -f plain features/alice.feature"
        Then it should pass with:
            """
            1 feature passed, 0 failed, 0 skipped
            1 scenario passed, 0 failed, 0 skipped
            3 steps passed, 0 failed, 0 skipped, 0 undefined
             """
        And the command output should contain:
            """
            Feature: Alice
                Scenario: A1
            """
        But the command output should not contain:
            """
            Feature: Bob
            """
        And the command output should not contain:
            """
            Feature: Charly
            """