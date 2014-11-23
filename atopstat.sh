#!/bin/bash
#===============================================================================
#
#          FILE:  atopstat.sh
# 
#         USAGE:  ./atopstat.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Daniel Graf (DG), daniel@debian-hell.org
#       COMPANY:  ---
#       VERSION:  1.0
#       CREATED:  11/20/2014 10:12:28 AM CET
#      REVISION:  ---
#===============================================================================

# define atopstat working directory and default config
# ATTENTION: change only if you know what to do
WD="/home/graf/dev/atopstat/"
CONFIG="/home/graf/dev/atopstat/atopstat.cnf"

if [ -r ${WD}/functions.sh ] ; then
  source ${WD}/functions.sh
else
  echo "Core functions couldn't be included. Maybe the config file is faulty!"
  exit 255
fi

LoadConfig
ParseParameters "${@}"
