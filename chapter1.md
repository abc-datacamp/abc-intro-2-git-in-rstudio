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

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:b1895d66c3
## RStudio panes

The RStudio interface consists of four main panes, or windows.  Briefly,

1. <strong>Bottom left</strong>: console or command window. Here you can type any valid R command after the ```>``` prompt followed by <strong>Enter</strong> and R will execute that command. 
2. <strong>Top left</strong>: text editor or script window. This is where you can save and edit collections of commands.
3. <strong>Top right</strong>: environment & history window.  The environment window contains objects (data, values, functions) R has currently stored in its memory. The history window shows all commands which were executed in the console.
4. <strong>Bottom right</strong>: files, plots, packages, help, & viewer pane. Here you can open files, view plots, install and load packages, read man pages, and view markdown and other documents in the viewer tab.

<center>![panes](https://github.com/abc-datacamp/abc-intro-2-git-in-rstudio/raw/master/attachments/rstudio_allPanes.png)</center>

The location of these windows can be changed by clicking *Tools* -> *Global Options* -> *Pane Layout*.

Each of these windows will be explored in subsequent sections. 

You may have noticed that, by default, there is no text editor window open.  In order to open one, click *File* -> *New File* -> *R Script*.
Alteratively, click the 'Add new document' symbol and select *R Script* <center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/main_newScript.png).</center>

What title does RStudio give the new blank document?

*** =instructions
- Untitled
- Untitled.txt
- Untitled1
- Untitled.txt

*** =sct
```{r}
test_mc(3)
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

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:f3d61cfed1
## Environment browser

The environment tab is in the top right window, which displays the R objects that exist in the global environemnt.
These are the objects that were created by you in your current session.  

Navigate to the environment tab.  The meaning of the icons is as follows:

- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/environment_load.png) : load workspace from a file
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/environment_save.png) : save workspace to a file
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/environment_importDataset.png) : import a dataset (from CSV, e.g.,)
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/environment_clearAll.png) : clear all objects from the workspace
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/environment_selectEnvironment.png) : select environment to view (in addition to user created objects, you can also view package specific objects such as functions)

There is also a search bar if you'd like to search for a particular object.

Note that one can also accomplish importing a dataset via the R console (using the ```read.csv()``` function, e.g.).

Using the ``read.csv()``` function, read in the 'addresses.csv' file by typing the following into the console: 

```addresses <- read.csv("addresses.csv")```  

Notice that the 'addresses' object now appears in your environment window.  If you click the ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/environment_arrow.png) symbol next to the 'addresses' object, you can see the structure of the object:

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/environment_str.png)</center>

You can also click the view icon ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/environment_view.png).

Go ahead and click the view icon. What is the third address in the data frame?

*** =instructions
- ```120 Jefferson St.```
- ```220 hobo Av.```
- ```7452 Terrace "At the Plaza" road```
- ```9th, at Terrace plc```

*** =sct
```{r}
test_mc(1)
success_msg("Correct!")
```

*** =attachments
addresses.csv: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/addresses.csv


--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:0427d4efa1
## The history tab

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

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:6b9f1656bb
## File browser
Built into the RStudio IDE is a file browser in the bottom right window. This allows you to navigate your filesystem without having to leave RStudio.

Navigate to the file browser tab.  The meaning of the icons is as follows:

- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/files_newFolder.png) : create a new folder in the current directory
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/files_upload.png) : upload a file (note: this option will not exist on local installations of RStudio)
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/files_delete.png) : delete the selected files or folders
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/files_rename.png) : rename the selected file or folder
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/files_more.png) : more options in a dropdown list, including the functions to copy or move a file, as well as set your current working directory.

*Be advised that deleting a file from within the RStudio IDE also deletes it from your local filesystem, so use with caution!*

Most of the functions are self explantory, so feel free to explore on your own.  Note that in order to delete, rename, copy, or move a file, you must select the file(s) that you want to operate on by clicking the white box next to it, so that a check appears.

Navigate to the ```data/addresses/current``` folder (if you deleted it while exploring, simply re-create it!).  Select the *More* icon, and click 'Set as Working Directory'. What command was printed to the console?


*** =instructions
- ```setwd("~/data/addresses")```
- ```setwd("~/data```
- ```setwd("~/data/addresses/current")```
- ```setwd("~/```

*** =sct
```{r}
test_mc(3)
success_msg("Correct!")
```


*** =attachments
fakeFile1.csv: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/addresses.csv
fakeFile2.csv: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/addresses.csv
fakeFile3.csv: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/addresses.csv
data/addresses/current/addresses.csv: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/addresses.csv


--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:f8ed7d61d0
## The source pane
The source pane is located in the top left window when a script or document is open.  If you recall from a previous lesson, you can create a new R Script by clicking *File* -> *New File* -> *R Script*.  Go ahead and do so.

RStudio's source editor includes syntax highlighting, code completion, and find/replace.

There are a lot of options and functions available for editing code in RStudio.  We will only cover a few.

The meaning of the icons is as follows:




*** =instructions
- ```setwd("~/data/addresses")```
- ```setwd("~/data```
- ```setwd("~/data/addresses/current")```
- ```setwd("~/```

*** =sct
```{r}
test_mc(3)
success_msg("Correct!")
```


*** =attachments
fakeFile1.csv: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/addresses.csv


--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:793b7d3447
## Executing code












--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:d15c60ae7d
## The plots tab


*** =pre_exercise_code
```{r}
attach(mtcars)
dotchart(mtcars$mpg,labels=row.names(mtcars),cex=.7,
  	main="Gas Milage for Car Models", 
   xlab="Miles Per Gallon")

counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and VS",
  xlab="Number of Gears", col=c("darkblue","red"),
 	legend = rownames(counts))

slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls, main="Pie Chart of Countries")

boxplot(len~supp*dose, data=ToothGrowth, notch=FALSE, 
  col=(c("gold","darkgreen")),
  main="Tooth Growth", xlab="Suppliment and Dose")


plot(wt, mpg, main="Scatterplot", 
  	xlab="Car Weight ", ylab="Miles Per Gallon ", pch=19)
  	
hist(mtcars$mpg, breaks=12, col="red")

```


*** =instructions
- ```setwd("~/data/addresses")```
- ```setwd("~/data```
- ```setwd("~/data/addresses/current")```
- ```setwd("~/```

*** =sct
```{r}
test_mc(3)
success_msg("Correct!")
```


*** =attachments
fakeFile1.csv: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/addresses.csv










--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:e00f978b7d
## Viewing documentation 

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:c4e0781121
## The viewer tab 

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:9b69900042
## Summary
