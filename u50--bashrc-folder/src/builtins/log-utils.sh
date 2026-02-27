#!/bin/bash
# (c)2019~2026 David SPORN
# SPDX-License-Identifier: AGPL-3.0-or-later

########################################################################
# SPECIFICATIONS
# * line format and character formatting (if color support activated)
# * When color is not supported, no character formatting occurs
# ----------------------------------------------------------------------
# log levels
#   ERROR  -- Bold redish mark, normal message
#   WARN   -- Yellowish mark, normal message
#   info   -- Light blueish mark, normal message
#   trace  -- Darker mark, normal message
# ----------------------------------------------------------------------
# notify statuses
# [  OK  ] -- Greenish mark and message
# [ FAIL ] -- Bold redish mark and message
########################################################################


# Formatting sequences
FMT_RESET="\e[0m"
# -- log levels
FMT_ERROR="\e[1;91m"
FMT_WARN="\e[93m"
FMT_INFO="\e[96m"
FMT_TRACE="\e[90m"
# -- notify statuses
FMT_SUCCESS="\e[92m"
FMT_FAILURE="\e[1;91m"

# Line markers
MARK_SEP=" -- "
# -- log levels
MARK_ERROR="  ERROR "
MARK_WARN="  WARN  "
MARK_INFO="  info  "
MARK_TRACE="  trace "
# -- notify statuses
MARK_SUCCESS="[  OK  ]"
MARK_FAILURE="[ FAIL ]"

function setupColoredUtils {
  function logError {
    echo -e "${FMT_ERROR}${MARK_ERROR}${FMT_RESET}${MARK_SEP}$1"
  }
  export -f logError
  
  function logWarn {
    echo -e "${FMT_WARN}${MARK_WARN}${FMT_RESET}${MARK_SEP}$1"
  }
  export -f logWarn
  
  function logInfo {
    echo -e "${FMT_INFO}${MARK_INFO}${FMT_RESET}${MARK_SEP}$1"
  }
  export -f logInfo
  
  function logTrace {
    echo -e "${FMT_TRACE}${MARK_TRACE}${FMT_RESET}${MARK_SEP}$1"
  }
  export -f logTrace
  
  function notifySuccess {
    echo -e "${FMT_SUCCESS}${MARK_SUCCESS}${MARK_SEP}$1${FMT_RESET}"
  }
  export -f notifySuccess
  
  function notifyFailure {
    echo -e "${FMT_FAILURE}${MARK_FAILURE}${MARK_SEP}$1${FMT_RESET}"
  }
  export -f notifyFailure
}

function setupNoColorUtils {
  function logError {
    echo -e "${MARK_ERROR}${MARK_SEP}$1"
  }
  export -f logError
  
  function logWarn {
    echo -e "${MARK_WARN}${MARK_SEP}$1"
  }
  export -f logWarn
  
  function logInfo {
    echo -e "${MARK_INFO}${MARK_SEP}$1"
  }
  export -f logInfo
  
  function logTrace {
    echo -e "${MARK_TRACE}${MARK_SEP}$1"
  }
  export -f logTrace
  
  function notifySuccess {
    echo -e "${MARK_SUCCESS}${MARK_SEP}$1"
  }
  export -f notifySuccess
  
  function notifyFailure {
    echo -e "${MARK_FAILURE}${MARK_SEP}$1"
  }
  export -f notifyFailure
}

if [ -z "$SUPPORT__COLOR" ]
then
  setupNoColorUtils
else
  setupColoredUtils
fi

logTrace "Demonstration, lorem ipsum sic amet"
logInfo "Demonstration, lorem ipsum sic amet"
logWarn "Demonstration, lorem ipsum sic amet"
logError "Demonstration, lorem ipsum sic amet"
notifySuccess "Demonstration, lorem ipsum sic amet"
notifyFailure "Demonstration, lorem ipsum sic amet"

