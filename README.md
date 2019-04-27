# <img src="https://img.shields.io/badge/license-MIT-green.svg"> <img src="https://img.shields.io/badge/bash-Pass-orange.svg"> <img src="https://img.shields.io/badge/zsh-Pass-blue.svg"> | megamenu

![Screenshot](img/megamenu.png)

## Description
Script for terminal to bring up menu options for system and network information and some other useless things  	(￣▽￣)ノ

## Setting It Up
Place into path environment of terminal app so that it will be permanently accessible.  There are several places the scripts can be placed (In our case megamenu.sh). Do not place scripts directly into /bin /sbin/ /usr/bin or /usr/sbin.  Sure, they will function there, but they may overwrite an existing function when placed or lost during an update.  It is best to 
avoid $PATH conflicts.  Here are some safe options, including Recommended!

> Option 1. Placing inside /usr/local/bin stores locally and is seperated from typical program executables.  It also makes any script
available to all users, however, editing the file in place will require sudo. :lock:  Files in /usr/local/bin override /usr/bin.
This should be in $PATH by default.  Check by simply typing $PATH in terminal.
```sh
/usr/local/bin
```
If it is not in the $PATH, simply run this to add it.
```sh
PATH=$PATH:/usr/local/bin
```
> Option 2. Create a folder in home called bin.  These scripts will be available only to that single home user (unless adpated with sybolic links like in next example.)  Symlinking to the local folders makes scripts system-wide.
```sh
~/bin
```
Before any scripts in ~/bin can be run you need to add the new path to current $PATH assuming that no symplinking is being used.
To add the path use:
```sh
PATH=$PATH:~/bin
```
Doing so with no symlinking will mean that scripts will only be available to a single user.
##### Recommended!  :arrow_heading_down:
> Option 3. Create a folder called scripts in /opt/ (stands for optional); this will generate the aboslute path:
```sh
/opt/scripts
```
With the scripts placed inside this folder the next step is to symbolically link it.  Choose between the 
two locations for a particular behavior.  Because it is in local it will be system-wide.  The difference
here is wether to require root password or not.
+ Execute for normal users; make symbolic link to /usr/local/bin
+ Execute for root; make symbolic link to /usr/local/sbin :lock:
Command example to symbolically link a script for normal users:
```sh
 sudo ln -s /opt/scripts/megamenu.sh /usr/local/bin/
 ```
 :zap: Since symbolic links are going to folders already in $PATH therefore unnecessary to add /opt/scripts to $PATH.  
   
## Use
Once  one of the above is completed.  Close the terminal completely and start it back up again.  This will update the environment to include the script.
> Now, for using the newly added script simply type the following:
```sh
megamenu.sh
```

Though the name has a large connotation, it was kept small so the menu does not fill the entire screen!  If you think of anything to add please leave a suggestion at megacron@d3c3p7.com

Feel free to fork ;)

~Thanks, Megacron.