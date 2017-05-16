---
title       : Introduction to RStudio IDE
description : This chapter introduces you to the RStudio IDE. You'll learn about the data viewer, the environment tab, the history tab, how to set and get your working directory, using the plots pane, navigating the help tab when you get stuck, and more.
attachments :


--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:db01ff97de
## What is RStudio?

RStudio is an integrated development environment (IDE) that consolidates basic developer tools into a single, user-friendly interface. 

The RStudio IDE works alongside the R interpreter, and includes a console for code execution, a file browser, a help window, a plot viewer, a dashboard for the work environment, and a text editor for composing code. Built into the IDE are keyboard shortcuts, code completion functionality, syntax highlighting, as well as support for version control.

Which of the following is *not* a benefit of the RStudio IDE?

*** =instructions
- Integrated user interface
- Contains a text editor
- Code completion
- Makes bad code good 

*** =sct
```{r,eval=FALSE}
msg1 <- "Try again."
msg2 <- "Not quite."
msg3 <- "Wrong."
msg4 <- "Correct!"
test_mc(4, feedback_msgs = c(msg1, msg2, msg3, msg4))
```

--- type:RStudioMultipleChoiceExercise lang:r xp:50 skills:1 key:998563e0e4
## Installing RStudio

To use RStudio, you need a copy of the R programming language and a copy of the RStudio IDE.

To install the R programming language, visit [cran](https://cran.r-project.org) and click the link that matches your operating system. For Mac users, select 'Download R for Mac', and download the topmost R package (.pkg) file.  Open the file and follow the onscreen instructions.  For Windows, select  'Download R for Windows', then 'base', and finally 'Download R for Windows'.  Open the executable and follow the onscreen instructions.  

Once R is installed, download [RStudio](http://rstudio.com/download). Choose the installer for your system, then click the link to download the installer.  Once you have the installer, installation is easy: on a Mac, open the DMG file and drag RStudio to your Applications folder.

Evaluate the following statement: *RStudio requires the R programming language.*

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
3. <strong>Top right</strong>: environment & history window.  The environment window contains objects (data, values, functions) R has currently stored in its memory. The history window shows all commands that were executed in the console.
4. <strong>Bottom right</strong>: files, plots, packages, help, & viewer pane. Here you can open files, view plots, install and load packages, read man pages, and view markdown and other documents in the viewer tab.

<center>![panes](https://github.com/abc-datacamp/abc-intro-2-git-in-rstudio/raw/master/attachments/rstudio_allPanes.png)</center>

The location of these windows can be changed by clicking *Tools* -> *Global Options* -> *Pane Layout*.

Each of these windows will be explored in subsequent sections. 

You may have noticed that, by default, there is no text editor window open.  In order to open one, click *File* -> *New File* -> *R Script*.
Alternatively, click the 'Add new document' symbol and select *R Script* <center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/main_newScript.png).</center>

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

In its most basic form, R can be used as a calculator, and has the following built in operators:

- Addition: ```+```
- Subtraction: ```-```
- Multiplication: ```*```
- Division: ```/```
- Exponentiation: ```^```
- Modulo: ```%%```
- Square root: ```sqrt()```

<strong>Using the RStudio console just like you would R, evaluate the following:</strong>

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
- ```sep```
- ```quotes```
- ```row.names```

*** =sct
```{r}
test_mc(3)
success_msg("Correct! quote is an argument, but quotes (with an s) isn't!")
```

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:38be6745ca
## Retrieving previous commands

It's often the case that you want to re-execute commands that you previously entered. 
The RStudio console supports the ability to recall previous commands using the arrow keys:

- <strong>Up</strong> — Recall previous command(s)
- <strong>Down</strong> — Reverse of Up

You can even view a list of your recent commands by pressing Ctrl+Up on Windows or Command+Up on a Mac.

Scroll all the way up to the top of the list.  What is the third command down?

*** =instructions
- ```9 * 64```
- ```plot(sin, -pi, 2*pi)```
- ```my.data <- data.frame(group=c("A", "B"))```
- ```?attach```
*** =hint
Using Ctrl+Up on Windows or Command+Up on Mac, and count down three from the top; or scroll all the way up with the Up key and count down.

*** =sct
```{r}
test_mc(2)
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

The environment tab is in the top right window, which displays the R objects that exist in the global environment.
These are the objects that were created by you in your current session.  

Navigate to the environment tab.  The meaning of the icons is as follows:

- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/environment_load.png) load workspace from a file
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/environment_save.png) save workspace to a file
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/environment_importDataset.png) import a dataset (from CSV, e.g.,)
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/environment_clearAll.png) clear all objects from the workspace
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/environment_selectEnvironment.png) select environment to view (in addition to user created objects, you can also view package specific objects such as functions)

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

- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/history_load.png) load history from a file
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/history_save.png) save history to a file
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/history_toConsole.png) send selected command to console (<strong>Enter</strong>)
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/history_toSource.png) insert selected command into document (<strong>Shift+Enter</strong>)
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/history_clearSelected.png) remove selected history entry
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/history_clearAll.png) clear all history entries

Note that there is also a search bar if you have a particular command in mind.

Using the history tab, re-run the fourth to last command executed in the console. What is the output?

*** =instructions
- ```10```
- ```40320```
- ```362880```
- ```576```

*** =sct
```{r}
test_mc(2)
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
Built into the RStudio IDE is a file browser in the bottom right window. This allows you to navigate your file system without having to leave RStudio.

Navigate to the file browser tab.  The meaning of the icons is as follows:

- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/files_newFolder.png) create a new folder in the current directory
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/files_upload.png) upload a file (note: this option will not exist on local installations of RStudio)
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/files_delete.png) delete the selected files or folders
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/files_rename.png) rename the selected file or folder
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/files_more.png) more options in a dropdown list, including the functions to copy or move a file, as well as set your current working directory.

