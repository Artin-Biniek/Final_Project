{
<Scenario>:Django’s Test Client
<When>:"If you only use Django's test client"
<Then>:"*behave* tests can run much
quicker with the ``--simple`` command line option.In this case transaction
rollback is used for test automation instead of flushing the database after
each scenario, just like in Django's standard ``TestCase``.

}