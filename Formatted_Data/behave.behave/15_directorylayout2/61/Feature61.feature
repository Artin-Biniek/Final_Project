Scenario: Run behave with testing directory
        When I run "behave -f progress testing/"
        Then it should fail with:
            """
            ConfigError: No steps directory in '{__WORKDIR__}/testing'
            """