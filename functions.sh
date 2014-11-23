#!/bin/bash
#===============================================================================
#
#          FILE:  functions.sh
# 
#         USAGE:  ./functions.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Daniel Graf (DG), graf@internet24.de
#       COMPANY:  internet24 GmbH
#       VERSION:  1.0
#       CREATED:  11/20/2014 11:45:25 AM CET
#      REVISION:  ---
#===============================================================================

#===  FUNCTION  ================================================================
#          NAME:  LoadConfig
#   DESCRIPTION:  Loads the configuration and does a check
#    PARAMETERS:  ---
#===============================================================================

function LoadConfig() {
  if [ -r ${CONFIG} ] ; then
    source ${CONFIG}

    if [ ${LOG_ENABLE} -ne 0 -a ${LOG_ENABLE} -ne 1 ] ; then
      echo "Configuration error: Variable LOG_ENABLE is neither 0 or 1!"
      exit 255
    fi
    if [ ${LOG_ENABLE} -eq 1 ] && ! [ -w "${LOG_FILE}" ] ; then
      echo "Configuration error: Log file doesn't exists or isn't writeable!"
      exit 255
    fi
  else
    echo "Config file ${CONFIG} does not exists or is not readable!"
    exit 255
  fi
}

#===  FUNCTION  ================================================================
#          NAME:  Log
#   DESCRIPTION:  A simple logging function
#    PARAMETERS:  <Text> - Everything behind the functions name will be logged
#===============================================================================

function Log() {
  if [ ${LOG_ENABLE} -eq 1 ] ; then
    echo "[$(date +%Y-%m-%d" "%H:%M:%S)] ${@}" >> ${LOG_FILE}
  fi
}

#===  FUNCTION  ================================================================
#          NAME:  ParseParameters
#   DESCRIPTION:  Parse paramaters from stdin
#    PARAMETERS:  ${@} from STDIN of atopstat.sh
#===============================================================================

function ParseParameters() {
  while true ; do
    case "${1}" in
      -l|--serverlist)
        serverlist=${2}
        shift 2
      ;;
      '')
        break
      ;;
      -h|--help|*)
        ShowHelp
        exit 1
      ;;
    esac
  done
}

#===  FUNCTION  ================================================================
#          NAME:  ShowHelp
#   DESCRIPTION:  Displays the help page
#    PARAMETERS:  ---
#===============================================================================

function ShowHelp() {
  echo "atopstat.sh <Parameters>"
  echo "  -XXX ..."
  exit 0
}
