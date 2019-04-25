# <img src="https://img.shields.io/github/license/mashape/apistatus.svg"> | megamenu

## Description
Script for terminal to bring up menu options for system and network information.

## Use
Place into path environment of terminal app.  There are several places you can choose to put them.
However, do not place scripts directly into /bin /sbin/ /usr/bin or /usr/sbin.  Sure, they will function there,
but they may overwrite an existing function when placed or during an update.  It is best to 
avoid $PATH conflicts.  Here are some safe options, including Recommended!

> 1. Placing inside /usr/local/bin stores locally and is seperated from typical program executables.  It also makes any script
available to all users, however, editing the file in place will require sudo. :lock:  Files in /usr/local/bin override /usr/bin.
This should be in $PATH by default.  Check by simply typing $PATH in terminal.
```sh
/usr/local/bin
```
If it is not in the $PATH, simply run this to add it.
```sh
PATH=$PATH:/usr/local/bin
```
> 2. Create a folder in home called bin.  These scripts will be available to that home user unless adpated with sybolic links like in next example.
```sh
~/bin
```
Before any scripts in ~/bin can be run you need to add the new path to current $PATH. Given that no symplinking is being used.
To add the path use:
```sh
PATH=$PATH:~/bin
```
Doing so with no symlinking will mean that scripts will only be available to a single user.
##### Recommended!  :arrow_heading_down:
> 3. Create a folder called scripts in /opt/ (stands for optional); this will generate the aboslute path:
```sh
/opt/scripts
```
With the scripts placed inside this folder the next step is to symbolically link it.  Choose between the 
two locations fora particular behavior.  Because it is in local it will be system-wide.  The difference
here is wether to require root password or not.
+ Execute for normal users; make symbolic link to /usr/local/bin
+ Execute for root; make symbolic link to /usr/local/sbin :lock:
Command example to symbolically link a script for normal users:
```sh
 sudo ln -s /opt/scripts/example.sh /usr/local/bin/
 ```
 :zap: Since symbolic links are going to folders already in $PATH therefore unnecessary to add /opt/scripts to $PATH.  
   

