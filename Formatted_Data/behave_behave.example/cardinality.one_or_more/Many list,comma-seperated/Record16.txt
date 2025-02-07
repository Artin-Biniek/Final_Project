{
<Scenario1>:  Cardinality: many this should be a comma-separated list, 
<Given1>:I meet
<When1>: I meet items{Alice, Bob, Charly}
<Then1>:this should be a comma-separated list like:

.. code-block:: gherkin

    Scenario:
        When I meet Alice
         And I meet Alice, Bob, Charly

}