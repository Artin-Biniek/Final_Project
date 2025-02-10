Scenario: Run behave with one feature file
        When I run "behave -f progress testing/features/alice.feature"
        Then it should pass with:
            """
            1 feature passed, 0 failed, 0 skipped
            1 scenario passed, 0 failed, 0 skipped
            3 steps passed, 0 failed, 0 skipped, 0 undefined
            """