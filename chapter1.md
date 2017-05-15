---
title       : Introduction to RStudio IDE
description : This chapter introduces you to the RStudio IDE. You'll learn about the data viewer, the environment tab, the history tab, how to set and get your working directory, using the plots pane, navigating the help tab when you get stuck, and more.
attachments :


--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:db01ff97de
## What is RStudio?

RStudio is an integrated development environment (IDE) that consolidates basic developer tools into a single, user-friendly interface. 

The RStudio IDE works alongside the R interpreter, and includes a console for code execution, a file browser, a help window, a package managment system, a dashboard for the work environment, and a text editor for composing code. Built into the IDE are keyboard shortcuts, code completion functionality, syntax-highlighting, as well as support for version control.

Which of the following is *not* a benefit of the RStudio IDE?

*** =instructions
- Integrated user interface
- Contains a text editor
- Code completion
- Helps fix poor coding practies 

*** =sct
```{r,eval=FALSE}
msg1 <- "Try again."
msg2 <- "Not quite."
msg3 <- "Wrong."
msg4 <- "Great work!"
test_mc(4, feedback_msgs = c(msg1, msg2, msg3, msg4))
```

--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:998563e0e4
## Installing RStudio

To use RStudio, you need a copy of the R programming langauge and a copy of the RStudio IDE.

To install the R programming language, vist [cran](https://cran.r-project.org) and click the link that matches your operating system. For Mac users, select 'Download R for Mac', and download the topmost R package (.pkg) file.  Open the file and follow the onscreen instructions.  For Windows, select  'Download R for Windows', then 'base', and finally 'Download R for Windows'.  Open the executable and follow the onscreen instructions.  

Once R is installed, download [RStudio](http://rstudio.com/download). Choose the installer for your system, then click the link to download the installer.  Once you have the installer, installation is easy: on a Mac, open the DMG file and drag RStudio to your Applications folder.

Evaluate the following statement: *RStudio requres the R programming language.*

*** =instructions
- True
- False

*** =sct
```{r,eval=FALSE}
msg1 <- "Great!"
msg2 <- "Not quite."
test_mc(1, feedback_msgs = c(msg1, msg2))
```

--- type:RStudioMultipleChoiceExercise lang:r xp:25 skills:1 key:b1895d66c3
## RStudio panes

The RStudio interface consists of four main panes, or windows.  Briefly,

1. <strong>Bottom left</strong>: console or command window. Here you can type any valid R command after the ```>``` prompt followed by <strong>Enter</strong> and R will execute that command. 
2. <strong>Top left</strong>: text editor or script window. This is where you can save and edit collections of commands.
3. <strong>Top right</strong>: environment & history window.  The environment window contains objects (data, values, functions) R has currently stored in its memory. The history window shows all commands which were executed in the console.
4. <strong>Bottom right</strong>: files, plots, packages, help, & viewer pane. Here you can open files, view plots, install and load packages, read man pages, and view markdown and other documents in the viewer tab.

<center>![panes](https://github.com/abc-datacamp/abc-intro-2-git-in-rstudio/raw/master/attachments/rstudio_panes.png)</center>

The location of these windows can be changed by clicking *Tools* -> *Global Options* -> *Pane Layout*.

Each of these windows will be explored in subsequent sections. 


*** =instructions
- Got it.

*** =sct
```{r}
test_mc(1)
success_msg("Amazing!")
```

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:f7ec10ab53
## The console pane
Just like in R, the RStudio console can execute any valid R command.  

In its most basic form, R can be used as a calculator, and has the following builtin operators:

- Addition: ```+```
- Subtraction: ```-```
- Multiplication: ```*```
- Division: ```/```
- Exponentiation: ```^```
- Modulo: ```%%```
- Square root: ```sqrt()```

<strong>Using the RStudio console just like you would R, evalute the following:</strong>

<table style="font-family:verdana;">
  <tr>
    <td>−368 +
    √<span style="text-decoration:overline">  
    7<span style="font-size: 10px;vertical-align:+40%;">24</span> − 
    4×(368−1024) </span></td>
  </tr>
  <tr>
  </tr>
</table>

*** =pre_exercise_code
```{r}
file.edit("untitled.txt")
```

*** =instructions
- -316.7067
- 18
- 13841286833
- 13841287569

*** =sct
```{r}
test_mc(3)
success_msg("Correct!")
```

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:a57e38df84
## Code completion

RStudio supports automatic completion of code using the <strong>Tab</strong> key. For example, if you have an object named *my.data* in your environment, you can type 'my' and then press <strong>Tab</strong> and RStudio will automatically complete the full name of the object if 'my' is unique; otherwise, RStudio will list all of the objects (or functions) starting with 'my' in your current environment.

Code completion also works for function arguments.  

```write.table()``` is a function which writes a data frame to a file and which takes many arguments.

Type ```write.table(``` in the console, then hit <strong>Tab</strong> to bring up a list of options. RStudio will automatically add a closing parenthesis for you, but your cursor needs to be between the two parentheses for tab completion to work.

Which of the following is *not* an argument to the ```write.table()``` function?

*** =pre_exercise_code
```{r}
file.edit("untitled.txt")
```

*** =instructions
- ```file```
- ```quotes```
- ```sep```
- ```row.names```

*** =sct
```{r}
test_mc(2)
success_msg("Correct! quote is an argument, but quotes (with an s) isn't!")
```

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:38be6745ca
## Retrieving previous commands

It's often the case that you want to re-ececute commands that you previously entered. 
The RStudio console supports the ability to recall previous commands using the arrow keys:

- <strong>Up</strong> — Recall previous command(s)
- <strong>Down</strong> — Reverse of Up

You can even view a ist of your recent commands by pressing Ctrl+Up on Windows or Command+Up on a Mac.

What is the third command starting from the top of the recent commands list?

*** =instructions
- ```plot(sin, -pi, 2*pi)```
- ```9 * 64```
- ```my.data <- data.frame(group=c("A", "B"))```
- ```?attach```
*** =hint
Using Ctrl+Up on Windows or Command+Up on Mac, and count down three from the top; or scroll all the way up with the Up key and count down.

*** =sct
```{r}
test_mc(1)
success_msg("Correct! quote is an argument, but quotes (with an s) isn't!")
```
*** =pre_exercise_code
```{r}
file.edit("untitled.txt")
try(loadhistory(".Rhistory"), silent=T)
```

*** =attachments
.Rhistory: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/fake.Rhistory

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:0427d4efa1
## Command history

Next to the environment tab in the top right window is the history tab, which displays a history of each of the commands run in the console.
The commands are displayed in order (most recent at the bottom).  

Navigate to the history tab.  The meaning of the icons is as follows (keyboard shortcuts are listed in bold):

- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/history_load.png) : load history from a file
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/history_save.png) : save history to a file
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/history_toConsole.png) : send selected command to console (<strong>Enter</strong>)
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/history_toSource.png) : insert selected command into document (<strong>Shift+Enter</strong>)
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/history_clearSelected.png) : remove selected history entry
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/history_clearAll.png) : clear all history entries

Note that there is also a search bar if you have a particular command in mind.

Using the history tab, re-run the fourth to last command executed in the console. What is the output?

*** =instructions
- ```10```
- ```362880```
- ```576```
- ```40320```

*** =sct
```{r}
test_mc(4)
success_msg("Correct!")
```

*** =pre_exercise_code
```{r}
file.edit("untitled.txt")
try(loadhistory(".Rhistory"), silent=T)
```

*** =attachments
.Rhistory: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/fake.Rhistory


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
