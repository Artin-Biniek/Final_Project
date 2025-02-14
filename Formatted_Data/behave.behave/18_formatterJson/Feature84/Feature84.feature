 Scenario: Use JSON formatter and embed binary data in report from two steps
      Given a file named "features/json_embeddings.feature" with:
          """
          Feature:
            Scenario: Use embeddings
                Given "foobar" as plain text
                And "red" as plain text
          """
      And a file named "features/steps/json_embeddings_steps.py" with:
          """
          from behave import step

          @step('"{data}" as plain text')
          def step_string(context, data):
              context.attach("text/plain", data.encode("utf-8"))
          """
      When I run "behave -f json.pretty features/json_embeddings.feature"
      Then it should pass with:
          """
          1 feature passed, 0 failed, 0 skipped
          1 scenario passed, 0 failed, 0 skipped
          """
      And the command output should contain:
          """
                    "embeddings": [
                      {
                        "data": "Zm9vYmFy",
                        "mime_type": "text/plain"
                      }
                    ],
          """
      And the command output should contain:
          """
                    "embeddings": [
                      {
                        "data": "cmVk",
                        "mime_type": "text/plain"
                      }
                    ],
          """