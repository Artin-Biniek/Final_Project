Scenario: Validate JSON output from tools/test-features/ test run
    Given I use the current directory as working directory
    When I run "behave -f json -o testrun3.json tools/test-features/"
    When I run "bin/jsonschema_validate.py testrun3.json"
    Then it should pass with:
        """
        validate: testrun3.json ... OK
        """