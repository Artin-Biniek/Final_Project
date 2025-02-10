Scenario: Run behave with feature directory
        When I run "behave -f progress features/"
        Then it should pass with:
            """
            3 features passed, 0 failed, 0 skipped
            4 scenarios passed, 0 failed, 0 skipped
            8 steps passed, 0 failed, 0 skipped, 0 undefined
            """