
{
<Scenario1>:Empty list, comma-separated
<Given1>:I am a painter
<When1>:I paint with
<Then1>:no colors are used

<Scenario2>: List with one item, comma-separated
<Given2>:I am a painter
<Then2>:the following colors are used color:blue

<Scenario3>:Many list, comma-separated
<Given3>:I am a painter
<When3>:I paint with red, green
<Scenario4>:

}
  Scenario: Empty list, comma-separated
    Given I am a painter
    When I paint with
    Then no colors are used

  Scenario: List with one item, comma-separated
    Given I am a painter
    When I paint with blue
    Then the following colors are used:
      | color |
      | blue  |

  Scenario: Many list, comma-separated
    Given I am a painter
    When I paint with red, green
    Then the following colors are used:
      | color |
      | red   |
      | green |

  Scenario: Many list with list-separator "and"
    Given I am a painter
    When I paint with red and green and blue
    Then the following colors are used:
      | color |
      | red   |
      | green |
      | blue  |
