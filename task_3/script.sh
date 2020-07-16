#!/bin/bash

USER_HOME=/home/parallels
date > $USER_HOME/outfile.txt

find $USER_HOME -maxdepth 1 -mindepth 1 -type d | 
while read DIR; do
  echo "$DIR $(find $DIR -type f | wc -l)" >> $USER_HOME/outfile.txt
done
