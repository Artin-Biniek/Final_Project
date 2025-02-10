 Scenario: Run behave with one feature file
        When I run "behave -f progress features/group1/alice.feature"
        Then it should pass with:
            """
            1 feature passed, 0 failed, 0 skipped
            2 scenarios passed, 0 failed, 0 skipped
            4 steps passed, 0 failed, 0 skipped, 0 undefined
            """
        When I run "behave -f progress features/group2/charly.feature"
        Then it should pass with:
            """
            1 feature passed, 0 failed, 0 skipped
            1 scenario passed, 0 failed, 0 skipped
            2 steps passed, 0 failed, 0 skipped, 0 undefined
            """