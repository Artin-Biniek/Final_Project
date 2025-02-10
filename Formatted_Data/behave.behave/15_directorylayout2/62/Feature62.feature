Scenario: Run behave with feature subdirectory
        When I run "behave -f progress testing/features/"
        Then it should pass with:
            """
            2 features passed, 0 failed, 0 skipped
            2 scenarios passed, 0 failed, 0 skipped
            5 steps passed, 0 failed, 0 skipped, 0 undefined
            """