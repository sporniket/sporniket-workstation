# A modular bashrc system

In a nutshell, add new action to your bashrc by adding the action into a pool of available action, and enable it by symlinking it into the list of actually sourced files.

## Theory of operation

A folder `~/.bashrc.d/` is initialized, containing

* A folder named `available`, that will store all and any bashrc files. The folder `availables/builtins` folder will already contain some files.
* A folder named `enabled`, that will contains symbolic links to files from the `available` folder, named `xx--yy`, with : `xx` a sequential number that is left-padded with zeros, e.g. '03' ; `yy` usually the original file name without extension targeted by the link.
* A script `run` that will essentially scan the `enabled` folder and run each file.

```bash
# Private colored marker for fancy log messages...
LOG_INFO="\e[96mINFO \e[0m --"
LOG_OK="\e[92mOK   \e[0m --"


#Grant that there is a directory at ~/.bashrc.d/available
[[ ! -d "~/.bashrc.d/available" ]] && mkdir -p ~/.bashrc.d/available

#Grant that there is a directory at ~/.bashrc.d/enabled
[[ ! -d "~/.bashrc.d/enabled" ]] && mkdir -p ~/.bashrc.d/enabled

#load configs from .bashrc.d
reload-bashrc-d () {
  for rc in $(ls ~/.bashrc.d/enabled); do echo -e "${LOG_INFO} Sourcing $rc..." ; source ~/.bashrc.d/enabled/$rc ; done
  echo -e "${LOG_OK} Sourced all enabled definitions files."
}
export -f reload-bashrc-d

reload-bashrc-d

```

## Installation

An installation script will perform the following actions :

* Ask for color support Y/n
* Ask for appending to either `~/.bashrc`, `~/bash_aliases`, or just display what to append in whatever file.

Then, it will : 

* Create the folder architecture, copy provided builtin scripts 
* Create main runner with or without color support
* Enable some builtins scripts (depending of the choice about the support of colors, will enable the appropriate log utils)
* Append to the selected main files or display instructions.

