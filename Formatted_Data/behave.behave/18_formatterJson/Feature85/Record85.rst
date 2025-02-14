{
Scenario:Link:https://behave.readthedocs.io/en/latest/formatters/#formatters,https://behave.readthedocs.io/en/latest/formatters/#user-defined-formatters
Formatters

Given:The following formatters are currently supported:

Name

Mode

Description

help

normal

Shows all registered formatters.

bad_steps

dry-run

Shows BAD STEP-DEFINITIONS (if any exist).

json

normal

JSON dump of test run

json.pretty

normal

JSON dump of test run (human readable)

plain

normal

Very basic formatter with maximum compatibility

pretty

normal

Standard colourised pretty formatter

progress

normal

Shows dotted progress for each executed scenario.

progress2

normal

Shows dotted progress for each executed step.

progress3

normal

Shows detailed progress for each step of a scenario.

rerun

normal

Emits scenario file locations of failing scenarios

sphinx.steps

dry-run

Generate sphinx-based documentation for step definitions.

steps

dry-run

Shows step definitions (step implementations).

steps.catalog

dry-run

Shows non-technical documentation for step definitions.

steps.code

dry-run

Shows executed steps combined with their code.

steps.doc

dry-run

Shows documentation for step definitions.

steps.usage

dry-run

Shows how step definitions are used by steps (in feature files).

tags

dry-run

Shows tags (and how often they are used).

tags.location

dry-run

Shows tags and the location where they are used.

Note

You can use more than one formatter during a test run. But in general you have only one formatter that writes to stdout.

The “Mode” column indicates if a formatter is intended to be used in dry-run (--dry-run command-line option) or normal mode.

Then:Refer to the description of command line arguments
User-Defined Formatters
Behave allows you to provide your own formatter (class):

# -- USE: Formatter class "Json2Formatter" in python module "foo.bar"
# NOTE: Formatter must be importable from python search path.
behave -f foo.bar:Json2Formatter ...
The usage of a user-defined formatter can be simplified by providing an alias name for it in the configuration file:

# -- FILE: behave.ini
# ALIAS SUPPORTS: behave -f json2 ...
# NOTE: Formatter aliases may override builtin formatters.
[behave.formatters]
json2 = foo.bar:Json2Formatter
If your formatter can be configured, you should use the userdata concept to provide them. The formatter should use the attribute schema:

# -- FILE: behave.ini
# SCHEMA: behave.formatter.<FORMATTER_NAME>.<ATTRIBUTE_NAME>
[behave.userdata]
behave.formatter.json2.use_pretty = true

# -- SUPPORTS ALSO:
#    behave -f json2 -D behave.formatter.json2.use_pretty ...

}