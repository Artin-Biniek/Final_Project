 Scenario: Multiple Bad Formatters
      Given a file named "behave.ini" with:
        """
        [behave.formatters]
        bad_formatter2 = behave4me.bad_formatter:UnknownFormatter
        bad_formatter3 = behave4me.bad_formatter:InvalidFormatter1
        """
      When I run "behave --format=help"
      Then it should pass
      And the command output should contain:
        """
        UNAVAILABLE FORMATTERS:
          bad_formatter2  ClassNotFoundError: behave4me.bad_formatter:UnknownFormatter
          bad_formatter3  InvalidClassError: is not a subclass-of Formatter
        """
      And note that "the list of UNAVAILABLE FORMATTERS is sorted-by-name"