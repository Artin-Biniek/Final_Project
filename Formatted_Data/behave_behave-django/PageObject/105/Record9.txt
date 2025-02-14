{
<Scenario>:"Using Page Objects With *behave-django* you can use the `Page Object pattern`_ and work on a
natural abstraction layer for the content or behavior your web application
produces.  This is a popular approach to make your tests more stable and
your code easier to read.",
<When1>: 'I am on the Welcome page.A ``PageObject`` instance automatically loads and parses the page you
specify by its ``page`` attribute.'
<Then>:"'You then have access to the following attributes ``request``
    The HTTP request used by the Django test client to fetch the document.
    This is merely a convenient alias for ``response.request``.

``response``
    The Django test client's HTTP response object.  Use this to verify the
    actual HTTP response related to the retrieved document.

``document``
    The parsed content of the response.  This is, technically speaking, a
    `Beautiful Soup`_ object.  You *can* use this to access and verify any
    part of the document content, though it's recommended that you only
    access the elements you specify with the ``elements`` attribute, using
    the appropriate helper methods."
<And>:"helpers to access your page object's elements:

``get_link(name) -> Link``
    A subdocument representing a HTML anchor link, retrieved from
    ``document`` using the CSS selector specified in ``elements[name]``.
    The returned ``Link`` object provides a ``click()`` method to trigger
    loading the link's URL, which again returns a ``PageObject``."
<When2>:"I click on the "About" link"
<Then2>: "The returned ``Link`` object provides a ``click()`` method to trigger
loading the link's URL, which again returns a ``PageObject``.The About page is loaded"
}
