 Scenario: Use JSON formatter on simple feature
        Given a file named "features/simple_feature_with_name.feature" with:
            """
            Feature: Simple, empty Feature
            """
        When I run "behave -f json.pretty features/simple_feature_with_name.feature"
        Then it should pass with:
            """
            0 features passed, 0 failed, 1 skipped
            0 scenarios passed, 0 failed, 0 skipped
            """
        And the command output should contain:
            """
            [
              {
                "keyword": "Feature",
                "location": "features/simple_feature_with_name.feature:1",
                "name": "Simple, empty Feature",
                "status": "skipped",
                "tags": []
              }
            ]
            """