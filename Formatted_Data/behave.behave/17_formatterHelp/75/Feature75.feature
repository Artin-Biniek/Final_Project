Scenario Template: Bad Formatter with <formatter_syndrome>
      Given a file named "behave.ini" with:
        """
        [behave.formatters]
        <formatter_name> = <formatter_class>
        """
      When I run "behave --format=help"
      Then it should pass
      And the command output should contain:
        """
        UNAVAILABLE FORMATTERS:
          <formatter_name>  <formatter_syndrome>: <problem_description>
        """

      @use.with_python.min_version=3.6
      Examples: For Python >= 3.6
        | formatter_name | formatter_class                           | formatter_syndrome  | problem_description |
        | bad_formatter1 | behave4me.unknown:Formatter               | ModuleNotFoundError | No module named 'behave4me.unknown' |

      @not.with_python.min_version=3.6
      @use.with_pypy=true
      Examples: For Python < 3.6
        | formatter_name | formatter_class                           | formatter_syndrome  | problem_description |
        | bad_formatter1 | behave4me.unknown:Formatter               | ModuleNotFoundError | No module named 'behave4me.unknown' |

      @not.with_python.min_version=3.6
      @not.with_pypy=true
      Examples: For Python < 3.6
        | formatter_name | formatter_class                           | formatter_syndrome  | problem_description |
        | bad_formatter1 | behave4me.unknown:Formatter               | ModuleNotFoundError | No module named 'unknown' |

      Examples:
        | formatter_name | formatter_class                           | formatter_syndrome  | problem_description |
        | bad_formatter2 | behave4me.bad_formatter:UnknownFormatter  | ClassNotFoundError  | behave4me.bad_formatter:UnknownFormatter |
        | bad_formatter3 | behave4me.bad_formatter:InvalidFormatter1 | InvalidClassError   | is not a subclass-of Formatter |
        | bad_formatter4 | behave4me.bad_formatter:InvalidFormatter2 | InvalidClassError   | is not a class |