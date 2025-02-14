 Scenario: Good case (with builtin formatters)
      Given an empty file named "behave.ini"
      When I run "behave --format=help"
      Then it should pass
      And the command output should contain:
        """
        AVAILABLE FORMATTERS:
          json           JSON dump of test run
          json.pretty    JSON dump of test run (human readable)
          null           Provides formatter that does not output anything.
          plain          Very basic formatter with maximum compatibility
          pretty         Standard colourised pretty formatter
          progress       Shows dotted progress for each executed scenario.
          progress2      Shows dotted progress for each executed step.
          progress3      Shows detailed progress for each step of a scenario.
          rerun          Emits scenario file locations of failing scenarios
          sphinx.steps   Generate sphinx-based documentation for step definitions.
          steps          Shows step definitions (step implementations).
          steps.bad      Shows BAD STEP-DEFINITION(s) (if any exist).
          steps.catalog  Shows non-technical documentation for step definitions.
          steps.code     Shows executed steps combined with their code.
          steps.doc      Shows documentation for step definitions.
          steps.missing  Shows undefined/missing steps definitions, implements them.
          steps.usage    Shows how step definitions are used by steps.
          tags           Shows tags (and how often they are used).
          tags.location  Shows tags and the location where they are used.
        """