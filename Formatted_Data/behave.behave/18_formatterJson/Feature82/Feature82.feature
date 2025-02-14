 Scenario: Use JSON formatter with feature and one scenario with description
        Given a file named "features/simple_scenario_with_description.feature" with:
            """
            Feature:
              Scenario: Simple scenario with description but without steps

                First scenario description line.
                Second scenario description line.

                Third scenario description line (after an empty line).
            """
        When I run "behave -f json.pretty features/simple_scenario_with_description.feature"
        Then it should pass with:
            """
            1 feature passed, 0 failed, 0 skipped
            1 scenario passed, 0 failed, 0 skipped
            """
        And the command output should contain:
            """
            [
              {
                "elements": [
                  {
                    "description": [
                      "First scenario description line.",
                      "Second scenario description line.",
                      "Third scenario description line (after an empty line)."
                    ],
                    "keyword": "Scenario",
                    "location": "features/simple_scenario_with_description.feature:2",
                    "name": "Simple scenario with description but without steps",
                    "status": "passed",
                    "steps": [],
                    "tags": [],
                    "type": "scenario"
                  }
                ],
                "keyword": "Feature",
                "location": "features/simple_scenario_with_description.feature:1",
                "name": "",
                "status": "passed",
                "tags": []
              }
            ]
            """