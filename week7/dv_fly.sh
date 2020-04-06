#!/bin/bash
# Date: 3/31/2020
# Author: Daniel Vogel
# Class: BIFX551
#
# Assignment
#
# For your assignment this week, you will download the FruitFlySeq folder and unzip it. 
# Use terminal commands to view the contents of the folder, and use grep to find the
# number of sequences GATTACA in each file. You will turn in a textfile containing:
#
#    the wordcounts for each file
#
#    the shell commands you used to navigate to the folder and grep the files
#    Note, use '>' and '>>' to create and append to a text file like initials_my_homework.
#    txt Below is the bash script used to create the sample of fruit fly chromosome sequences
#
# arr=$(grep chromosome fruitfly.fna|grep -Ev "X|Y|CEN" |cut -d' '  -f5)
# for a in $arr;do sed -n "/chromosome $a/,/>/p" < fruitfly.fna | sed '1d;$d' > $a.txt;done;
# mkdir FruitFlySeq
# for a in $arr;do mv $a.txt FruitFlySeq/$a.txt;done;
# gzip -r FruitFlySeq
#
#
# My Steps:
# 1. Used git clone to download all the files.
# 2. Wrote the following script commands to complete the tasks
#
# hw is the filename for the output to be turned in.
hw="/home/centos/scripts/dtv_my_homework.csv" 
pathtofly="/home/centos/scripts/BIFX551/week7/FruitFlySeq"
# put the files into a variable for looping through the filenames
echo $pathtofly
target="GATTACA"
cd $pathtofly
seqfiles=$(ls)
echo the folder $pathtofly contains: $seqfiles
#
echo "Results are save in $hw in .csv format in addition to being printed on screen"
echo "Searching for $target in each file. Ignoring case. Multiple occurences in a line will be counted."
echo -n "Processing files" 
echo "filename,occurences"> $hw
for seq in $seqfiles;do 
  #  use the -i option in grep to ignore case.  use the -o option to count multiples in a single line
  qtyfound=$(zgrep -io $target $seq|wc -l)
  echo "$seq,$qtyfound">> $hw
  echo -n "."
done
echo "done"
cat $hw
