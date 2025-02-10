Scenario: Test Setup
        Given a new working directory
        And a file named "features/steps/stdout_steps.py" with:
            """
            from behave import step
            import sys

            @step('a step writes "{text}" to stdout and passes')
            def step_writes_to_stdout_and_passes(context, text):
                sys.stdout.write("stdout:%s;\n" % text)

            @step('a step writes "{text}" to stdout and fails')
            def step_writes_to_stdout_and_fails(context, text):
                sys.stdout.write("stdout:%s;\n" % text)
                assert False, "XFAIL, step with: %s;" % text
            """
        And a file named "features/capture_stdout.example1.feature" with:
            """
            Feature:
                Scenario:
                    Given a step writes "Alice" to stdout and passes
                    When a step writes "Bob" to stdout and passes
                    Then a step writes "Charly" to stdout and passes
            """
        And a file named "features/capture_stdout.example2.feature" with:
            """
            Feature:
                Scenario:
                    Given a step writes "Alice" to stdout and passes
                    When a step writes "Bob" to stdout and fails
                    Then a step writes "Charly" to stdout and fails
            """

