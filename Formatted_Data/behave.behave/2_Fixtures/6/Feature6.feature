Scenario: Use fixture with generator-function (setup/cleanup)
    Given a file named "features/environment.py" with:
      """
      from __future__ import print_function
      from behave.fixture import fixture, use_fixture

      @fixture(name="browser.firefox")
      def browser_firefox(context):
          print("FIXTURE-SETUP: browser.firefox")
          context.browser = "firefox"
          yield
          print("FIXTURE-CLEANUP: browser.firefox")
          # -- SCOPE-CLEANUP OR EXPLICIT: del context.browser

      def before_tag(context, tag):
          if tag == "fixture.browser.firefox":
              use_fixture(browser_firefox, context)
      """
    And a file named "features/alice.feature" with:
      """
      Feature: Fixture setup/teardown
        @fixture.browser.firefox
        Scenario: Fixture with browser=firefox
          Given the browser is "firefox"

        Scenario: Fixture Cleanup check
          Then no browser info exists
      """
    When I run "behave -f plain features/alice.feature"
    Then it should pass with:
      """
      2 scenarios passed, 0 failed, 0 skipped
      2 steps passed, 0 failed, 0 skipped, 0 undefined
      """
    And the command output should contain:
      """
      FIXTURE-SETUP: browser.firefox
        Scenario: Fixture with browser=firefox
          Given the browser is "firefox" ... passed
      FIXTURE-CLEANUP: browser.firefox
      """