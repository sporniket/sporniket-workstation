# (c)2019~2026 David SPORN
# SPDX-License-Identifier: AGPL-3.0-or-later

# default logging/notify implementation
if [[ -z "$SUPPORT_COLOR" ]]
then
  function logInfo {
    echo -e "\e[96m  info  \e[0m -- $1"
  }
  function notifySuccess {
    echo -e "\e[92m[  OK  ]\e[0m -- $1"
  }
else
  function logInfo {
    echo -e "  info   -- $1"
  }
  function notifySuccess {
    echo -e ">>>OK<<< -- $1"
  }
fi

#load configs from .bashrc.d
reload-bashrc-d () {
  for rc in $(ls ~/.bashrc.d/enabled); do logInfo "Sourcing $rc..." ; source ~/.bashrc.d/enabled/$rc ; done
  notifySuccess "Sourced all enabled definitions files."
}
export -f reload-bashrc-d

reload-bashrc-d
logInfo "You may invoke 'reload-bashrc-d' when you update your initialisation scripts"

