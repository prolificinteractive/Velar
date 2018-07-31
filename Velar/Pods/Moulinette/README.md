# Moulinette
An internal audit tool used by Prolific Interactive to ensure code quality and standards.

## Requirements
* Xcode 8.3.3 or up

## Instructions
How to build and run Moulinette on an Xcode project.

### From the command line
1. Open the project in Xcode by double clicking on the `.xcodeproj` file or running `open Moulinette.xcodeproj`.
2. Build the project using `CMD B`.
3. Copy the executable file titled `Moulinette` from `/Build/Products/Debug/` to your `your_project_repo/subdirectory`.
4. Run from the command line: `./Moulinette -projectName <project-name> -auditSubDirectory <subdirectory>`.

### From Xcode
1. Open the project in Xcode as in step 1 from above.
2. Set the `projectName` and `auditSubDirectory` variables in `ProjectSettings.swift`.
3. Build and run the project using `CMD R`.

## How To Contribute
### How to create a rule
#### Process
1. Pick a rule on the Trello board (https://trello.com/b/CNYIKBlQ/pios-moulinette).
2. Assess the requirements to create this rule (eg: talk with other members of the moulinette team).
3. Start working on the rule
    1. New rules conform to the `SwiftRule` protocol in `SwiftRule.swift`.
    2. Comment the rule:
        1. A comment explaining what the rule is checking should be present before the class declaration.
        2. Each methods (public / private / internal) should be commented and their behavior explained.
    3. Create the Unit Tests for the rule or create a task on Trello to remind to do it.
        1. If you create the unit tests:
            - Comment every test with a clear explanation of what you're testing and what you're expecting.
        2. If you create a task on Trello.
            - Comment the task and provide  edge cases that the rule should cover and their expectations.
4. Make a PR.
    1. Add all the PiOS Moulinette members in the PR.
    2. Only 2 approvals are required for merging the rule.
    3. Explain in your PR what your rule is testing and provided urls for your story and any other story related to this rule (eg: Provide also unit test link even if not made).


# Coffee
Tool calling the moulinette to generate multiple audit. 

## Authors
* Jonathan Samudio

## Requirements

* Xcode 8.3.3 or up

## Instructions

How to build and run Coffee on multiple projects.

### From the command line

1. Open the project in Xcode by double clicking on the `.xcodeproj` file or running `open Coffee.xcodeproj`.
2. Set your target to release mode & Build the project using `CMD B`.
3. Copy the executable file titled `Coffee` from `/Build/Products/Debug/` to your `your_project_repo/subdirectory`.
4. Run from the command line: `./Coffee -moulinettePath </$path/to/moulinette/binary/Moulinette> -projectDirectory </$path/to/projects/directory/>")`

