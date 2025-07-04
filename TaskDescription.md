## Greetings %username% !

This is a quick manual on what we expect from you during performing the test task.

This will be a simple app that contains two features: Login & Checklist.

* First of all, get to know with the application under test, build the test app and check out its possibilities and bugs. 

* Second of all, we need to evaluate your qa manual background, so create down below:
 - short testplan 
 - list of the testcases
 - list of discovered issues
 
* Third of all, write test automation according test automation purposes  

* And fourth of all, push the whole project to github.com and notice us with a link to your repo on completion. 

Please reachout Oksana (otolstykh@readdle.com) if you have any questions.

## Good Luck!
* p.s. Do not tamper codebase of application

#YOUR TASK STARTS HERE: 


# TEST PLAN: 
1. Exploratory testing
2. Functional (positive/negative paths)
3. Accessibility testing

- Environment:
1. iOS Simulator: iPhone 16 (18.5)
2. iPadOS Simulator: iPad A16 (18.5)

- What parts of app will be tested:
1. Screens: Login screen, Task list screen, Subtask list screen
2. Layouts: iPhone, iPad
2. Accessibility: Dynamic Type, Voice Over, Dark Mode legibility

# LIST OF TEST CASES: 
Login screen:
- Login button disabled if email and/or password field is empty
- Error alert appears if email has an incorrect format 
- Login with correct creds shows Logging In screen, brings Tasks list screen after successful login

Task list screen
- Verify there are tasks in the table
- Verify all the buttons are present (logout, complete all, sort by name), navbar title is correct
- Completing the task makes it greyed out, checkbox becomes checked out and vice versa after tapping once again
- Logout button shows logout confirmation alert, brings Login screen after confirmation
- Complete All button checks all tasks as completed
- Sort by Name button sorts tasks correctly
- States of tasks persist when we navigate to subtasks screen and back

Subtasks list screen
- Completing a task with subtasks also completes all subtasks
- Unchecking a task with subtasks also unchecks all subtasks
- Changing subtasks status preserves its status if going going back to the main screen and to the sublist screen once again
- Nav bar title in subtasks list view matches with the task name 


# LIST OF DISCOVERED ISSUES:
- Login with valid creds can throw an error: "Unexpected login error occured"

- 'Sort by Name' button can change the state of the tasks (from not completed to completed)
- 'Sort by Name' button can incorrectly sort tasks by name
- 'Complete All' button can make tasks only change text to greyed out without changing the checkmark
- Checking all tasks manually does not make 'Complete All' button change its name to Cancel All and vice versa
- 'Complete All' button can sometimes not change to the 'Cancel All' button
- Checking a task can sometimes trigger a completion of a different (previous?) incomplete task or uncheck an already completed task

- In Dark mode some task titles are illegible
- In Dark mode unchecked checkmarks are not visible

- Task titles, some buttons and login screen elements do not have Dynamic Type support
- Switch Control does not work correctly on tasks cells
