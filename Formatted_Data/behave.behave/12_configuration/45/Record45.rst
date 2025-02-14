{

Scenario:Link:https://behave.readthedocs.io/en/latest/behave/#configuration-files
Configuration Files
Configuration files for behave are called either “.behaverc”, “behave.ini”, “setup.cfg”, “tox.ini”, or “pyproject.toml” (your preference) and are located in one of three places:

the current working directory (good for per-project settings),

your home directory ($HOME), or

on Windows, in the %APPDATA% directory.

If you are wondering where behave is getting its configuration defaults from you can use the “-v” command-line argument and it’ll tell you.

Configuration files must start with the label “[behave]” and are formatted in the Windows INI style, for example:

[behave]
format=plain
logging_clear_handlers=yes
logging_filter=-suds
Alternatively, if using “pyproject.toml” instead (note the “tool.” prefix):

[tool.behave]
format = "plain"
logging_clear_handlers = true
logging_filter = "-suds"
NOTE: toml does not support ‘%’ interpolations.


Given:Configuration Parameter Types
The following types are supported (and used):

text
This just assigns whatever text you supply to the configuration setting.

bool
This assigns a boolean value to the configuration setting. The text describes the functionality when the value is true. True values are “1”, “yes”, “true”, and “on”. False values are “0”, “no”, “false”, and “off”. TOML: toml only accepts its native true

sequence<text>
These fields accept one or more values on new lines, for example a tag expression might look like:

default_tags= (@foo or not @bar) and @zap
which is the equivalent of the command-line usage:

--tags="(@foo or not @bar) and @zap"
TOML: toml can use arrays natively.

Configuration Parameters
color : Colored (Enum)
Use colored mode or not (default: auto).

dry_run : bool
Invokes formatters without executing the steps.

userdata_defines : sequence<text>
Define user-specific data for the config.userdata dictionary. Example: -D foo=bar to store it in config.userdata[“foo”].

exclude_re : text
Don’t run feature files matching regular expression PATTERN.

include_re : text
Only run feature files matching regular expression PATTERN.

junit : bool
Output JUnit-compatible reports. When junit is enabled, all stdout and stderr will be redirected and dumped to the junit report, regardless of the “–capture” and “–no-capture” options.

junit_directory : text
Directory in which to store JUnit reports.

jobs : positive_number
Number of concurrent jobs to use (default: 1). Only supported by test runners that support parallel execution.

default_format : text
Specify default formatter (default: pretty).

format : sequence<text>
Specify a formatter. If none is specified the default formatter is used. Pass “–format help” to get a list of available formatters.

steps_catalog : bool
Show a catalog of all available step definitions. SAME AS: –format=steps.catalog –dry-run –no-summary -q

scenario_outline_annotation_schema : text
Specify name annotation schema for scenario outline (default=”{name} – @{row.id} {examples.name}”).

show_skipped : bool
Print skipped steps. This is the default behaviour. This switch is used to override a configuration file setting.

show_snippets : bool
Print snippets for unimplemented steps. This is the default behaviour. This switch is used to override a configuration file setting.

show_multiline : bool
Print multiline strings and tables under steps. This is the default behaviour. This switch is used to override a configuration file setting.

name : sequence<text>
Select feature elements (scenarios, …) to run which match part of the given name (regex pattern). If this option is given more than once, it will match against all the given names.

stdout_capture : bool
Capture stdout (any stdout output will be printed if there is a failure.) This is the default behaviour. This switch is used to override a configuration file setting.

stderr_capture : bool
Capture stderr (any stderr output will be printed if there is a failure.) This is the default behaviour. This switch is used to override a configuration file setting.

log_capture : bool
Capture logging. All logging during a step will be captured and displayed in the event of a failure. This is the default behaviour. This switch is used to override a configuration file setting.

logging_level : text
Specify a level to capture logging at. The default is INFO - capturing everything.

logging_format : text
Specify custom format to print statements. Uses the same format as used by standard logging handlers. The default is “%(levelname)s:%(name)s:%(message)s”.

logging_datefmt : text
Specify custom date/time format to print statements. Uses the same format as used by standard logging handlers.

logging_filter : text
Specify which statements to filter in/out. By default, everything is captured. If the output is too verbose, use this option to filter out needless output. Example: logging_filter = foo will capture statements issued ONLY to “foo” or “foo.what.ever.sub” but not “foobar” or other logger. Specify multiple loggers with comma: logging_filter = foo,bar,baz. If any logger name is prefixed with a minus, eg logging_filter = -foo, it will be excluded rather than included.

logging_clear_handlers : bool
Clear all other logging handlers.

summary : bool
Display the summary at the end of the run.

outfiles : sequence<text>
Write to specified file instead of stdout.

paths : sequence<text>
Specify default feature paths, used when none are provided.

tag_expression_protocol : TagExpressionProtocol (Enum)
Specify the tag-expression protocol to use (default: auto_detect). With “v1”, only tag-expressions v1 are supported. With “v2”, only tag-expressions v2 are supported. With “auto_detect”, tag- expressions v1 and v2 are auto-detected.

quiet : bool
Alias for –no-snippets –no-source.

runner : text
Use own runner class, like: “behave.runner:Runner”

show_source : bool
Print the file and line of the step definition with the steps. This is the default behaviour. This switch is used to override a configuration file setting.

stage : text
Defines the current test stage. The test stage name is used as name prefix for the environment file and the steps directory (instead of default path names).

stop : bool
Stop running tests at the first failure.

default_tags : sequence<text>
Define default tags when non are provided. See –tags for more information.

tags : sequence<text>
Only execute certain features or scenarios based on the tag expression given. See below for how to code tag expressions in configuration files.

show_timings : bool
Print the time taken, in seconds, of each step after the step has completed. This is the default behaviour. This switch is used to override a configuration file setting.

verbose : bool
Show the files and features loaded.

wip : bool
Only run scenarios tagged with “wip”. Additionally: use the “plain” formatter, do not capture stdout or logging output and stop at the first failure.

lang : text
Use keywords for a language other than English.

Then:Refer to description under command-line arguments

}