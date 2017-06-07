---
title       : Version control
description : In this chapter, you'll learn about version control, Git, and how to use Git within RStudio. You'll start with the basics, like how to turn on version control using Git in an existing directory. Then, you'll see how to track changes to files over time, explore your commit history, get rid of unwanted changes, and how to push changes to remote repositories on GitHub.
attachments :




--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:bbca442764
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
A R project has been created for you.  Find it in the File browser and open it (myProject.Rproj).
To add a Git repository to that project, click *Tools* -> *Project Options* -> *Git/SVN*.  Set the 'Version Control System' to be 'Git'.  Click <strong>Yes</strong> twice. 

Notice that a new file was created in your project directory called ```.gitignore```.  Open that file.  How many lines of text does it contain (including new or empty lines)?


*** =instructions
- ```2```
- ```3```
- ```4```
- ```5```

*** =sct
```{r}
test_mc(4)
success_msg("Correct! the .gitignore file tells Git which files to ignore, since you generally don't want to track unimportant stuff, like your R history.")
```

*** =attachments
.Rprofile: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_setup_.Rprofile
myProject/myProject.Rproj: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/myProject.Rproj

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:b8a90154e0
## Tracking files
RStudio provides an interface to the most common version control operations, including adding and committing files.
The act of adding a file tells Git to start tracking the file.  The act of commiting a file or a change to a file tells Git that you want to save and record those changes to your Git repository. These two actions (adding & commiting) typically go hand-in-hand. 

<strong>Note: only changes which are commited are able to be reverted back to in the future</strong>.  Accordingly, it is often good practice to commit early and to commit often.

Go ahead and open up the ```myProject.Rproj``` RStudio project in the ```myProject``` directory.  
There's also a script called ```myFunctions.R``` in the directory.  If you open it, you'll see that it contains our ```convertToPercent``` function.
We are going to tell Git to track this file now, and we are going to commit it to our respository.

You may have noticed a new Git tab in the upper right window, next to the History tab.  Navigate to that tab now.  You'll see something like this:

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_untracked.png)</center>

The question marks ```??```  next to the ```myFunctions.R``` script indicate that the file is not currently being tracked by Git.  If you click the box next to the functions file, so that there is a checkbox there, you'll see that the status changes from a question mark to an ```A```, indicating that the file has been added to Git.  Next we are going to commit the file, so that we maintain a history of our script.  Click the <strong>Commit</strong> button.  A new window will pop up:

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_commitWindow.png)</center>

Note that you <strong>must</strong> enter a commit message before clicking <strong>Commit</strong>.  Commit messages should be informative and terse.   Enter a commit message (something like, 'Created convert to percent function') and click </strong>Commit</strong>.   

After clicking </strong>Commit</strong>, a message pops up.  What does it say?

*** =instructions
- ```1 file changed, 6 insertions(+)```
- ```1 file deleted```
- ```2 files changed, 6 insertions(+)```
- ```2 files created in create mode```

*** =sct
```{r}
test_mc(1)
success_msg("Correct!")
```

*** =attachments
.Rprofile: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_setup_.Rprofile
myProject/myFunctions.R: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/convertToPercent.R
myProject/myProject.Rproj: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/myProject.Rproj
myProject/.gitignore: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/gitignore

myProject/.git/info/exclude: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/info/exclude

myProject/.git/branches:  https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/info/branches/

myProject/.git/objects/44/afbfe849dd9cab8d5c512b9f2dd98c8f14b00e : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/objects/44/afbfe849dd9cab8d5c512b9f2dd98c8f14b00e
myProject/.git/objects/ba/cc97d791c146a015d83e54d6f93dee7e1e0b36 : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/objects/ba/cc97d791c146a015d83e54d6f93dee7e1e0b36
myProject/.git/objects/info/ : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/objects/info/
myProject/.git/objects/pack/ : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/objects/pack/

myProject/.git/refs/heads/ : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/refs/heads/
myProject/.git/refs/tags/ : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/refs/tags/


myProject/.git/hooks/applypatch-msg.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/applypatch-msg.sample
myProject/.git/hooks/commit-msg.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/commit-msg.sample
myProject/.git/hooks/post-update.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/post-update.sample
myProject/.git/hooks/pre-applypatch.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/pre-applypatch.sample
myProject/.git/hooks/pre-commit.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/pre-commit.sample
myProject/.git/hooks/pre-push.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/pre-push.sample
myProject/.git/hooks/pre-rebase.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/pre-rebase.sample
myProject/.git/hooks/pre-receive.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/pre-receive.sample
myProject/.git/hooks/prepare-commit-msg.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/prepare-commit-msg.sample
myProject/.git/hooks/update.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/update.sample

myProject/.git/index: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/index
myProject/.git/config: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/config
myProject/.git/HEAD: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/HEAD
myProject/.git/description: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/description


--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:cdf20e6403
## Viewing changes made to a tracked file
Git allows you to view changes made to a file that was already previously commited, and the RStudio IDE supports this function.

