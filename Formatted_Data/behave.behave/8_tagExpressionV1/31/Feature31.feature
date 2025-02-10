 Scenario: Tag expression with three tags (@foo, @bar, @zap)
    Given the model elements with name and tags:
        | name | tags                   | Comment |
        | S0   |                        | Untagged    |
        | S1   | @foo                   | With 1 tag  |
        | S2   | @bar                   |             |
        | S3   | @zap                   |             |
        | S4   | @other                 |             |
        | S5   | @foo @bar              | With 2 tags |
        | S6   | @foo @zap              |             |
        | S7   | @foo @other            |             |
        | S8   | @bar @zap              |             |
        | S9   | @bar @other            |             |
        | S10  | @zap @other            |             |
        | S11  | @foo @bar @zap         | With 3 tags |
        | S12  | @foo @bar @other       |             |
        | S13  | @foo @zap @other       |             |
        | S14  | @bar @zap @other       |             |
        | S15  | @foo @bar @zap @other  | With 4 tags |
    And note that "are all combinations of 0..4 tags"
    Then the tag expression selects model elements with:
        | tag expression   | selected?                   | Case |
        |  @foo,@bar  @zap | S6, S8, S11, S13, S14, S15  | (@foo or @bar) and @zap |
        |  @foo,@bar -@zap | S1, S2, S5, S7, S9, S12     | (@foo or @bar) and not @zap |
        |  @foo,-@bar @zap | S3, S6, S10, S11, S13, S15  | (@foo or not @bar) and @zap |