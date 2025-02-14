Scenario: Use JSON formatter on simple feature with tags
        Given a file named "features/simple_feature_with_tags.feature" with:
            """
            @foo @bar
            Feature: Simple feature with tags
            """
        When I run "behave -f json.pretty features/simple_feature_with_tags.feature"
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
                "location": "features/simple_feature_with_tags.feature:2",
                "name": "Simple feature with tags",
                "status": "skipped",
                "tags": [
                  "foo",
                  "bar"
                ]
              }
            ]
            """