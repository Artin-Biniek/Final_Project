  Scenario: Run behave with two feature files
        When I run "behave -f progress features/alice.feature features/bob.feature"
        Then it should pass with:
            """
            2 features passed, 0 failed, 0 skipped
            2 scenarios passed, 0 failed, 0 skipped
            5 steps passed, 0 failed, 0 skipped, 0 undefined
            """