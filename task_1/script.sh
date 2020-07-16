#!/bin/bash

help (){  # Help message
    echo "USAGE: [script] [file]"
    echo "Only for regular files!"
}

check_file (){  # Check if file is regular or not
	test -f "$FILE"
	RESULT=$?
}

add_executable (){ # Chmod file
	chmod u+x $FILE
	echo "Operation complete!"
}

#script start
FILE=$1
check_file
if [ "$#" -ne 1 ]
then
      echo "Incorrect number of arguments"
      help
else
      if [ "$RESULT" == "0" ]
      then
          add_executable
      else 
          echo "$FILE does not exist or is not regular file"
          help
      fi
fi
