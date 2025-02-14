Scenario: Feature Setup
    Given a new working directory
    And a file named "features/steps/background_steps.py" with:
        """
        from behave import step

        @step('{word} background step passes')
        def step_background_step_passes(context, word):
            pass

        @step('{word} background step fails')
        def step_background_step_fails(context, word):
            assert False, "XFAIL: background step"

        @step('{word} background step fails sometimes')
        def step_background_step_fails_sometimes(context, word):
            should_fail = (context.scenarios_count % 2) == 0
            if should_fail:
                step_background_step_fails(context, word)
        """
    And a file named "features/steps/passing_steps.py" with:
        """
        from behave import step

        @step('{word} step passes')
        def step_passes(context, word):
            pass

        @step('{word} step fails')
        def step_fails(context, word):
            assert False, "XFAIL"
        """
