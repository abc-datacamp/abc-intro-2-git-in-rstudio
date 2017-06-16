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

There are many more advantages to using a real version control system such as Git, e.g., the ability to describe why specific changes were necessary and the ability to even classify and tag different types of changes.

---------------------------------------------

**Which tasks can Git help you with?**

*** =instructions
- Back-up of files.
- Restoring lost files.
- Undoing saved edits to a file.
- Tracking ownership of a file.
- All of the above.
- None of the above.

*** =sct
```{r,eval=FALSE}
msg1 <- "Yes, but not just that."
msg2 <- "Yes, but not just that."
msg3 <- "Yes, but not just that."
msg4 <- "Yes, but not just that."
msg5 <- "Yes! Git et al. are quite versatile! [Note: the incorrect spelling following al. is enforced by DataCamp]"
msg6 <- "Come on! We wouldn't make you learn Git if it couldn't do any of the listed tasks!"
test_mc(5, feedback_msgs = c(msg1, msg2, msg3, msg4, msg5, msg6))
```

*** =attachments
.Rprofile: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_setup_.Rprofile


--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:72082e6996
## Creating a Git repository in RStudio

Whenever you want Git to track your scripts, your very first step will be to **create a _repository_**.
A repository is the place where Git stores both the *files* it's supposed to keep track of and the actual *history* of the changes made to those files.
Think of it as a specialized type of file folder where Git stores some metadata in addition to the files that you're working on.

> Most git commands will only work within Git repositories!

In RStudio, you can easily turn an **existing R project** into a Git repository.

-------------------------------

An R project has been created for you.
Find it in the File browser and open it (`myProject.Rproj`).
To add a Git repository to that project, follow these steps:

1. click *Tools* -> *Project Options* -> *Git/SVN*
2. Set the 'Version Control System' to be 'Git'.
3. Click <strong>Yes</strong> twice. 

When a Git repository is initiated, Git creates a hidden subdirectory within the folder associated with the R project.
Since it is hidden, you do not need to worry about it, but just so you know: all of the metadata for keeping track is stored in there.

What you will see and notice in the browser pane of RStudio is that a new file was created in your project directory that is called `.gitignore`.
This simple text file lists all the file types that will be ignored by Git, i.e., **files that will not be tracked**.
Files to be exluded from the tracking typically include:

* local configuration files that specify a user's settings on a certain computer
* temporary files
* large data files
* binary files
* executables
* files with passwords

You can see which file types and folders are automatically set to be excluded from the Git tracking by simply opening the `.gitignore` file.

------------------------------

**Which files/folders should typically _not_ be noted in a `.gitignore` file for R projects?**


*** =instructions
- `.R`
- `.Rproj.user`
- `.Rhistory`
- `.RData`
- `.Ruserdata`

*** =sct
```{r}
msg1 <- "Correct! You definitely want your R scripts to be part of the version control, i.e., they should NOT be excluded from the Git tracking via the .gitignore file."
msg2 <- "Rproj.user is a hidden directory  where project-specific temporary files (e.g. auto-saved source documents, window-state, etc.) are stored. Temporary files do not need to be tracked and should definitely be part of .gitignore!"
msg3 <- "The .Rhistory file contains ALL commands of a past R session - all your important commands should be in a script, so there is no need to track the entire messy history of your trials and errors!"
msg4 <- ".RData (as well as .RDS) is a typical ending for data sets saved with R. Since your scripts should contain all the information to regenerate every data set, you should not need to keep track of the data itself!"
msg5 <- ".Ruserdata contains user-specific configurations. For the sake of shared enabling git repo sharing, refrain from tracking user-specific settings. This should definitely go into the .gitignore file."
test_mc(1, feedback_msgs = c(msg1, msg2, msg3, msg4, msg5))
```

*** =attachments
.Rprofile: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_setup_.Rprofile
myProject/myProject.Rproj: https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/myProject.Rproj

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:b8a90154e0
## Tracking files and saving changes

