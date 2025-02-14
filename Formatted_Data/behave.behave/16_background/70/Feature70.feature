 Scenario: Failing Background Step causes all ScenarioOutlines to fail
    Given a file named "features/background_fail_outline_example.feature" with:
        """
        Feature:
          Background:
            Given a background step passes
            And a background step fails
            But another background step passes

          Scenario Outline: SO1
            When a step <outcome1>
            Then another step <outcome2>

            Examples: Alpha
              | outcome1 | outcome2 |
              | passes   | passes   |
              | passes   | fails    |
              | fails    | passes   |
              | fails    | fails    |

          Scenario Outline: SO2
              When <word1> step passes

            Examples: Beta
              | word1   |
              | a       |
              | another |
        """
    When I run "behave -f plain -T features/background_fail_outline_example.feature"
    Then it should fail with:
        """
        0 scenarios passed, 6 failed, 0 skipped
        6 steps passed, 6 failed, 16 skipped, 0 undefined
        """
    And the command output should contain:
        """
        Feature:
          Background:

          Scenario Outline: SO1 -- @1.1 Alpha
            Given a background step passes ... passed
            And a background step fails ... failed
        Assertion Failed: XFAIL: background step

          Scenario Outline: SO1 -- @1.2 Alpha
            Given a background step passes ... passed
            And a background step fails ... failed
        Assertion Failed: XFAIL: background step

          Scenario Outline: SO1 -- @1.3 Alpha
            Given a background step passes ... passed
            And a background step fails ... failed
        Assertion Failed: XFAIL: background step

          Scenario Outline: SO1 -- @1.4 Alpha
            Given a background step passes ... passed
            And a background step fails ... failed
        Assertion Failed: XFAIL: background step

          Scenario Outline: SO2 -- @1.1 Beta
            Given a background step passes ... passed
            And a background step fails ... failed
        Assertion Failed: XFAIL: background step

          Scenario Outline: SO2 -- @1.2 Beta
            Given a background step passes ... passed
            And a background step fails ... failed
        Assertion Failed: XFAIL: background step
        """
    But note that "the failing Background step causes each ScenarioOutline to be marked as skipped"