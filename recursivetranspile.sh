#!/bin/sh
#shell script that pass recursively all the mardown files of folders and transpile them to html, based on an html template and a custom style sheet.

# Dependency 1 : Pandoc

# Step 1 :* Modify CHANGE_PATH_TO_FOLDER to the path of the folder you want to transpile.

# Step 2 :* Modify CHANGE_PATH to the path of your template.html file.

find CHANGE_PATH_TO_FOLDER -type f -name "*.md" | while read i ; do FILE=$i; basename "$FILE"; chemin=$FILE; cd "${chemin%/*}"; f="$(basename -a $FILE)";SUBSTR=$(echo $f | cut -d'.' -f 1);pandoc  -s $i -f markdown-auto_identifiers --template CHANGE_PATH/template.html -t html -o $SUBSTR.html; done

##################
# Split code comment for developper
##################

# Change for the absolute path of the specific folder
#####
## find CHANGE_PATH_TO_FOLDER
#####		

# Find only the *.md files envoyer le résultat «pipe (|)» dans une boucle
#####
## -type f -name "*.md" |
#####

# As long as you find *.md file do
#####
## while read i ;
#####

# Put the find *.md file in FILE
#####
## do FILE=$i;
#####

# Extract the file name from the absolute path
#####
## basename "$FILE";
#####

# Affect the complete absolute path in chemin
#####
## basename "$FILE";
#####

# Change directory to the active directory
#####
## cd "${chemin%/*}";
#####

# Affect to f the file name with the .md extension
#####
## f="$(basename -a $FILE)";
#####

# Cut the extension from the file name and affect the result to SUBSTR 
#####
## SUBSTR=$(echo $f | cut -d'.' -f 1);
#####

# Modify CHANGE_PATH to the absolute path of the style sheet 
#####
## pandoc  -s $i -f markdown-auto_identifiers --template CHANGE_PATH/template.html -t html -o $SUBSTR.html; done
#####