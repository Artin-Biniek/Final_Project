 Scenario: Feature with Background after first Scenario should fail (SAD CASE)
    Given a file named "features/background_sad_example1.feature" with:
        """
        Feature:
          Scenario: S1
            When a step passes

          Background: B1
            Given a background step passes

          Scenario: S2
            Then a step passes
            And another step passes
        """
    When I run "behave -f plain -T features/background_sad_example1.feature"
    Then it should fail with:
        """
        Parser failure in state=steps at line 5: "Background: B1"
        REASON: Background may not occur after Scenario/ScenarioOutline.
        """