---
title       : Version control using Git
description : In this chapter, you'll learn about version control, Git, and how to use Git within RStudio. You'll start with the basics, like how to turn on version control using Git in an existing directory. Then, you'll see how to track changes to files over time, explore your commit history, get rid of unwanted changes, and how to push changes to remote repositories on GitHub.
attachments :





--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:bbca442764
## Benefits of version control

If you ever used `Save as` in order to save a new version of a file while keeping a record of the previous one, you have made use of a basic version control system!

![](http://s3.amazonaws.com/assets.datacamp.com/production/course_3710/datasets/phd101212s.gif)

Version control systems allow you to never having to worry about stacking up piles of files with increasingly cryptic names.
Version control systems encompass software tools which keep track of changes to files over time.
Git is a particular implementation of a version control system (there are more, such as, for example, SNV).

Typical file types that are being maintained are text files, such as source code, but in principle, other file types can be handled, too.
For a start, you can think of Git as a sophisticated, **digital log book** where every change to a file is recorded, so that at any given point in time you can always go back to a certain file version (or even restore entire folders).

Some of the chief benefits of version control include:

- Ability to **view the differences** between two versions of your code.
- Ability to **revert back** to older versions of your code.
- Ability to **review the history** of your code.
- Ability to **determine when a bug** was introduced.
- Ability to **experiment with new features** without worrying about losing functioning code.
- Ability to **track the ownership** of files and changes applied to them.

There are many more advantages to using a real version control system such as git, e.g., the ability to describe why specific changes were necessary and the ability to even classify and tag different types of changes.

---------------------------------------------

*** =instructions
- 2
- 3
- 4
- 5

*** =sct
```{r}
test_mc(4)
success_msg("Correct! the .gitignore file tells Git which files to ignore, since you generally don't want to track unimportant stuff, like your R history.")
```

*** =attachments
.Rprofile: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_setup_.Rprofile


--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:72082e6996
## Creating a Git repository in RStudio

RStudio implements support for two version control systems: Git and Subversion; we will focus on teaching you Git.

Whenever you want Git to track your scripts, your very first step will be to create a *repository*.
A repository is the place where Git stores both the files its supposed to keep track of and the actual history of the changes made to those files.
Think of it as a specialized type of file folder where Git stores some metadata in addition to the files that you're working on.

In RStudio, you can easily link a Git repository to an existing R project.

-------------------------------

An R project has been created for you.
Find it in the File browser and open it (`myProject.Rproj`).
To add a Git repository to that project, follow these steps:

1. click *Tools* -> *Project Options* -> *Git/SVN*
2. Set the 'Version Control System' to be 'Git'.
3. Click <strong>Yes</strong> twice. 

Notice that a new file was created in your project directory called `.gitignore`.
Open that file.

------------------------------

**How many lines of text does the .gitignore file contain (including new or empty lines)?**


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
The act of adding a file tells Git to start tracking the file.  The act of committing a file or a change to a file tells Git that you want to save and record those changes to your Git repository. These two actions (adding & committing) typically go hand-in-hand.  Because only changes which are committed are able to be reverted back to in the future, it is often good practice to commit early and to commit often.

Go ahead and open up the RStudio project in the project directory.  There's also a script called ```myFunctions.R``` in the directory.  If you open it, you'll see that it contains a *convertToPercent* function.  We are going to tell Git to track this file now, and we are going to commit it to our respository.

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
Git allows you to view changes made to a file that was previously committed, and the RStudio IDE supports this function.

Open up the RStudio project again.  Open the ```myFunctions.R``` script.  Delete line 3 (the line that appends a percent sign to the output).  Save the script (*File* -> *Save*).  

Navigate to the Git tab in the upper right window. You'll notice that our script is now marked with an  ```M```, which stands for 'Modified'.
Click the <strong>Diff</strong> button. A new window will open.  This is going to show us how our current version of our ```myFunctions.R``` script differs from the previously committed version.

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
success_msg("Correct! Note that if you wanted this change to be recorded by Git, you'd have to remember to commit it! Saving a file is not the same as committing.")
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

Open up the RStudio project and our functions script.  

Delete the second line from the script and <strong>save</strong> the file.  Deleting the second line breaks the function (you can test this for yourself, if you'd like). To revert back to the most recently committed version of the script, you can use the built in revert command.  Click the <strong>Diff</strong> button in the Git tab.  You'll notice on the top of the window that opens that there is a <strong>Revert</strong> button:

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_revert.png)</center>

Click the <strong>Revert</strong> button, and then click  <strong>Yes</strong>.  The script is now restored to the previously committed version.

Note that where Git revert differs between a simple system wide undo (*Edit* -> *Undo*) is that you can even close RStudio, thereby removing your system's clipboard history for RStudio from memory, and still be able to revert back to the previously committed file.  This is because Git actually stores and tracks changes to your file on disk. 

You can also discard certain lines of an edited file, in the event that you'd like only certain areas of the script to revert back to the previously committed ones.  Go ahead an append a new function, ```sumOfSquares``` to the end of the ```myFunctions.R``` script:

```
sumOfSquares <- function(x,y) {
  x^2 + y^2
}
```

Once again delete line 2.  Save the script.  Click <strong>Diff</strong>.  You should see something like this in the pop-up window:

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_discardLine.png)</center>

