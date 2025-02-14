Scenario: Use JSON formatter with feature and one scenario with steps
        Given a file named "features/scenario_with_steps.feature" with:
            """
            Feature:
              Scenario: Simple scenario with with steps
                  Given a step passes
                  When a step passes
                  Then a step passes
                  And a step passes
                  But a step passes
            """
        When I run "behave -f json.pretty features/scenario_with_steps.feature"
        Then it should pass with:
            """
            1 feature passed, 0 failed, 0 skipped
            1 scenario passed, 0 failed, 0 skipped
            """
        And the command output should contain:
            """
            "steps": [
                {
                  "keyword": "Given",
                  "location": "features/scenario_with_steps.feature:2",
                  "match": {
                    "arguments": [],
                    "location": "features/steps/steps.py:3"
                  },
                  "name": "a step passes",
                  "result": {
                    "duration": XXX,
                    "status": "passed",
                  }
                  "step_type": "given",
                },
                {
                  "keyword": "When",
                  "location": "features/scenario_with_steps.feature:3",
                  "match": {
                    "arguments": [],
                    "location": "features/steps/steps.py:3"
                  },
                  "name": "a step passes",
                  "result": {
                    "duration": XXX,
                    "status": "passed",
                  }
                  "step_type": "when",
                },
                {
                  "keyword": "Then",
                  "location": "features/scenario_with_steps.feature:4",
                  "match": {
                    "arguments": [],
                    "location": "features/steps/steps.py:3"
                  },
                  "name": "a step passes",
                  "result": {
                    "duration": XXX,
                    "status": "passed",
                  }
                  "step_type": "then",
                },
                {
                  "keyword": "And",
                  "location": "features/scenario_with_steps.feature:5",
                  "match": {
                    "arguments": [],
                    "location": "features/steps/steps.py:3"
                  },
                  "name": "a step passes",
                  "result": {
                    "duration": XXX,
                    "status": "passed",
                  }
                  "step_type": "then",
                },
                {
                  "keyword": "But",
                  "location": "features/scenario_with_steps.feature:6",
                  "match": {
                    "arguments": [],
                    "location": "features/steps/steps.py:3"
                  },
                  "name": "a step passes",
                  "result": {
                    "duration": XXX,
                    "status": "passed",
                  }
                  "step_type": "then",
                }
            ],
            """