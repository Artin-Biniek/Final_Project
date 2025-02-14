{
<Scenario>:Support for multiple databases.By default, Django only loads fixtures into the ``default`` database.
<Then>: Use ``before_scenario`` to load the fixtures in all of the databases you have
configured if your tests rely on the fixtures being loaded in all of them.

}