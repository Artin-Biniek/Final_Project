Scenario: Tag expression with 0..1 tags
    Given the model elements with name and tags:
        | name | tags         | Comment |
        | S0   |              | Untagged    |
        | S1   | @foo         | With 1 tag  |
        | S2   | @other       |             |
        | S3   | @foo @other  | With 2 tags |
    And note that "are all combinations of 0..2 tags"
    Then the tag expression selects model elements with:
        | tag expression | selected?      | Case comment |
        |                | S0, S1, S2, S3 | Select all (empty tag expression) |
        |  @foo          | S1, S3         | Select @foo                       |
        | -@foo          | S0, S2         | not @foo, selects untagged elements |
    But note that "tag expression variants are also supported"
    And the tag expression selects model elements with:
        | tag expression | selected?      | Case comment |
        |  foo           | S1, S3         |     @foo: '@' is optional     |
        | -foo           | S0, S2         | not @foo: '@' is optional     |
        | ~foo           | S0, S2         | not @foo: tilde as minus      |
        | ~@foo          | S0, S2         | not @foo: '~@' is supported   |