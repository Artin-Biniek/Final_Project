Scenario: Feature with two Backgrounds should fail (SAD CASE)
    Given a file named "features/background_sad_example2.feature" with:
        """
        Feature:
          Background: B1
            Given a background step passes

          Background: B2 (XFAIL)
            Given another background step passes

          Scenario: S1
            When a step passes

          Scenario: S2
            Then a step passes
            And another step passes
        """
    When I run "behave -f plain -T features/background_sad_example2.feature"
    Then it should fail with:
        """
        Parser failure in state=steps at line 5: "Background: B2 (XFAIL)"
        REASON: Background should not be used here.
        """