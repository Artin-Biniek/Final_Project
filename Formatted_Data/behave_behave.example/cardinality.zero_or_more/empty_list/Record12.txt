{
<Scenario1>:Cardinality: Zero (List of Type).Note that the case for zero or more items is not so often needed.

Initially, a comma-separated list is processed, like:

.. code-block:: gherkin

    Scenario:
        When I paint with red, green
<Given1>:zero items 
<When1>: Scenario:
        When I paint with

<Then1>: a comma-separated list is processed
}

 