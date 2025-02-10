Scenario: Failing with Soft Assertions -- CASE 2

    HINT: If a step in the Scenario fails, execution is continued.

    Given a minimum number value of "5"
    Then  the number "4" is in the valid range
    And   the number "8" is in the valid range
    But note that "the step-2 is expected to fail"
    But note that "the step-3 should be executed and should pass"