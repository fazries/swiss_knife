#!/bin/bash

if [ "$1" != "" ] ; then
 FILE=$1
 ERROR=$2

 echo $FILE $ERROR
 grep $ERROR $FILE

fi

