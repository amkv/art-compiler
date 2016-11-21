#!/bin/bash
# kalmykov.artem@gmail.com
# Student at 42 US, Fremont
# Computer science: Programming

# The name of the program
NAME=a.out

# Files for compiling
# add new CFILES="main.c second.c" or add new line CFILES+="third.c"
CFILES=sort_list.c

# Preset argument
# ARG=file.txt or ARG="this is my test string"
ARG=

# Usefull flags
WFLAGS="-Wall -Wextra -Werror"

# Memory sanitizer flags
MFLAGS="-I. -fsanitize=address"

# Other flags OFLAGS="-I"
OFLAGS=

# cat -e 
CAT="cat -e"

# Compiler
CC=gcc

# Compile
COMPILE="$CC $WFLAGS $MFLAGS $OFLAGS $CFILES -o $NAME"

# colors ANSI escape codes:
RED='\033[0;31m'
CLN='\033[0m'
GRN='\033[32;1m'
BLU='\033[1;34m'
WHT='\033[1m'

# Date variable for log file
DATE=$(date)

# Logs and macro LOG "text"
LOGS=logs_compiler.txt
LOG()
{
	echo -e "${DATE}\t$@" >> $LOGS
}

# First launch, creating log file
IS_FILE_EXIST=1
if [ -a $LOGS ]
then
	LOG "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
	LOG "starting..."
else
	echo -e $WHT"\n\t>>> привет! this is your first launch, read the usage <<< \n"$CLN
	IS_FILE_EXIST=0
	touch $LOGS
	LOG "logs file created"
fi

# usage info
if [ "$1" == "--help" -o "$1" == "-h" -o $IS_FILE_EXIST == 0 ]
then
	LOG "you have read about how to use this script"
	echo -e "usage: ${WHT}art compiler${CLN}\n\tq.sh script helps you to compile and launch your program"
	echo -e "\twith 0 arguments, with multiple arguments, with preset (ARG variable) argument"
	echo -e "\tand save history of your compilations and launches"
	echo -e "\tdo not forget to configure...\n"
	echo -e $WHT"q.sh$CLN arg1 arg2 arg3 ..." "\t\tfor arguments"
	echo -e $WHT"q.sh"$CLN "\t\t\t\t\tfor preset argument"
	echo -e $WHT"q.sh -0"$CLN "\t\t\t\tfor NO arguments"
	echo -e $WHT"q.sh -c"$CLN"\t\t\t\t\tfor colored compiler errors"
	echo -e $WHT"q.sh -h"$CLN "\t\t\t\tor --help to show this help"
	echo -e "\n"
	exit 0
fi

# If the output file exist - delete it before new compiling
if [ -a $NAME ]
then
	rm -rf $NAME
	LOG "${NAME} executable deleted"
else
	LOG "${NAME} does not exist"
fi

# clear the screen
# clear

# Compiling 
# add new Flags here
LOG "$COMPILE"
if [ "$1" == "-c" ]
then
	LOG "output color compiler errors"
	$COMPILE
else
	$COMPILE 2>&1 | tee -a $LOGS
fi

# IF compiled, IF No arguments, IF 0 to 3... arguments, IF preset argument value
if [ -a $NAME ]
then
	echo -e $BLU"compiled"$CLN
	LOG "${NAME} successfully compiled"
	if [ "$#" -gt 0 ]
	then
		if [ "$1" == "-0" ]
		then
			echo -e $GRN"NO arguments"$CLN
			LOG "running ${NAME} without arguments\n"
			./$NAME | tee -a $LOGS
			exit 0
		fi
		LOG "running ${NAME} with $# arguments: $@\n"
		echo -e $GRN$# "argument(s):"$CLN $@
		./$NAME $@ | tee -a $LOGS
	else
		echo -e $GRN"argument:"$CLN $ARG
		LOG "running ${NAME} with 1 preset argument: $ARG\n"
		./$NAME "$ARG" | tee -a $LOGS
	fi
else
	LOG "error compiling"
	echo -e $RED"compiling error"$CLN
fi

