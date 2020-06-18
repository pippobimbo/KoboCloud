#!/bin/sh

#baseURL="$1"
baseURL="https://proliant.barbefamily.fr"

#outDir="$2"
outDir = "/tmp"

#load config
. `dirname $0`/config.sh

# Step 1 : retrieve API information
API="SYNO.API.Info"

#/webapi/query.cgi?api=SYNO.API.Info&version=1&method=query&query=SYNO.API.Auth,SYNO.FileStation

jsonAns=`$CURL -k -L --silent $baseURL"/webapi/query.cgi?api=$API&version=1&method=query&query=SYNO.API.Auth,SYNO.FileStation"`
echo $jsonAns

#maxVersion=`echo $jsonAns | sed -e 's/.*"maxVersion": "\([^"]*\)".*/\1/' -e 's@\\\\/@/@g'`
maxVersion=`echo $jsonAns | sed -E 's/.*"maxVersion":"?([^,"]*)"?.*/\1/'`