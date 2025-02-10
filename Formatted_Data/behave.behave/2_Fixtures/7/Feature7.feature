 Scenario: Use fixture with function (setup-only)
    Given a file named "features/environment.py" with:
      """
      from __future__ import print_function
      from behave.fixture import fixture, use_fixture

      @fixture(name="browser.chrome")
      def browser_chrome(context):
          # -- CASE: Setup-only
          print("FIXTURE-SETUP: browser.chrome")
          context.browser = "chrome"

      def before_tag(context, tag):
          if tag == "fixture.browser.chrome":
              use_fixture(browser_chrome, context)
      """
    And a file named "features/bob.feature" with:
      """
      Feature: Fixture setup only
        @fixture.browser.chrome
        Scenario: Fixture with browser=chrome
          Given the browser is "chrome"

        Scenario: Fixture Cleanup check
          Then no browser info exists
      """
    When I run "behave -f plain features/bob.feature"
    Then it should pass with:
      """
      2 scenarios passed, 0 failed, 0 skipped
      2 steps passed, 0 failed, 0 skipped, 0 undefined
      """
    And the command output should contain:
      """
      FIXTURE-SETUP: browser.chrome
        Scenario: Fixture with browser=chrome
          Given the browser is "chrome" ... passed

        Scenario: Fixture Cleanup check
          Then no browser info exists ... passed
      """