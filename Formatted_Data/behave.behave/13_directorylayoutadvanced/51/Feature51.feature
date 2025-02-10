Scenario: Run behave with feature subdirectory (CASE 1)
        When I run "behave -f progress features/group1/"
        Then it should pass with:
            """
            2 features passed, 0 failed, 0 skipped
            3 scenarios passed, 0 failed, 0 skipped
            6 steps passed, 0 failed, 0 skipped, 0 undefined
            """