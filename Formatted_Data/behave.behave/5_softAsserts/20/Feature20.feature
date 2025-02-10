 Scenario: Failing with Soft Assertions -- CASE 1 and CASE 2

    Given a minimum number value of "5"
    Then  the number "2" is in the valid range
    And   the numbers "3" and "4" are in the valid range
    And   the number "8" is in the valid range
    But note that "the step-2 and step-3 are expected to fail"
    But note that "the step-4 should be executed and should pass"