### Criteria:

• Style, quality and maintainability of the code

• Code Architecture

• Tests

• Development process

• Prepared setup

### Challenge:

At DataGuard, every Friday the employees are grouped to have lunch together in order to get to know each other better.

The DG team has grown a lot in the past months, so it is hard to follow-up with groups, restaurants, etc.

For this reason, we would like you to create a Rails application where we can automate the generation of the groups.

Each group should have a leader that will choose a restaurant. We would like to avoid having same leaders each week.

The groups should be of equal size (+/- 1 person) and employees of the same unit (e.g. HR, IT)
should be spread as much as possible in the different groups.

Every week, new groups are supposed to be different than in the previous weeks.
The app should ask all DG employees if they want to go out for lunch. After collecting responses,
the groups and leaders should be generated and notified.

The leaders can choose a restaurant and share it with their group.

• You can choose a way of asking/notifying users;

• Try to follow all the steps as much as you can, but if you are not able to finish something,
or do not know how, do not worry. We would appreciate explanation of the issue.

• Be creative! If you can add some easy feature that might help us, feel free to add it and write a short explanation.

Set up a private Git repository, git bundle it and share it with us in a zip file.

Expectations:

### Minimum Expectations:

• 4 models (Employees, Teams, MappingEmployeeTeams (join table), BlindDates to store the output for each week)

• 1 BlindDates controller & 1 BlindDates helper

• 2 routes (“get” to display the index of employees and maybe last week’s blind dates, “post” to generate the new blinddates)

• 1view

• Seeds to generate the employees, the teams and their mapping

• Foreign keys

• Code styling (naming conventions, indentation...)

### Bonus:

• Implement functionality to add employees or assign them to a new team

• Validations (Two employees can’t be mapped twice to the same team, BlindDates can’t output twice the same list..)

### Scoring Criteria:

• Specs

• Gems used

• Style

• Architecture

• Validation

• OO Principles
