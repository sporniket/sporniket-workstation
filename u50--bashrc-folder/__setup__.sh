#!/bin/bash
# (c)2019~2026 David SPORN
# SPDX-License-Identifier: AGPL-3.0-or-later

orig_ps3="$PS3"

PS3="Use color in terminal ? "
select choiceColor in "Yes" "No"
do
    if [ -z "$choiceColor" ]
    then
        echo "[ ERROR ] -- type the number of your choice"
        echo
    else
        case "$choiceColor" in
            "Yes" )
                echo "  info    -- Will support color"
                export SUPPORT__COLOR="1"
                ;;
            * )
                echo "  info    -- WON'T support color"
                export SUPPORT__COLOR=""
                ;;
        esac
        break
    fi
done

echo "  trace   -- SUPPORT__COLOR is '$SUPPORT__COLOR'"
############################################################################
# Actual install
# --------------------------------------------------------------------------
# Prepare folders
function prepare_folder {
  [[ ! -d "$1" ]] && mkdir -p -v "$1"
}

prepare_folder "$HOME/.bashrc.d/available/builtins"
prepare_folder "$HOME/.bashrc.d/enabled"
# --------------------------------------------------------------------------
# Build main script
echo -e "#\!/bin/bash" > "$HOME/.bashrc.d/run.sh"
echo -e "export SUPPORT__COLOR=\"${SUPPORT__COLOR}\"" >> "$HOME/.bashrc.d/run.sh"
cat src/run.sh >> "$HOME/.bashrc.d/run.sh"

echo "--------=<{ run.sh }>=--------"
cat "$HOME/.bashrc.d/run.sh"
echo "------------------------------"
# --------------------------------------------------------------------------
# Install & enable builtin scripts
cp -v src/builtins/* ~/.bashrc.d/available/builtins

function enable {
  [[ ! -e $1 ]] && ln -v -s "$2" "$1"
}

enable "$HOME/.bashrc.d/enabled/10-log-utils" "$HOME/.bashrc.d/available/builtins/log-utils.sh"
enable "$HOME/.bashrc.d/enabled/11-ls-aliases" "$HOME/.bashrc.d/available/builtins/ls-aliases.sh"
enable "$HOME/.bashrc.d/enabled/12-git-prompt" "$HOME/.bashrc.d/available/builtins/git-prompt.sh"
# --------------------------------------------------------------------------
# Display the invocation
function print_runner {
  echo -e "[[ -f "$1" ]] && source $1"
}

print_runner "$HOME/.bashrc.d/run.sh"
if [[ -f "$HOME/.bash_aliases" ]]
then
  echo "Add the following line in $HOME/.bash_aliases :"
  if [[ -z "$(grep "$HOME/.bashrc.d/run.sh" "$HOME/.bash_aliases")" ]]
  then
    print_runner "$HOME/.bashrc.d/run.sh" >> "$HOME/.bash_aliases"
  fi
else
  echo "Creating $HOME/.bash_aliases"
  print_runner "$HOME/.bashrc.d/run.sh" > "$HOME/.bash_aliases"
fi
############################################################################

