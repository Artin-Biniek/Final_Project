Scenario: Feature Setup
    Given a new working directory
    And a file named "features/steps/steps.py" with:
      """
      from behave import step

      @step(u'the browser is "{browser_name}"')
      def step_browser_is(context, browser_name):
          assert context.browser == browser_name

      @step(u'no browser info exists')
      def step_no_browser_info(context):
          assert not hasattr(context, "browser")

      @step(u'{word:w} step passes')
      def step_passes(context, word):
          pass
      """
    And a file named "behave.ini" with:
      """
      [behave]
      show_timings = false
      """
    And an empty file named "features/environment.py"