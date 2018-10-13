#!/bin/bash
#OFFICIAL
default="personal"

# Get Type of File
getFileType() {
  local typ=`echo $1 | cut -s -d "#" -f3`
  if [[ -z $typ ]]; then
    typ="nil"
  fi
  echo "$typ"
}

# Checks if the type of the file is the same
# as what is passed
rightType() {
  if [[ "$1" == "$2" ]]; then
    return 0
  elif [[ "$1" == "nil" ]]; then
    return 0
  else
    return 1 
  fi
}

rightOS () {
  local os=`echo $1 | cut -d "#" -f2`
  if [[ "$OSTYPE" == "linux-gnu" && "$os" == "linux" ]]; then
    return 0
  elif [[ "$OSTYPE" == "darwin"* && "$os" == "osx" ]]; then
    return 0
  elif [[ -z "$os" ]]; then
    return 0
  else
    return 1
  fi
}

# Is the file the right OS and the right Type
rightFile () {
  local file=$2
  local symFile=`echo $2 | cut -d "#" -f2`
  local requestedType=$1
  local filetype=`getFileType $file`

  if [[ "$symFile" == "$file" ]]; then ## if file does not have hashtag
    return 1 # ignore
  elif rightType $filetype $requestedType && rightOS $file; then
    return 0
  else
    return 1
  fi
}


parseFile() {
  local file=`echo $1 | cut -d "#" -f1`
  echo $file
}

getRequestedType() {
  if [[ -z $1 ]];
  then
    echo "$default"
  else
    echo "$1"
  fi
}

setup() {
  requestedType=`getRequestedType $1`
  echo "Requested Type: $requestedType"
  for filename in *; do
    if rightFile $requestedType $filename; then
      parsedFile=`parseFile $filename`
      echo "linking: $parsedFile"
      ln -s "$(pwd)/$filename" ~/."$parsedFile"
    fi
  done
}

tearDown() {
  requestedType=`getRequestedType $1`
  echo "Requested Type: $requestedType"
  for filename in *; do
    if rightFile $requestedType $filename; then
      parsedFile=`parseFile $filename`
      echo "deleting: $parsedFile"
      rm ~/."$parsedFile"
    fi
  done
}

if [[ "$1" == "teardown" ]]; then
  tearDown $2
elif [[ "$1" == "setup" ]]; then
  setup $2
fi

