Scenario:Link:https://behave.readthedocs.io/en/latest/formatters/#formatters
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

Then:Refer to the description of the command line functions

}