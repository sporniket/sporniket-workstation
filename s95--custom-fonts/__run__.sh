#!/bin/bash
# (c)2019~2026 David SPORN
# SPDX-License-Identifier: AGPL-3.0-or-later

BASEDIR="$(dirname $(realpath $0))"

DIR_CACHE="${BASEDIR}/local.cache"
DIR_SYSFONTS="/usr/share/fonts"

function installFont {
  downloadIfAbsent "$1" "$2"
  copyToSystemFontFolder "$1" "$3"
}

# Download specified file into local.cache folder, if not present yet
# @param $1 file path in local.cache folder
# @param $2 url to download the file
function downloadIfAbsent {
  _target="${DIR_CACHE}/$1"
  if [[ ! -e "${_target}" ]]
  then
    wget -O "${_target}" "$2"
  fi

  if [[ ! -f "${_target}" ]]
  then
    echo "[ FAIL ] -- MUST be a file: '${_target}'"
    false
    exit
  fi
}

function copyToSystemFontFolder {
  _targetDir="${DIR_SYSFONTS}/$2"
  if [[ ! -e "${_targetDir}" ]]
  then
    sudo mkdir -p -v "${_targetDir}"
  fi

  if [[ ! -d "${_targetDir}" ]]
  then
    echo "[ FAIL ] -- MUST be a folder: '${_targetDir}'"
    false
    exit
  fi

  sudo cp -v "${DIR_CACHE}/$1" "${DIR_SYSFONTS}/$2"
}

# prepare cache folder
if [[ ! -d "${DIR_CACHE}" ]]
then
  if [[ -e "${DIR_CACHE}" ]]
  then
    echo "ERROR -- '${DIR_CACHE}' is not a folder"
    false
    exit
  fi
  mkdir -p "${DIR_CACHE}"
fi

# install custom fonts
DIR_COLLECTION="opentype/sporniket/nostalgie2"
installFont "Sporniket-Nostalgie2-Console.otf" \
    "https://github.com/sporniket/Sporniket-Nostalgie-Sans/releases/download/v2.1.0/Sporniket-Nostalgie2-Console.otf" \
    "$DIR_COLLECTION"

# Rebuild font cache
fc-cache -f -v

echo "[  OK  ] -- Done."
