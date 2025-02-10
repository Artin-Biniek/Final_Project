Scenario: Tag expression with two tags (@foo, @bar)
    Given the model elements with name and tags:
        | name | tags             | Comment |
        | S0   |                  | Untagged    |
        | S1   | @foo             | With 1 tag  |
        | S2   | @bar             |             |
        | S3   | @other           |             |
        | S4   | @foo @bar        | With 2 tags |
        | S5   | @foo @other      |             |
        | S6   | @bar @other      |             |
        | S7   | @foo @bar @other | With 3 tags |
    And note that "are all combinations of 0..3 tags"
    Then the tag expression selects model elements with:
        | tag expression         | selected?                      | Case |
        |                        | S0, S1, S2, S3, S4, S5, S6, S7 | Select all            |
        |  @foo or @bar          | S1, S2, S4, S5, S6, S7         | @foo or @bar          |
        |  @foo or not @bar      | S0, S1, S3, S4, S5, S7         | @foo or not @bar      |
        |  not @foo or not @bar  | S0, S1, S2, S3, S5, S6         | not @foo or @not @bar |
        |  @foo  and @bar        | S4, S7                         | @foo and @bar         |
        |  @foo and     not @bar | S1, S5                         | @foo and not @bar     |
        |  not @foo and not @bar | S0, S3                         | not @foo and not @bar |