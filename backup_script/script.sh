#!/bin/bash

USER_HOME=/home/parallels
BACKUP_CONF_FILE=/home/parallels/backup.conf
TEMP_DIR=/tmp/backup_script
TEMP_CHECK_FILE=/tmp/backup_script/backup.temp
BACKUP=$USER_HOME/backup.tar.gz

create_temp_files (){
	mkdir  -p $TEMP_DIR
	touch $TEMP_CHECK_FILE
}


perform_check (){
	find $USER_HOME -maxdepth 1 -mindepth 1 -type f -name "*.conf" > $TEMP_CHECK_FILE
	find $USER_HOME -maxdepth 1 -mindepth 1 -type f -name "*.config" >> $TEMP_CHECK_FILE
	BACKUP_CONF_FILE_CONTENTS=$(<$BACKUP_CONF_FILE)
	TEMP_CHECK_FILE_CONTENTS=$(<$TEMP_CHECK_FILE)
	if [ "$BACKUP_CONF_FILE_CONTENTS" != "$TEMP_CHECK_FILE_CONTENTS" ]
	then
		sudo tar -xzf /home/parallels/backup.tar.gz -C /
	fi
}


backup_gen (){
	find $USER_HOME -maxdepth 1 -mindepth 1 -type f -name "*.conf" > $BACKUP_CONF_FILE
	find $USER_HOME -maxdepth 1 -mindepth 1 -type f -name "*.config" >> $BACKUP_CONF_FILE
	tar -czf $BACKUP -T $BACKUP_CONF_FILE
	echo "BACKUP generated!"
}


#Script starts here
if test -f $BACKUP_CONF_FILE;
then
	perform_check
else
	create_temp_files
	backup_gen
fi