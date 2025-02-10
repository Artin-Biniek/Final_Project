Scenario: Run behave with feature subdirectory (CASE 2)
        When I run "behave -f progress features/group2/"
        Then it should pass with:
            """
            1 feature passed, 0 failed, 0 skipped
            1 scenario passed, 0 failed, 0 skipped
            2 steps passed, 0 failed, 0 skipped, 0 undefined
            """