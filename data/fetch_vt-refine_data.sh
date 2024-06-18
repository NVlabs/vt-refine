#!/bin/bash

DIR="$( dirname "${BASH_SOURCE[0]}" )"
cd $DIR

FILE=vt-refine_data.tar.gz
ID=1es4Vh0QTSco1kyDwHobIcL0uxAvo1RBf
CHECKSUM=47d51d1ab5d09d4fee332c0b58139526

if [ -f $FILE ]; then
  echo "File already exists. Checking md5..."
  os=`uname -s`
  if [ "$os" = "Linux" ]; then
    checksum=`md5sum $FILE | awk '{ print $1 }'`
  elif [ "$os" = "Darwin" ]; then
    checksum=`cat $FILE | md5`
  fi
  if [ "$checksum" = "$CHECKSUM" ]; then
    echo "Checksum is correct. No need to download."
    exit 0
  else
    echo "Checksum is incorrect. Need to download again."
  fi
fi

echo "Downloading vt-refine data (909M)..."

gdown $ID

echo "Unzipping..."

tar zxvf $FILE

echo "Done."
