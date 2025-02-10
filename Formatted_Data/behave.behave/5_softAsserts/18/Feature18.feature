Scenario: Failing with Soft Assertions -- CASE 1

    HINT:
    Multiple assert statements in a step are executed even if a assert fails.
    After a failed step in the Scenario,
    the remaining steps are skipped and the next Scenario is executed.

    Given a minimum number value of "5"
    Then  the numbers "2" and "12" are in the valid range
    But note that "the step-2 (then step) is expected to fail"