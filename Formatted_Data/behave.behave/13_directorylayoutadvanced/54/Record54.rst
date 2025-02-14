{
Scenario:Link:https://behave.readthedocs.io/en/latest/gherkin/#layout-variations
Layout Variations
behave has some flexibility built in. It will actually try quite hard to find feature specifications. 


Given:When launched you may pass on the command line:

nothing
In the absence of any information behave will attempt to load your features from a subdirectory called “features” in the directory you launched behave.

a features directory path
This is the path to a features directory laid out as described above. It may be called anything but must contain at least one “name.feature” file and a directory called “steps”. The “environment.py” file, if present, must be in the same directory that contains the “steps” directory (not in the “steps” directory).

the path to a “*name*.feature” file
This tells behave where to find the feature file. To find the steps directory behave will look in the directory containing the feature file. If it is not present, behave will look in the parent directory, and then its parent, and so on until it hits the root of the filesystem. The “environment.py” file, if present, must be in the same directory that contains the “steps” directory (not in the “steps” directory).

Then:a directory containing your feature files
Similar to the approach above, you’re identifying the directory where your “name.feature” files are, and if the “steps” directory is not in the same place then behave will search for it just like above.
 This allows you to have a layout like:

+--tests/
|    +-- steps/
|    |    +-- use_steplib_xyz.py
|    |    +-- website_steps.py
|    |    +-- utils.py
|    +-- environment.py
|    +-- signup.feature
|    +-- login.feature
|    +-- account_details.feature
Note that with this approach, if you want to execute behave without having to explicitly specify the directory (first option) you can set the paths setting in your configuration file (e.g. paths=tests).

If you’re having trouble setting things up and want to see what behave is doing in attempting to find your features use the “-v” (verbose) command-line switch.

}

