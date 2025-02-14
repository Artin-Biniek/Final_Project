{
Scenario:Link:https://behave.readthedocs.io/en/latest/gherkin/#background
Background
A background consists of a series of steps similar to scenarios. It allows you to add some context to the scenarios of a feature. A background is executed before each scenario of this feature but after any of the before hooks.


Given:It is useful for performing setup operations like:

logging into a web browser or

setting up a database with test data used by the scenarios.

The background description is for the benefit of humans reading the feature text. Again the background name should just be a reasonably descriptive title for the background operation being performed or requirement being met.

A background section may exist only once within a feature file. In addition, a background must be defined before any scenario or scenario outline.


Then:It contains steps as described below.

Good practices for using Background

Don’t use “Background” to set up complicated state unless that state is actually something the client needs to know.
For example, if the user and site names don’t matter to the client, you should use a high-level step such as “Given that I am logged in as a site owner”.

Keep your “Background” section short.
You’re expecting the user to actually remember this stuff when reading your scenarios. If the background is more than 4 lines long, can you move some of the irrelevant details into high-level steps? See calling steps from other steps.

Make your “Background” section vivid.
You should use colorful names and try to tell a story, because the human brain can keep track of stories much better than it can keep track of names like “User A”, “User B”, “Site 1”, and so on.

Keep your scenarios short, and don’t have too many.
If the background section has scrolled off the screen, you should think about using higher-level steps, or splitting the features file in two.

}
