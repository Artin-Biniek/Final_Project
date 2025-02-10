Scenario: Validate JSON output from features/ test run
    Given I use the current directory as working directory
    When I run "behave -f json -o testrun1.json features/"
    When I run "bin/jsonschema_validate.py testrun1.json"
    Then it should pass with:
        """
        validate: testrun1.json ... OK
        """