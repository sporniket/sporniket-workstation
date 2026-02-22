# Mandatory and nice configuration steps for git

## Manual settings -- mandatory

Git **will** require those configuration elements

```
git config --global user.email "your.mail@address.com"
git config --global user.name "Firstname LASTNAME"
```

## Optionnal settings to append

The file `gitconfig-addendum.txt` contains the aliases `st` (status) and `blog` (a nicely text formatted view to see the graph of the repository, each commit on one line) ; it also set some other configuration values, like the main branch name, the kind of push to perform by default, etc... See the file for further details.

To apply the content of this file, append it to your `.gitconfig` file.

```
cat gitconfig-attendum.txt >> ~/.gitconfig
```