Once you've created a Git repository, you can go about your business such as writing scripts as usual.
Git will quietly notice any saved changes to any tracked file, but in order for those changes to become part of the official Git history, you will have to manually communicate to Git that you think you've made changes that are worth keeping a record of (e.g., you've fixed a bug, or added a cool new function, or corrected a typo).

The process of telling Git to **permanently log** certain changes requires two steps:

1. **adding** and
2. **committing**

Always in this order!

### Adding files

*Say, you just fixed a couple of typos in your report in the Git repo.*
*You saved those changes and are ready to move on to the next task (e.g., adding a new paragraph).*
*Before you start messing around with the content of your report, you want to make sure that you can always revert back to the version you currently have, including the corrected typos.*

In Git-speak, adding a file means that you are telling Git that you are **interested to include the update** you just made into the Git history.
(The same holds true if you created a completely new file -- while Git will notice that there's a new file in the folder, it will not start keeping track of the changes until you add and commit it).

The act of adding does not affect the Git repository (i.e., the metadata that is stored about your files), it's basically just telling Git that you're done changing the file(s) for now and that you would like to keep a record of that change.

RStudio has found a slightly more intuitive term for `git add` -- here, adding is refered to as _staging_.

### Committing files

Once you've added one ore more changes to one or more files, you will have to actually _commit_ them.
This tells Git that you do want to **record those changes** in your Git repository.

>The two actions (adding & committing) typically go hand-in-hand. Because only changes which are committed are part of the official record and can be used for future roll-backs, it is usually good practice to **add and commit early and _often_**.

_"A commit takes a snapshot of your code at a specified point in time. Using a Git commit is like using anchors and other protection when climbing. If you’re crossing a dangerous rock face you want to make sure you’ve used protection to catch you if you fall. Commits play a similar role: if you make a mistake, you can’t fall past the previous commit. Coding without commits is like free-climbing: you can travel much faster in the short-term, but in the long-term the chances of catastrophic failure are high! Like rock climbing protection, you want to be judicious in your use of commits. Committing too frequently will slow your progress; use more commits when you’re in uncertain or dangerous territory. Commits are also helpful to others, because they show your journey, not just the destination."_
[Hadley Wickham](http://r-pkgs.had.co.nz/git.html)

--------------------------------

1. Open the the `myProject` directory.
2. Open the RStudio project (`myProject.Rproj`), you should see three files: `.gitignore`, `myFunctions.R`, `myProject.Rproj`.

Remember that we just initiated the Git repo for that R project, i.e., we set up the Git infrastructure to keep track of files within `myProject`.
We also told it to ignore the `.Rproj` file (remember how?).

The first file that we actually want to become part of the Git logging is the script `myFunctions.R`.
Let's tell Git that it should be tracking this script!

In order to do this, we will make use of a couple of new buttons that were added to RStudio after we had created the Git repository.
There is an entire new **Git tab in the upper right window**, next to the History tab.
Click on that tab now.
You should see something like this:

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_untracked.png)</center>

Note that there are three columns for each file:

* **Stage**: Is a file being tracked by Git?
* **Status**
    * `??` - Git does not know about that file
    * `M` - The file has been modified
    * `A` - The file has been added, i.e., we're ready to commit the changes to it
    * `D` - The file has been deleted
* **Path**

As expected, the `myFunctions.R` script is not yet being tracked by Git (as indicated by `??` in the _status_ box)

---------------------------------

**Based on what you've just learnt, what should be the next steps?**

*** =instructions
- Modify the file, save, then stage, then commit.
- Stage the file, then commit, then modify it.
- Diff the file, the commit, then modify it.

*** =sct
```{r}
msg1 <- "In principle, this is a valid workflow. However, we would like the original version of the script to be part of the Git history, so modifying it before Git actually even knows about it is not recommended."
msg2 <- "Exactly! First, you submit the original version of the script to Git, and then you're free to play around with it. The original will always be there!"
msg3 <- "No, not possible. Git does not even know about the script at this point as indicated by the question marks, so running the Git function diff on it won't even work. Plus, the command that goes hand in hand with commit is add (or stage, in RStudio)."
test_mc(2, feedback_msgs = c(msg1, msg2, msg3))
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


--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:fc4fac8eaa
## Tracking files and saving changes II

Congrats, you've mastered the theory of adding/staging & committing!
Now, let's actually _do_ it!

1. Add/stage the file by checking the box next to `myFunctions.R`. The status should now change to `A`, indicating that the file has been added, i.e. you've announced your intention to submit this file to the Git tracking.
2. To finally **commit** the file, click the <strong>Commit</strong> button in the Git panel.
A new window will pop up:

<center>![load](https://raw.githubusercontent.com/abc-datacamp/abc-intro-2-git-in-rstudio/master/attachments/git_commitWindow.png)</center>

3. Note that you <strong>must</strong> enter a commit message before clicking <strong>Commit</strong>.
Commit messages should be informative and terse so that your future self or a collaborator will get some sort of idea why you thought that change was necessary.
Enter a commit message (something like, 'Created a function to convert to percent') and click </strong>Commit</strong>.   

-------------------------------------
**After clicking </strong>Commit</strong>, a message pops up.**
**What does it say?**

*** =instructions
- ```1 file changed, 6 insertions(+)```
- ```1 file deleted```
- ```2 files changed, 6 insertions(+)```
- ```2 files created in create mode```

*** =sct
```{r}
test_mc(1)
success_msg("Correct! Congrats on your first stage & commit with Git! The script myFunctions.R is now going to be tracked by Git.")
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

--- type:RStudioMultipleChoiceExercise lang:r xp:100 skills:1 key:f0e27486c3
## Tracking files and saving changes III

### Some more background about Git's `commit`

Every time you commit something^, Git creates a snapshot of the commited file(s) in their current state.
For every commit, there will be a record of:

* the **person** that added/staged & committed the file(s)
* a **unique identifier**, so that the particular version of your file(s) can always be retrieved
* a specific file that knows about the **modifications** of the file(s)
* a **parent** (i.e., the previous commit)
* the **commit message** that was supplied by the user, intended to be a human-readable hint as to what was done to the files

Commits can be done for single files or simultaneously for multiple files -- you will always have to manually select the files for staging & committing.

> Git will never create a record of change for any file (even if it's being tracked) without you telling it to do it!

-------------

^ where "something" could be one or more new files, changes to one or more files, or deletes of entire files

--------------

Say, you have a folder `ImportantStuff` with three different files, `One.R`, `Two.txt`, `Three.csv`.
You have created a Git repository for `ImportantStuff`. Then, you staged and committed `One.R`.

**Which statement is correct?**

*** =instructions
- Any changes to `One.R` will from now on be part of the Git history.
- All scripts in `ImportantStuff` will now be tracked by Git.
- The original version of `One.R` will always be retrievable.
- `Two.txt` and `Three.csv` cannot become part of the Git history.

*** =sct
```{r}
msg1 <- "Not quite right. While Git will tell you via the `M` symbol that One.R may have been modified, it will not keep a record of this until you stage and commit those modifications."
msg2 <- "No. You only committed One.R. If you wanted the other scripts to version controlled, too, you can select both of them and add/stage & commit them."
msg3 <- "Absolutely -- since you committed the original version of One.R to the Git repository, there will now be an immutable record of that file. How great is that?!"
msg4 <- "There is no technical reason to not commit the other two scripts to Git, too."
test_mc(3, feedback_msgs = c(msg1, msg2, msg3, msg4))
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
Git allows you to view changes made to a file that was previously committed, and RStudio supports this function.

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






