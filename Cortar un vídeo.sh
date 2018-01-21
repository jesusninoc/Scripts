#!/bin/bash

if [ "$1" == "" ]
then
	echo Usar: $0 video_entrada hh:mm:ss.xxx hh:mm:ss.xxx
	exit 1
fi

IFS_OLD=$IFS
IFS='
'

salida=`basename $1 | cut -f1 -d'.'`
echo Procensando $1 a ${salida}.mp4

ffmpeg -y -i $1 -ss $2 -t $3 -acodec copy -vcodec copy ${salida}.mp4
