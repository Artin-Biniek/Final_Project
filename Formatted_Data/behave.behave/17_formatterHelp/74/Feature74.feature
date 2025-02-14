Scenario: Good Formatter by using a Formatter-Alias
      Given an empty file named "behave4me/__init__.py"
      And a file named "behave4me/good_formatter.py" with:
        """
        from behave.formatter.base import Formatter

        class SomeFormatter(Formatter):
            name = "some"
            description = "Very basic formatter for Some format."

            def __init__(self, stream_opener, config):
                super(SomeFormatter, self).__init__(stream_opener, config)
        """
      And a file named "behave.ini" with:
        """
        [behave.formatters]
        some = behave4me.good_formatter:SomeFormatter
        """
      When I run "behave --format=help"
      Then it should pass
      And the command output should contain:
        """
        rerun          Emits scenario file locations of failing scenarios
        some           Very basic formatter for Some format.
        sphinx.steps   Generate sphinx-based documentation for step definitions.
        """
      And note that "the new formatter appears in the sorted list of formatters"
      But the command output should not contain "UNAVAILABLE FORMATTERS"