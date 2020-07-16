#!/bin/bash

check_file (){  # Check if file is regular or not
	test -f "$ARG"
	RESULT=$?
}

for ARG in "$@"
do
  check_file
  if [ "$RESULT" == "0" ]
    then
      ls -l $ARG
    else
      echo "$ARG is not a regular file"
  fi
done