*Be advised that deleting a file from within the RStudio IDE also deletes it from your local file system, so use with caution!*

Most of the functions are self explanatory, so feel free to explore on your own.  Note that in order to delete, rename, copy, or move a file, you must select the file(s) that you want to operate on by clicking the white box next to it, so that a check appears.

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
The source pane is located in the top left window when a script or document is open.  If you recall from a previous lesson, you can create a new R Script by clicking *File* -> *New File* -> *R Script*, or you can open up a script from the File browser.  Go ahead and open up the file ```script.R``` from the File browser now.

RStudio's source editor supports syntax highlighting, code completion, and find/replace.

There are a lot of options and functions available for editing code in RStudio.  We will only cover a few.

The meaning of the icons is as follows:

- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/source_popOut.png) move source code to new, separate window 
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/source_save.png) save document to disk
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/source_findReplace.png) bring up search / replace toolbar
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/source_codeTools.png) collection of code tools
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/source_run.png) run the current line or selection of lines (Mac: <strong>Command+enter</strong> or Windows:<strong>Control+enter</strong>)
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/source_sourceCode.png) source the complete active text document
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/source_outline.png) show document outline; if you have more than one function in your code, you'll be able to quickly jump around your document

Follow the instructions below.

With the ```script.R``` open, replace *all* the instances of the number 2 with the number 4; and replace *all* the instances of the number 6 with 0 (*hint* -- use the find and replace function!).  Afterward, select *all* three lines of code, and select run (or use the keyboard shortcut).

What is the value of the expression ```(x/y)*1000```?

*** =instructions
- ```10.36973```
- ```9.944371```
- ```10.3504```
- ```9.936494```

*** =sct
```{r}
test_mc(1)
success_msg("Correct!")
```


*** =attachments
script.R: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/sourcePane_script.R


--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:793b7d3447
## Sourcing code

Once again, open up ```script.R``` file from the File browser.  Click the Source icon.

Where did the values of the variables ```x``` and ```y``` go?


*** =instructions
- The R console
- The source pane
- The environment tab
- The file browser

*** =sct
```{r}
test_mc(3)
success_msg("Correct!")
```


*** =attachments
script.R: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/sourcePane_script.R



--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:5f2ea1b3c5
## Tidying up code
Open up ```convertToPercent.R``` file from the File browser.  

Select all of the data, click the *Code Tools* icon, and click *Reformat Code*. What happened?

*** =instructions
- Nothing
- The code was executed
- All the lines were indented
- A tab was inserted before lines 2-4

*** =sct
```{r}
test_mc(4)
success_msg("Correct! RStudio can reformat your code to fit suggested style guidelines and make it easier to read.")
```


*** =attachments
convertToPercent.R: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/convertToPercent.R






--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:d15c60ae7d
## The plots tab

The Plots tab is in the bottom right window. Navigate to it now.

The plots tab allows you view the plots that you have created.  The meaning of its icons is as follows:

- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/plot_previous.png) return to the previous plot
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/plot_next.png) go to the next plot
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/plot_zoom.png) open plot in new, larger window
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/plot_export.png) save current plot as image or PDF
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/plot_delete.png) delete the current plot
- ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/plot_clearAll.png) delete all plots 

One of the great features of RStudio's Plot tab is its ability to keep a history of all the plots you have created, and to jump back and forth between them by using the *Previous* and *Next* button.

Open up the ```plot.R``` file.  Click source.  Hit the *Back* button three times.  Remove that by plot by clicking the *Remove current plot* button.  What type of plot is displayed on the screen?


*** =instructions
- ```Boxplot```
- ```Pie chart```
- ```Dotchart```
- ```Scatterplot```

*** =sct
```{r}
test_mc(1)
success_msg("Correct!")
```


*** =attachments
plots.R: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/plot.R



--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:e00f978b7d
## Viewing documentation 

Another built in feature of RStudio is the ability to view and search documentation for functions.

Just like in the R console, you can pull up documentation using the ```?``` operator within the console.
Alternatively, you can find a *Help* tab in the bottom right window. Navigate to it now.

Type in `barplot` in the search field.  Hit *Enter*.  Read through the help pages.  

What does the `space` argument control of ```barplot``` function control?  


*** =instructions
- ```The amount of space to consume for the title, in pixels ```
- ```The amount of space between characters in axis labels```
- ```The amount of space to use for the right margin of the plot```
- ```The amount of space left before each bar```

*** =sct
```{r}
test_mc(4)
success_msg("Correct!")
```


--- type:RStudioMultipleChoiceExercise lang:r xp:25 skills:1 key:9b69900042
## Summary

That completes your introduction to the RStudio IDE!

Hopefully you have seen how the RStudio is a powerful and friendly user-interface, which conveniently combines many of the tools you'll need to successfully and efficiently create R code in one interface.

Lastly, there is a real great RStudio *cheat sheet* from the developers of RStudio.  You can access it [here](https://www.rstudio.com/wp-content/uploads/2016/01/rstudio-IDE-cheatsheet.pdf).

In the next chapter, we will learn about version control and how it can be used within the RStudio IDE itself.

*** =instructions
- ```Let's get to it!```

*** =sct
```{r}
test_mc(1)
success_msg("Correct!")
```
