Scenario: Test Setup
        Given a new working directory
        And   a file named "features/steps/stderr_steps.py" with:
            """
            from behave import step
            import sys

            @step('a step writes "{text}" to stderr and passes')
            def step_writes_to_stderr_and_passes(context, text):
                sys.stderr.write("stderr:%s;\n" % text)

            @step('a step writes "{text}" to stderr and fails')
            def step_writes_to_stderr_and_fails(context, text):
                sys.stderr.write("stderr:%s;\n" % text)
                assert False, "XFAIL, step with: %s;" % text
            """
        And a file named "features/capture_stderr.example1.feature" with:
            """
            Feature:
                Scenario:
                    Given a step writes "Alice" to stderr and passes
                    When a step writes "Bob" to stderr and passes
                    Then a step writes "Charly" to stderr and passes
            """
        And a file named "features/capture_stderr.example2.feature" with:
            """
            Feature:
                Scenario:
                    Given a step writes "Alice" to stderr and passes
                    When a step writes "Bob" to stderr and fails
                    Then a step writes "Charly" to stderr and fails
            """

