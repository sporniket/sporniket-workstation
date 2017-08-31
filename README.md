# Sporniket workstation setup

> [WARNING] Please read this notice carefully before using this project.

Content

1. What is **Sporniket workstation setup**, and when to use it ?
2. What should you know before using **Sporniket workstation setup** ?
3. How to use **Sporniket workstation setup** ?
4. Known problems
5. Miscellanous


## 1. What is **Sporniket workstation setup**, and when to use it ?
**Sporniket workstation setup** is a collection of debian packages to build and install to get a typical ubuntu workstation for myself : various software stacks (ide, java, ...), extra configurations (git, scripts, ...).

An additionnal script would be help when starting from a fresh install of the OS.

The interest of bothering to make a debian package is to take care of the uninstall process, i.e. cleaning afterwards.

The interest of sharing this project is to serve as knowledge base and starting point for those that wish to take the same approach.

### What's new in alpha-01

* git extras.
* a first set of supplemental apt repositories
* Initialisation of /var/log subfolder when /var/log is a tmpfs

## 2. What should you know before using **Sporniket workstation setup** ?

**Sporniket workstation setup** is based on a Ubuntu 16.04 LTS workstation.

> Do not use **Sporniket workstation setup** if this project or one of it's dependencies is not appropriate for you.

### Licence

This project is a collection of pieces of *public knowledge* applied to a personnal interest. As such, it is licensed under the Creative Commons "Attribution-ShareAlike 3.0 Unported" (CC BY-SA 3.0).

https://creativecommons.org/licenses/by-sa/3.0/

## 3. How to use **Sporniket workstation setup** ?

1. Clone the repository or download a snapshot.
2. Go to the src-deb.
3. Build the packages with 'make'.
4. Pick and install the packages of your choice, or install all with 'make install'.

##4. Known problems

Not enough packages.

## 5. Miscellanous

Nothing for now.
