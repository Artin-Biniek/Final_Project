Scenario: Setup directory structure
        Given a new working directory
        And a file named "features/steps/steps.py" with:
            """
            from behave import step

            @step('{word:w} step passes')
            def step_passes(context, word):
                pass

            @step('{word:w} step fails')
            def step_fails(context, word):
                assert False, "XFAIL-STEP"
            """
        And a file named "features/alice.feature" with:
            """
            Feature: Alice
                Scenario: A1
                  Given a step passes
                  When another step passes
                  Then a step passes
            """
        And a file named "features/bob.feature" with:
            """
            Feature: Bob
                Scenario: B1
                  When a step passes
                  Then another step passes
            """


