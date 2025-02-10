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
        And a file named "features/steps/environment_steps.py" with:
            """
            from behave import step

            @step('environment setup was done')
            def step_ensure_environment_setup(context):
                assert context.setup_magic == 42
            """
        And a file named "features/environment.py" with:
            """
            def before_all(context):
                context.setup_magic = 42
            """
        And a file named "features/group1/alice.feature" with:
            """
            Feature: Alice
                Scenario: A1
                  Given a step passes
                  When another step passes
                  Then a step passes

                Scenario: A2
                  Then environment setup was done
            """
        And a file named "features/group1/bob.feature" with:
            """
            Feature: Bob
                Scenario: B1
                  When a step passes
                  Then another step passes
            """
        And a file named "features/group2/charly.feature" with:
            """
            Feature: Charly
                Scenario: C1
                  Given another step passes
                  Then a step passes
            """



