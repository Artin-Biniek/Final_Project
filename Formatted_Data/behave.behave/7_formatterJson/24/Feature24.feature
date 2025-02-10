Scenario: Validate JSON output from issue.features/ test run
    Given I use the current directory as working directory
    When I run "behave -f json -o testrun2.json issue.features/"
    When  I run "bin/jsonschema_validate.py testrun2.json"
    Then it should pass with:
        """
        validate: testrun2.json ... OK
        """
