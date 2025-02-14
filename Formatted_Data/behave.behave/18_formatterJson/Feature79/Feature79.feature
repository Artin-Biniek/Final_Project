 Scenario: Use JSON formatter on simple feature with description
        Given a file named "features/simple_feature_with_description.feature" with:
            """
            Feature: Simple feature with description

                First feature description line.
                Second feature description line.

                Third feature description line (following an empty line).
            """
        When I run "behave -f json.pretty features/simple_feature_with_description.feature"
        Then it should pass with:
            """
            0 features passed, 0 failed, 1 skipped
            0 scenarios passed, 0 failed, 0 skipped
            """
        And the command output should contain:
            """
            [
              {
                "description": [
                  "First feature description line.",
                  "Second feature description line.",
                  "Third feature description line (following an empty line)."
                ],
                "keyword": "Feature",
                "location": "features/simple_feature_with_description.feature:1",
                "name": "Simple feature with description",
                "status": "skipped",
                "tags": []
              }
            ]
            """