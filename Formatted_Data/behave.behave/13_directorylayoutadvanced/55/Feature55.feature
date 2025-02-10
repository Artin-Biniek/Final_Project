 Scenario: Run behave with two feature files (CASE 2: different ordering)
        Given a file named "two.featureset" with:
            """
            features/group2/charly.feature
            features/group1/alice.feature
            """
        When I run "behave -f progress @two.featureset"
        Then it should pass with:
            """
            2 features passed, 0 failed, 0 skipped
            3 scenarios passed, 0 failed, 0 skipped
            6 steps passed, 0 failed, 0 skipped, 0 undefined
            """