If we wanted to bring back line 2, but retain the new ```sumOfSquares``` function, you can click on line 2, and you'll see a <strong>Discard line</strong> button.  Click it and verify that line 2 is back.

What happens if you click <strong>Discard chunk</strong>?

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
Git stores the complete history of all of your commits, and this history is viewable via the RStudio IDE.

Open up the RStudio project and the ```myFunctions.R``` script.  This time we are going to add and commit the ```sumOfSquares``` function.

Once again, append the ```sumOfSquares``` function to the end of the ```myFunctions.R``` script:

```
sumOfSquares <- function(x,y) {
  x^2 + y^2
}
```

Save the file, then commit it.  Remember, to commit a file, you have to:

1. Save the file
2. Navigate to the Git tab in the upper right hand corner of RStudio
3. Click the box next to the file that you want to commit
4. Click the <strong>Commit</strong> button
5. Enter an informative commit message (e.g., 'Added new sum of squares function')
6. Click the <strong>Commit</strong> button.

You can now view the history of your file by clicking <strong>History</strong> in the commit popup window, or by clicking the history icon ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/git_history.png) in the Git tab.  Click the history tab now.  You will see something like this:

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_commitHistory.png)</center>


which is a log of the history of your file and its changes.  
The history window is divided into two parts. The top half of lists each commit, and you may notice that each commit is linked with a unique identifer (called an ```SHA``` key).  The SHA key is important if you want to roll back to a previous commit. The bottom half of the window displays additional information for each commit, including what changes were made during that commmit. There is also a ```View file @``` link, which shows you how the current file looked at that particular commit. Click on the very first commit ('Created convert to percent function').  Click ```View file```.  What does the file contain?


*** =instructions
- ```Just the convertToPercent function```
- ```The convertToPercent and the sumOfSquares function ```
- ```Just the sumOfSquares function```
- ```Neither the sumOfSquares nor the convertToPercent function```

