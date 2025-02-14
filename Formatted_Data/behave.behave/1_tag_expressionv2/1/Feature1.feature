{
Scenario: Select @foo
    Given: the tag expression "@foo"
    Then: the tag expression selects elements with tags:
        | tags         | selected? |
        |              |   no      |
        | @foo         |   yes     |
        | @other       |   no      |
        | @foo @other  |   yes     |

}