Open up the ```myProject.Rproj``` RStudio project again.  Open the ```myFunctions.R``` script.  Delete line 3 (the line that appends a percent sign to the output).  Save the script (File -> Save ; or Cmd+S on Mac, or Control+S on a PC).  

Navigate to the Git tab in the upper right window. You'll notice that our script is now marked with an  ```M```, which stands for 'Modified'.
Click the <strong>Diff</strong> button. A new window will open.  This is going to show us how our current version of our ```myFunctions.R``` script differs from the previously commited version.

You'll see something like this:

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_diffWindow.png)</center>

Lines highlighted in red indicate the original line which has since changed (in this case, deleted).  If a line were added or modified, you would see a green highlight.
There are two columns of numbers.  The first column indicates the original line numbers, and the second column indicates the new line numbers.
You'll notice that previously, the line that appended a percent sign to the output was on line 3 and the ```return``` function was on line 4.  But now that the line that appended a percent sign to the output has been deleted, the ```return``` function is on line 3.
Head back to the script.  Set the second line to print out two digits:

```percent <- round(x * 100, digits = 2)```

Save the file, and click the <strong>Diff</strong> again.  How many lines are red and how many lines are green?

*** =instructions
- ```1 red, 1 green```
- ```1 red, 2 green```
- ```2 red, 1 green```
- ```2 red, 2 green```

*** =sct
```{r}
test_mc(3)
success_msg("Correct! Note that if you wanted this change to be recorded by Git, you'd have to remember to commit it! Saving a file is not the same as commiting.")
```

*** =attachments
.Rprofile: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_setup_.Rprofile
myProject/myFunctions.R: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/convertToPercent_gitDiff.R
myProject/myProject.Rproj: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/myProject.Rproj
myProject/.gitignore: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/gitignore

myProject/.git/info/exclude: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/info/exclude

myProject/.git/branches:  https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/info/branches/

myProject/.git/objects/44/afbfe849dd9cab8d5c512b9f2dd98c8f14b00e : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/objects/44/afbfe849dd9cab8d5c512b9f2dd98c8f14b00e
myProject/.git/objects/ba/cc97d791c146a015d83e54d6f93dee7e1e0b36 : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/objects/ba/cc97d791c146a015d83e54d6f93dee7e1e0b36
myProject/.git/objects/info/ : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/objects/info/
myProject/.git/objects/pack/ : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/objects/pack/

myProject/.git/refs/heads/ : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/refs/heads/
myProject/.git/refs/tags/ : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/refs/tags/


myProject/.git/hooks/applypatch-msg.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/applypatch-msg.sample
myProject/.git/hooks/commit-msg.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/commit-msg.sample
myProject/.git/hooks/post-update.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/post-update.sample
myProject/.git/hooks/pre-applypatch.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/pre-applypatch.sample
myProject/.git/hooks/pre-commit.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/pre-commit.sample
myProject/.git/hooks/pre-push.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/pre-push.sample
myProject/.git/hooks/pre-rebase.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/pre-rebase.sample
myProject/.git/hooks/pre-receive.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/pre-receive.sample
myProject/.git/hooks/prepare-commit-msg.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/prepare-commit-msg.sample
myProject/.git/hooks/update.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/update.sample

myProject/.git/config: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/config
myProject/.git/HEAD: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/HEAD
myProject/.git/description: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/description



myProject/.git/COMMIT_EDITMSG : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_diff/COMMIT_EDITMSG
myProject/.git/index : https://github.com/abc-datacamp/abc-intro-2-git-in-rstudio/raw/master/attachments/git_diff/index
myProject/.git/logs/refs/heads/master : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_diff/logs/refs/heads/master
myProject/.git/logs/HEAD : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_diff/logs/HEAD

myProject/.git/objects/05/1a9138baaf49966861223065994987630d528d : https://github.com/abc-datacamp/abc-intro-2-git-in-rstudio/raw/master/attachments/git_diff/objects/05/1a9138baaf49966861223065994987630d528d
myProject/.git/objects/22/8a11a8c3d8665d8cc80adc9d3785e95853722a : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_diff/objects/22/8a11a8c3d8665d8cc80adc9d3785e95853722a
myProject/.git/objects/9a/8f1e69289df78448441225816b295767ce3494 : https://github.com/abc-datacamp/abc-intro-2-git-in-rstudio/raw/master/attachments/git_diff/objects/9a/8f1e69289df78448441225816b295767ce3494
myProject/.git/refs/heads/master : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_diff/refs/heads/master


--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:e288a58454
## Undo changes: revert

Git allows you to easily undo changes to a file that you have yet to commit, so there's no worry about having lost your original, working piece of code.

Open up the ```myProject.Rproj``` RStudio project and the ```myFunctions.R``` script.  

