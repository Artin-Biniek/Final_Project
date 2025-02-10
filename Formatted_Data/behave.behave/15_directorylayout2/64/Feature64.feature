Scenario: Run behave with two feature files
        Given a file named "one.featureset" with:
            """
            testing/features/alice.feature
            testing/features/bob.feature
            """
        When I run "behave -f progress @one.featureset"
        Then it should pass with:
            """
            2 features passed, 0 failed, 0 skipped
            2 scenarios passed, 0 failed, 0 skipped
            5 steps passed, 0 failed, 0 skipped, 0 undefined
            """