---
title       : Preface
description : This is a brief preface, explaining the rationale for using RStudio and git.
attachments :


--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:db01ff97de
## Preface

This course will introduce you to the basics of version controling your scripts using a program called `git`.

Our example scripts will be written in `R`, and to make everyone's life as easy as possible, we will
rely on the vast functionalities of RStudio to both write the code and do the version control.

-----------------------------------------------------------------

**Would you like to start the course?**

*** =instructions
- Yes.
- No.

*** =sct
```{r,eval=FALSE}
msg1 <- "Great! Let's start!"
msg2 <- "Too bad. But can we stay friends?"
test_mc(1, feedback_msgs = c(msg1, msg2))
```