Delete the second line from the script and <strong>save</strong> the file.  Deleting the second line breaks the function (you can test this for yourself, if you'd like). To revert back to the most recently commited version of the script, you can use the built in revert command.  Click the <strong>Diff</strong> button in the Git tab.  You'll notice on the top of the window that opens that there is a <strong>Revert</strong> button:

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_revert.png)</center>

Click the <strong>Revert</strong> button, and then click  <strong>Yes</strong>.  The script is now restored to the previously commited version.

Note that where Git revert differs between a simple system wide undo (Edit -> Undo) is that you can even close RStudio, thereby removing your system's clipboard history for RStudio from memory, and still be able to revert back to the previously commited file.  This is because Git actually stores and tracks changes to your file on disk. 

You can also discard certain lines of an edited file, in the event that you'd like only certain areas of the script to revert back to the previously commited ones.  Go ahead an append a new function, ```sumOfSquares``` to the end of the ```myFunctions.R``` script:

```
sumOfSquares <- function(x,y) {
  x^2 + y^2
}
```

Once again delete line 2.  Save the script.  Click <strong>Diff</strong>.  You should see something like this in the pop-up window:

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_discardLine.png)</center>

If we wanted to bring back line 2, but retain the new ```sumOfSquares``` function, you can click on line 2, and you'll see a <strong>Discard line</strong> button.  Click it and verify that line 2 is back.

What happens if you click  <strong>Discard chunk</strong>?

*** =instructions
- ```Line 2 is deleted again```
- ```The convert to percent function is removed```
- ```The sum of squares function is removed```
- ```The whole script is deleted```

*** =sct
```{r}
test_mc(3)
success_msg("Correct!")
```

*** =attachments
.Rprofile: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_setup_.Rprofile
myProject/myFunctions.R: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/convertToPercent_gitDiff.R
myProject/myProject.Rproj: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/myProject.Rproj
myProject/.gitignore: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/gitignore

myProject/.git/info/exclude: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/info/exclude

myProject/.git/branches:  https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/info/branches/

myProject/.git/objects/44/afbfe849dd9cab8d5c512b9f2dd98c8f14b00e : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/objects/44/afbfe849dd9cab8d5c512b9f2dd98c8f14b00e
myProject/.git/objects/ba/cc97d791c146a015d83e54d6f93dee7e1e0b36 : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/objects/ba/cc97d791c146a015d83e54d6f93dee7e1e0b36
myProject/.git/objects/info/ : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/objects/info/
myProject/.git/objects/pack/ : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/objects/pack/

myProject/.git/refs/heads/ : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/refs/heads/
myProject/.git/refs/tags/ : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/refs/tags/


myProject/.git/hooks/applypatch-msg.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/applypatch-msg.sample
myProject/.git/hooks/commit-msg.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/commit-msg.sample
myProject/.git/hooks/post-update.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/post-update.sample
myProject/.git/hooks/pre-applypatch.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/pre-applypatch.sample
myProject/.git/hooks/pre-commit.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/pre-commit.sample
myProject/.git/hooks/pre-push.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/pre-push.sample
myProject/.git/hooks/pre-rebase.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/pre-rebase.sample
myProject/.git/hooks/pre-receive.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/pre-receive.sample
myProject/.git/hooks/prepare-commit-msg.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/prepare-commit-msg.sample
myProject/.git/hooks/update.sample : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/hooks/update.sample

myProject/.git/config: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/config
myProject/.git/HEAD: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/HEAD
myProject/.git/description: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git/description



myProject/.git/COMMIT_EDITMSG : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_diff/COMMIT_EDITMSG
myProject/.git/index : https://github.com/abc-datacamp/abc-intro-2-git-in-rstudio/raw/master/attachments/git_diff/index
myProject/.git/logs/refs/heads/master : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_diff/logs/refs/heads/master
myProject/.git/logs/HEAD : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_diff/logs/HEAD

myProject/.git/objects/05/1a9138baaf49966861223065994987630d528d : https://github.com/abc-datacamp/abc-intro-2-git-in-rstudio/raw/master/attachments/git_diff/objects/05/1a9138baaf49966861223065994987630d528d
myProject/.git/objects/22/8a11a8c3d8665d8cc80adc9d3785e95853722a : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_diff/objects/22/8a11a8c3d8665d8cc80adc9d3785e95853722a
myProject/.git/objects/9a/8f1e69289df78448441225816b295767ce3494 : https://github.com/abc-datacamp/abc-intro-2-git-in-rstudio/raw/master/attachments/git_diff/objects/9a/8f1e69289df78448441225816b295767ce3494
myProject/.git/refs/heads/master : https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_diff/refs/heads/master

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:b4ac698014
## Commit history

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:e83a93f2a8
## Undo commited changes: checkout


--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:9c1c3faf15
## Introduction to GitHub

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:f6812b14bb
## Cloning existing repos

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:adbd3f800d
## Pulling & pushing

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:5705dfbac5
## Working with branches

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:211e19754b
## Summary






