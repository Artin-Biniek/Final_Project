 Scenario: Run behave with two feature files (CASE 1)
        Given a file named "one.featureset" with:
            """
            features/group1/alice.feature
            features/group2/charly.feature
            """
        When I run "behave -f progress @one.featureset"
        Then it should pass with:
            """
            2 features passed, 0 failed, 0 skipped
            3 scenarios passed, 0 failed, 0 skipped
            6 steps passed, 0 failed, 0 skipped, 0 undefined
            """