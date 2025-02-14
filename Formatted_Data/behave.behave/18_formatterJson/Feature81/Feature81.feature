Scenario: Use JSON formatter with feature and one scenario without steps
        Given a file named "features/simple_scenario.feature" with:
            """
            Feature:
              Scenario: Simple scenario without steps
            """
        When I run "behave -f json.pretty features/simple_scenario.feature"
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
                    "location": "features/simple_scenario.feature:2",
                    "name": "Simple scenario without steps",
                    "status": "passed",
                    "steps": [],
                    "tags": [],
                    "type": "scenario"
                  }
                ],
                "keyword": "Feature",
                "location": "features/simple_scenario.feature:1",
                "name": "",
                "status": "passed",
                "tags": []
              }
            ]
            """