#!/bin/sh
#shell script that watch the modification of markdown files and transpile them to html, based on an html template and a custom style sheet.

# Dependency 1 : fswatch
# Dependency 1 : Pandoc

# Step 1 : Cd to the working directory, the folder where you want to watch the .md files and transpile on the fly.

# Step 2 : Modify #CHANGE_PATH# to the absolute path of your template.html file.

fswatch -r -e ".*" -i ".*/[^.]*\\.md$" . | while read i ; do FILE=$i; basename "$FILE"; chemin=$FILE; cd "${chemin%/*}"; f="$(basename -a $FILE)";SUBSTR=$(echo $f | cut -d'.' -f 1);pandoc  -s $i -f markdown-auto_identifiers --template CHANGE_PATH/template.html -t html -o $SUBSTR.html; done

# Step 3 : Run the shell script.

##################
# Split code comment for developper
##################

# Recursive watch only markdown files
#####
## fswatch -r -e ".*" -i ".*/[^.]*\\.md$" . |
#####

# Do someting while reading all the files
#####
# while read i ;	do
#####

# Affect complete path of file in FILE
#####
# FILE=$i;
#####

# Change directory to current, split down file name from path
#####
# cd "${chemin%/*}";
#####

# Affect to a variable the file name split from the path
##### 
# f="$(basename -a $FILE)";
#####

# Split the extension from the file name and affect to SUBSTR
#####
# SUBSTR=$(echo $f | cut -d'.' -f 1);
#####

# start Pandoc to the modificated file
#####
# pandoc  -s $i -f markdown-auto_identifiers --template CHANGE_PATH/template.html -t html -o $SUBSTR.html; done
#####