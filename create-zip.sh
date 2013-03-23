#!/bin/sh

FILE_NAME=android-update
ZIP_NAME=$FILE_NAME.zip
BACKUP_FOLDER=backup/
OUT_ZIP_FOLDER=out/

if [ ! -d $OUT_ZIP_FOLDER ]; then
   mkdir $OUT_ZIP_FOLDER
fi

if [ -f $OUT_ZIP_FOLDER/$ZIP_NAME ];
then
   echo "File $ZIP_NAME exists, moving to backup folder."
   if [ ! -d $BACKUP_FOLDER ];
   then
     mkdir $BACKUP_FOLDER
   fi
   NOW=$(date +"%m-%d-%Y")-$(date +"%T")
   mv $OUT_ZIP_FOLDER/$ZIP_NAME $BACKUP_FOLDER/$FILE_NAME-$NOW.zip
fi

find . -name ".DS_Store" -exec rm -rf {} \;
zip -r $OUT_ZIP_FOLDER/$ZIP_NAME data META-INF
