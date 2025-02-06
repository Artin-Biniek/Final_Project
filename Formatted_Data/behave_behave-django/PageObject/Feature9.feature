{
<Scenario>: Welcome page object returns a valid (Beautiful Soup) document,
<When1>: I instantiate the Welcome page object
<Then>:it provides a valid Beautiful Soup document
<And>:get_link() returns the link subdocument
<When2>:I call click() on the link
<Then2>:it loads a new PageObject

}
