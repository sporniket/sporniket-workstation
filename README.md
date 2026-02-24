# Sporniket worstation setup

> This is the setup reworked from crash, identified as `v2026` ; the previous version is still available in branch `v2017`

_Quick description_

## Organisation

One can distinguish actions to perform a setup _for a particular user_ from those to perform a setup _for the whole system_. 

For a given set of tools, there may be both kind of actions. E.g. for `git`, there is a step to setup the configuration for the user (updating `~/.gitconfig`) and there is a step to make available to anyone a bash script to configure a git-oriented prompt.

For each identified step, there will be a folder to store a reference documentation (README file), and any other file, like scripts, data file, etc.

Regarding automation/scripts, there will be 4 cases, by order of priority :

* **EITHER** the step is automatable **WITHOUT** user interaction **and** 
  * **EITHER** it is considered for being part of an automated setup, **then** it **will** have a `__autorun__.sh` script.
  * **OR** it is not considered for being part of an automated setup, **then** it **will** have a `__run__.sh` script.
* **OR** the step is automatable **WITH** user interaction, **then** it **will** have a `__setup__.sh` script.
* **OR** the step is considered manual.

> _TODO_ : a script to listing the actions grouped by case and sorted by name

The folders hosting the steps **will** follow a naming scheme that will make obvious the order of the steps by sorting them in alphabetical order ; system-wide steps are expected to come first, and only then user-wide steps.

Thus : 

* System-wide steps are hosted in folders with names having the pattern `sXX--yyy`
* User-wide steps are hosted in folders with names having the pattern `uXX--yyy`

Where : 

* `XX` a sequential number, left padded with `0` to a length of 2 characters, i.e. there will be 100 folders at most, from `00` to `99`.
* `yy` is a short yet descriptive title, lower case words separated by dashes `-`, e.g. `bashrc-folder`


