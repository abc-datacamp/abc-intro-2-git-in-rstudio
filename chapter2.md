---
title       : Version control
description : In this chapter, you'll learn about version control, Git, and how to use Git within RStudio. You'll start with the basics, like how to turn on version control using Git in an existing directory. Then, you'll see how to track changes to files over time, explore your commit history, get rid of unwanted changes, and how to push changes to remote repositories on GitHub.
attachments :




--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:a27237d666
## Introduction to Git

<strong>Follow the directions in the console to open a file containg instructions.</strong>

```Type 'go()' and hit Enter to get started!```

You can use the RStudio platform just like you would on your home computer.

The markdown file contains the instuctions to answer the multiple choice question below.

<strong>Q1. What is Git?</strong>

*** =instructions
- Information manager from hell 
- A particular implementation of version control
- All of the above 
*** =hint
Check out the instructions in the .Rmd file to answer the multiple choice question.

*** =sct
```{r,eval=FALSE}
msg1 <- "Try again."
msg2 <- "Not quite."
msg3 <- "Great work!"
test_mc(3, feedback_msgs = c(msg1, msg2, msg3))
```
*** =attachments
.Rprofile: https://s3.amazonaws.com/assets.datacamp.com/production/course_1156/datasets/lab1_ex1.Rprofile
.init.R: https://s3.amazonaws.com/assets.datacamp.com/production/course_1156/datasets/lab1_ex1.init.R
lab1_ex1.Rmd: https://raw.githubusercontent.com/pzumbo/git/master/datasets/abc_git_ex1.Rmd
lab.css: https://s3.amazonaws.com/assets.datacamp.com/production/course_1156/datasets/lab.css

--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:bda045cc6e
## Reproducibility and version control

Git is a particulary implementation of a version control system.  A version control system which is a software tool which manages and keeps track of changes to source code over time.  Some of its chief benefits include:

- Ability to revert back to older versions of your code
- Ability to view the differences between two versions of your code
- Ability to review the history of your code
- Ability to determine when a bug was introduced
- Ability to experiment with new features without worrying

RStudio implements support for two version control systems: Git and Subversion.  We will focus on Git.

Whenever you want Git to track set of code, you have to create a *repository*.  A repository is simply the place were Git tracks your code over time.
In RStudio, you can easily add a git repository to an existing project.

.Rprofile: https://s3.amazonaws.com/assets.datacamp.com/production/course_1156/datasets/git_setup_.Rprofile


--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:bbca442764
## Version control in RStudio IDE

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






