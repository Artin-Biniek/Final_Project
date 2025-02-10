Scenario: Validate JSON output from example/gherkin_v6/ test run
    Given I use the directory "examples/gherkin_v6" as working directory
    When I run "behave -f json -o testrun_gherkin6_1.json features/"
    When I run "../../bin/jsonschema_validate.py testrun_gherkin6_1.json"
    Then it should pass with:
        """
        validate: testrun_gherkin6_1.json ... OK
        """
