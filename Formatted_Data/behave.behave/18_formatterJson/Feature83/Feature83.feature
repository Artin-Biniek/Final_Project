Scenario: Use JSON formatter with feature and one scenario with tags
        Given a file named "features/simple_scenario_with_tags.feature" with:
            """
            Feature:

              @foo
              @bar
              Scenario: Simple scenario with tags but without steps
            """
        When I run "behave -f json.pretty features/simple_scenario_with_tags.feature"
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
                    "keyword": "Scenario",
                    "location": "features/simple_scenario_with_tags.feature:5",
                    "name": "Simple scenario with tags but without steps",
                    "status": "passed",
                    "steps": [],
                    "tags": [
                      "foo",
                      "bar"
                    ],
                    "type": "scenario"
                  }
                ],
                "keyword": "Feature",
                "location": "features/simple_scenario_with_tags.feature:1",
                "name": "",
                "status": "passed",
                "tags": []
              }
            ]
            """