*** =sct
```{r}
test_mc(1)
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


--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:e83a93f2a8
## Undo committed changes: checkout
Previously, we discussed how you can undo changes that weren't already committed.  However, sometimes you commit a change, and only realize later that you'd prefer to roll back.  Although there is no way to do this via the RStudio user interface, it is easily accomplished using RStudio's console. In general, in order to copy a version of a file from the past back into the present, use following command:

```system("git checkout <SHA> <filename>"```

Once again, open up the RStudio project  along with the ```myFunctions.R``` script.   Change line two to print more than 1 digit, i.e.,

```percent <- round(x * 100, digits = 2)```

Save and commit the file with an informative commit message ('Changed number of output digits from 1 to 2').  Open up the Git history.  You should see two commits:  the most recent commit (where ```digits = 2```), and the first commit (where ```digits = 1```).   Determine the SHA key of the first commit (where ```digits = 1```).  

In the RStudio console, type the following and hit Enter:

```system("git checkout <SHA> myFunctions.R")```

where ```<SHA>``` is the actual SHA number without any angle brackets ```<``` or ```>```.

You'll notice that your script will immediate revert back to the first commit (when ```digits = 1```).  Note that in order to record this change, you'll need to remember to save the file and commit along with an informative commit message ('Reverted back to outputting one 1 instead of 2').

Navigate to the Git tab.  What is the status of the ```myFunctions.R``` file?


*** =instructions
- ```Checkmark in the staged column```
- ```Status changed to ?```
- ```Status changed to M```
- ```Both checkmark in staged column and M status```

*** =sct
```{r}
test_mc(4)
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


--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:9c1c3faf15
## Creating a GitHub repo
Up until now, we've learned how to use a *local* Git respository in RStudio. However, if you wanted to work on one and the same code set on more than one computer, you'll need something more than a local Git respository.  

GitHub is a free, online hosting service for Git repositories. It's chief advantage is that it lets you (and others!) work on projects from anywhere.  Fortunately, RStudio supports direct integration with GitHub. In order to start using GitHub, you first have to register.
Head over to github.com.  On the main page, you'll see a form to create a new user account.  Do so now.

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/github_register1.png)</center>


After entering a username, email address, and password, you'll be prompted to select a plan.   Select 'Unlimited public repositories for free.' and click <strong>Continue</strong>

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/github_register2.png)</center>


In the next screen, you'll be asked a series of questions:

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/github_register3.png)</center>


Feel free to select <strong>skip this step</strong> at the bottom of the screen. 


Now that you are registed with GitHub, you are free to create a GitHub repository.  You must verify the email address you used to register your account before doing so, however.  After you verify, head back to github.com.  To create a repo, following the instructions below:

1. In the upper-right corner of any page, click <strong>+</strong>, and then click <strong>New repository</strong>.
2. Name your repository.  This name should reflect the underlying code that you'll be storing in it. You can name it "hello-world" for our purpose.
3. Optionally, enter a description of your repository. 
4. Choose between creating a public or private repository.  Private repositories require a paid account, so choose public for now.  Note that public respositories mean that anybody can see your code, so bear this in mind in you're trying to keep code under wraps.
5. Check the box to create a README when the repository is created, which will allow immediate clone the repository to your computer.

Your form should look something like this:

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/github_createRepo.png)</center>

Now click <strong>Create repository</strong>, and you'll immediately be taken to your new reposistory.
Open up the ``` README.md``` file in your repository.  What does it contain?

*** =instructions
- Nothing
- 'README'
- 'hello-world'
- 'enter readme contents here'
*** =sct
```{r}
test_mc(3)
success_msg("Correct!")
```

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:f6812b14bb
## Cloning existing repos
Now that you've created a repository in GitHub, you have to import it into RStudio.

First, you have to obtain the web URL of your respository from Github.  To do this, header over to github.com now, and login with your username and password.
After logging in, you should see your repository on the login page.  

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/github_repoListing.png)</center>


If you can't find your repository on the main page after logging in, you can click the icon next to the  <strong>+</strong> sign in the upper-right corner of the page, select *Your Profile -> Repositories*.  Here, you'll see your *hello-word* repository.  Click it now.

You'll notice a green <strong>Clone or download</strong> button.  Click it, and you'll find your web URL.    Copy the complete web URL to your clipboard (you can use the little clipboard icon next to it, if you desire).

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/github_clone.png)</center>

