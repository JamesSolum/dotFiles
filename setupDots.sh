#!/bin/bash

rightFile () {
  os=`echo $1 | cut -d "#" -f2`
  if [[ "$OSTYPE" == "linux-gnu" && "$os" == "linux" ]]; then
    return 0;
  elif [[ "$OSTYPE" == "darwin"* && "$os" == "osx" ]]; then
    return 0;
  elif [[ "$os" == "" ]]; then
    return 0;
  else
    return 1;
  fi
}

parseFile () {
  file=`echo $1 | cut -d "#" -f1`
  echo $file
}

for filename in *; do
  if rightFile $filename; then
    parsedFile=`parseFile $filename`
    ln -s $filename ~/."$parsedFile"
  fi
done

