Scenario: Test Setup
        Given a new working directory
        And a file named "features/steps/steps.py" with:
            """
            from behave import step

            @step('a step passes')
            def step_passes(context):
                pass
            """
        And a file named "features/alice.feature" with:
            """
            Feature: Alice
                Scenario: A1
                    Given a step passes
                    When a step passes
                    Then a step passes
            """
        And a file named "features/bob.feature" with:
            """
            Feature: Bob
                Scenario: B1
                    When a step passes
            """
        And a file named "more.features/charly.feature" with:
            """
            Feature: Charly
                Scenario: C1
                    Then a step passes
            """
        And a file named "behave.ini" with:
            """
            [behave]
            show_timings = false
            paths = features/bob.feature
                    more.features/charly.feature
            """



