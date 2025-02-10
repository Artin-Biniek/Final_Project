Link:https://behave.readthedocs.io/en/latest/api/#logging-capture
Link2:https://behave.readthedocs.io/en/latest/api/#behave.runner.Context.captured
Logging Capture
The logging capture behave uses by default is implemented by the class LoggingCapture. It has methods

class behave.log_capture.LoggingCapture(config, level=None)
Capture logging events in a memory buffer for later display or query.

Captured logging events are stored on the attribute buffer:

buffer
This is a list of captured logging events as logging.LogRecords.

By default the format of the messages will be:

'%(levelname)s:%(name)s:%(message)s'
This may be overridden using standard logging formatter names in the configuration variable logging_format.

The level of logging captured is set to logging.NOTSET by default. You may override this using the configuration setting logging_level (which is set to a level name.)

Finally there may be filtering of logging events specified by the configuration variable logging_filter.

abandon()
Turn off logging capture.

If other handlers were removed by inveigle() then they are reinstated.

any_errors()
Search through the buffer for any ERROR or CRITICAL events.

Returns boolean indicating whether a match was found.

find_event(pattern)
Search through the buffer for a message that matches the given regular expression.

Returns boolean indicating whether a match was found.

flush()
Override to implement custom flushing behaviour.

This version just zaps the buffer to empty.

inveigle()
Turn on logging capture by replacing all existing handlers configured in the logging module.

If the config var logging_clear_handlers is set then we also remove all existing handlers.

We also set the level of the root logger.

The opposite of this is abandon().

The log_capture module also defines a handy logging capture decorator that’s intended to be used on your environment file functions.

behave.log_capture.capture(*args, **kw)
Decorator to wrap an environment file function in log file capture.

It configures the logging capture using the behave context, the first argument to the function being decorated (so don’t use this to decorate something that doesn’t have context as the first argument).

The basic usage is:

The function prints any captured logging (at the level determined by the log_level configuration setting) directly to stdout, regardless of error conditions.

It is mostly useful for debugging in situations where you are seeing a message like:

No handlers could be found for logger "name"
The decorator takes an optional “level” keyword argument which limits the level of logging captured, overriding the level in the run’s configuration:

This would limit the logging captured to just ERROR and above, and thus only display logged events if they are interesting.
If any output capture is enabled, provides access to a Captured object that contains a snapshot of all captured data (stdout/stderr/log).