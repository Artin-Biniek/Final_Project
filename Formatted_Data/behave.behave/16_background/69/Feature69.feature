 Scenario: Feature with a Background and ScenarioOutlines
    Given a file named "features/background_outline_example.feature" with:
        """
        Feature:
          Background:
            Given a background step passes
            And another background step passes

          Scenario Outline: SO1
            When a step <outcome1>
            Then another step <outcome2>

            Examples: Alpha
              | outcome1 | outcome2 |
              | passes   | passes   |
              | passes   | passes   |

          Scenario Outline: SO2
            Given <word1> step passes
            Then <word2> step passes

            Examples:
              | word1   | word2   |
              | a       | a       |
              | a       | another |
              | another | a       |
        """
    When I run "behave -f plain -T features/background_outline_example.feature"
    Then it should pass with:
        """
        5 scenarios passed, 0 failed, 0 skipped
        20 steps passed, 0 failed, 0 skipped, 0 undefined
        """
    And the command output should contain:
        """
        Feature:
          Background:

          Scenario Outline: SO1 -- @1.1 Alpha
            Given a background step passes ... passed
            And another background step passes ... passed
            When a step passes ... passed
            Then another step passes ... passed

          Scenario Outline: SO1 -- @1.2 Alpha
            Given a background step passes ... passed
            And another background step passes ... passed
            When a step passes ... passed
            Then another step passes ... passed

          Scenario Outline: SO2 -- @1.1
            Given a background step passes ... passed
            And another background step passes ... passed
            Given a step passes ... passed
            Then a step passes ... passed

          Scenario Outline: SO2 -- @1.2
            Given a background step passes ... passed
            And another background step passes ... passed
            Given a step passes ... passed
            Then another step passes ... passed

          Scenario Outline: SO2 -- @1.3
            Given a background step passes ... passed
            And another background step passes ... passed
            Given another step passes ... passed
            Then a step passes ... passed
        """
    But note that "the Background steps are injected into each ScenarioOutline"
    And note that "the Background steps are executed before any ScenarioOutline steps"