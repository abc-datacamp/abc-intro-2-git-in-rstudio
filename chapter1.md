---
title       : Introduction to RStudio IDE
description : This chapter introduces you to the RStudio IDE. You'll learn about the data viewer, the environment tab, the history tab, how to set and get your working directory, using the plots pane, navigating the help tab when you get stuck, and more.
attachments :


--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:db01ff97de
## What is RStudio?

RStudio is an IDE that consolidates basic developer tools into a single, user-friendly interface.

<strong>What does IDE stand for?</strong>

*** =instructions
- Intensive Design Environment
- Integrated Document Environment
- Independent Developer Ecosystem
- Integrated Development Environment
*** =hint
Type 'go()' to view instructions in the viewer pane.

*** =sct
```{r,eval=FALSE}
msg1 <- "Try again."
msg2 <- "Not quite."
msg3 <- "Wrong."
msg4 <- "Great work!"
test_mc(4, feedback_msgs = c(msg1, msg2, msg3, msg4))
```

*** =attachments
ch1_1.Rmd: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/ch1.1.Rmd
.Rprofile: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_setup_.Rprofile
standardize.Rproj: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/standardize.Rproj

--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:998563e0e4
## Installing RStudio

In order for you to use the RStudio IDE on your own computer, you will need to install the appropriate items.

Evaluate the following statement.


<strong>RStudio requres the R programming language.</strong>

*** =instructions
- True
- False
*** =hint
Check out the instructions in the viewer pane to answer the multiple choice question.

*** =sct
```{r,eval=FALSE}
msg1 <- "Great!"
msg2 <- "Not quite."
test_mc(1, feedback_msgs = c(msg1, msg2))
```
*** =attachments
ch1_2.Rmd: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/ch1.2.Rmd
.Rprofile: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_setup_.Rprofile
standardize.Rproj: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/standardize.Rproj


--- type:PlainMultipleChoiceExercise lang:r xp:25 skills:1 key:b1895d66c3
## RStudio panes

The RStudio interface consists of four main panes, or windows.  Briefly,

1. Bottom left: console or command window. Here you can type any valid R command after the “>” prompt and R will execute that command. 
2. Top left: text editor or script window. This is where you can save and edit collections of commands.
3. Top right: environment / history window.  The environment window contains data and values R has currently stored in its memory. The history window shows all commands which were executed in the console window.
4. Bottom right: files / plots / packages / help / viewer pane. Here you can open files, view plots (also previous plots), install and load packages, read the help pages, and view markdown and other documents in the viewer tab.

![panes](https://github.com/abc-datacamp/abc-intro-2-git-in-rstudio/raw/master/attachments/rstudio_panes.png)


*** =instructions
- Got it.

*** =sct
```{r}
test_mc(1)
success_msg("Amazing!")
```

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:f7ec10ab53
## The console pane

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:a57e38df84
## Command history

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:f3d61cfed1
## Environment browser

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:6b9f1656bb
## File browser

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:f8ed7d61d0
## The source pane

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:e84d0cdb57
## Loading data

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:793b7d3447
## Executing code

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:54717d0640
## Writing R scripts in the code editor

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:e00f978b7d
## Viewing documentation 

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:c4e0781121
## The view pane 

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:9b69900042
## Summary
