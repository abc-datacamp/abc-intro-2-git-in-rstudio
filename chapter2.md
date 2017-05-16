---
title       : Version control
description : In this chapter, you'll learn about version control, Git, and how to use Git within RStudio. You'll start with the basics, like how to turn on version control using Git in an existing directory. Then, you'll see how to track changes to files over time, explore your commit history, get rid of unwanted changes, and how to push changes to remote repositories on GitHub.
attachments :




--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:bbca442764
## Version control in RStudio IDE

Git is a particular implementation of a version control system.  A version control system is a software tool which manages and keeps track of changes to source code over time.  Some of its chief benefits include:

- Ability to revert back to older versions of your code
- Ability to view the differences between two versions of your code
- Ability to review the history of your code
- Ability to determine when a bug was introduced
- Ability to experiment with new features without worrying

RStudio implements support for two version control systems: Git and Subversion.  We will focus on Git.

Whenever you want Git to track set of code, you have to create a *repository*.  A repository is simply the place were Git tracks your code over time.
In RStudio, you can easily add a git repository to an existing project.
A R project has been created for you.  Find it in the File browser and open it.
To add a Git repository to that project, click *Tools* -> *Project Options* -> *Git/SVN*.  Set the 'Version Control System' to be 'Git'.  Click <strong>Yes</strong> twice. 

Notice that a new file was created in your project directory called ```.gitignore```.  Open that file.  How many lines of text does it contain?


*** =instructions
- ```3```
- ```2```
- ```4```
- ```5```

*** =sct
```{r}
test_mc(4)
success_msg("Correct! the .gitignore file tells Git which files to ignore, since you generally don't want to track unimportant stuff, like your R history.")
```

*** =attachments
.Rprofile: https://s3.amazonaws.com/assets.datacamp.com/production/course_1156/datasets/git_setup_.Rprofile
myProject/myProject.Rproj: https://s3.amazonaws.com/assets.datacamp.com/production/course_1156/datasets/myProject.Rproj


--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:bf83f3a9b7
## Initializing Git

--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:b8a90154e0
## Commiting changes


--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:ad6cfbfcca
## Git icons in RStudio

--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:cdf20e6403
## Commit history

--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:d8ce20fc5c
## Using checkout

--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:e83a93f2a8
## Undo commited changes: checkout


--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:941c11c480
## Undo changes

--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:9c1c3faf15
## Introduction to GitHub

--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:f6812b14bb
## Cloning exists repos

--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:adbd3f800d
## Pulling & pushing

--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:5705dfbac5
## Working with branches

--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:211e19754b
## Summary