Now, within the RStudio IDE, click *File -> New Project -> Version Control -> Git* and paste your copied GitHub web URL in the *Repository URL* box.

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/rstudio_cloneGit.png)</center>

Afterward, click <strong>Create Project</strong>.  Your GitHub repository is now connected to RStudio!

Navigate to the Git tab in RStudio.  How many files are listed there?

*** =instructions
- 1
- 2
- 3
- 4
*** =sct
```{r}
test_mc(2)
success_msg("Correct!")
```

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:adbd3f800d
## Pulling from GitHub
There are two new concepts techniques that you have to get used to in order to use GitHub through RStudio: *pulling* and *pushing*.  When you *pull*, you pull the changes <strong>from</strong> the remote repository hosted on GitHub <strong>to</strong> your local computer.

Head over to github.com, login, and enter your *hello-word* repository.  Go through the steps of cloning your GitHub repository again within RStudio (as a reminder, within the RStudio IDE, click *File -> New Project -> Version Control -> Git*, paste GitHub web URL, and click <strong>Create Project</strong>).

Now, back at github.com within your  *hello-word* repository, click the <strong>Create new file</strong> button.   

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/github_createFile.png)</center>


Name the file 'hello.R'

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/github_fileName.png)</center>


Then, within the text editor window, type the following: 

```print("hello world")```

Make sure there are no new lines or spaces before or after typing that.

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/github_editor.png)</center>


Finally, enter a commit message and click <strong>Commit new file</strong>.

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/github_commitWindow.png)</center>

Back in RStudio, navigate to the Git tab.  Click the *Pull* button  ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/git_pull.png).  Enter your GitHub username and password, if asked.  This is going to query the GitHub repository, and check to see if it differs from your local instance of it.  Since it does differ, because we just added a *hello.R* script via GitHub, it's going to retrieve a copy of that file and download it locally.  

Navigate to the RStudio file browser.  You should the *hello.R* script now.  What's the size of it in bytes?

*** =instructions
- 3 B 
- 12 B
- 20 B
- 21 B
*** =sct
```{r}
test_mc(4)
success_msg("Correct!")
```

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:6ed97fb1c5
## Pushing to GitHub
*Pushing* is the act of pushing whatever changes you made locally <strong>to</strong> the remote repository hosted on GitHub <strong>from</strong> your local computer.  As a rule of thumb, it's always a good practice to pull before you push.

Once again,  go through the steps of cloning your GitHub repository again within RStudio within the RStudio IDE, click *File -> New Project -> Version Control -> Git*, paste GitHub web URL, and click <strong>Create Project</strong>).  Note that in normal situations, you wouldn't have to clone your repository each time you want to use it -- you would simply just open up the RStudio project file that is created once you connect RStudio to GitHub, and it'll already be connected to GitHub.

Navigate to the Files window, and open up the 'hello.R' script.  Edit it such that it looks like this:

```print("hello world", quote=F)```

Now save the file and navigate to the Git tab.  You'll see the file 'hello.R' marked with a modified ```M``` status.  Just like in previous times, we want to add and commit the file.  To do so, click the checkbox next to it to add it ```A```.    Click <strong>Commit</strong>.   Enter an informative commit message (e.g., 'Hello world no longer prints with surrounding quotes') and click <strong>Commit</strong>.  

Now the file has been saved, added, and commited to your *local* directory.  To move them to GitHib, you have to push them.  Click the push icon ![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/icons/git_pull.png).  Enter your GitHub username and password, if asked. This change should now be reflected in the 'hello.R' script on github.com.  Navigate there to verify.


Click the <strong>Push</strong> button again. Enter your username and password. What message pops up?

*** =instructions
- 1 file changed, 1 insertion(+), 1 deletion(-)
- Everything up-to-date
- <SHA>..<SHA>  master -> master
- Error
*** =sct
```{r}
test_mc(2)
success_msg("Correct! Since no additional changes were made, there as nothing to push to GitHub!")
```

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:211e19754b
## Summary






