# magic-markdown-html
Shell Script that transform markdown's directories to html page. Check reload and recursive script.

The first shell script check for file change of a markdown (.md) file and transform it in html on the fly.

The second script scan directories in order to find markdowm files (.md) and transform all of them in html files.

The script use Pandoc as the converter, as a default setting it output a clean semantic html without id in the various header level \<h1>, \<h2> etc.

## Pandoc Intallation

>Install Pandoc [Official installation site](https://pandoc.org/installing.html)

## fswach installation


```
brew install fswatch
```
## Example folder to convert
style.css
```
example
├── pageone.md
├── pagetwo.md
└── subfolder
    ├── pagefour.md
    └── pagetree.md
```
## Add a style sheet and template.html
```
example
├── style.css
├── template.html
├── pageone.md
├── pagetwo.md
├── style.css
└── subfolder
    ├── pagefour.md
    └── pagetree.md
```
## Use the script
The first script recusively pass all the folder and sub folder in order to find .md and transpile them to html.  
The second one check for modification on a folder and transpile it to html on the fly.

*Here the folder transpiled with html files* 

```
example
├── style.css
├── template.html
├── pageone.md
├── pageone.html
├── pagetwo.md
├── pageone.html
├── style.css
└── subfolder
    ├── pagefour.md
    ├── pagefour.html
    ├── pagetree.md
    └── pagetree.html
```
**Note 1 :&nbsp;** The «style.css» file should be an absolute url so the html files in «subfolder» will have the right style sheet, no need to render folder by folder with a diferent path for the css file in the template.

**Note 2 :&nbsp;** The «style.css» file path should be an absolute url so the .css of an external style sheet like this « https://example.com/style.css » linked to the html files will work on all folder and files in «subfolder».
## Usage
When fswatch and Pandoc are installed, in order to run the script correctly you have to change the path (indicated with the word CHANGE_PATH... in the script) accordingly to the absolute path in your system.

## Script 1 watch a folder

*Step 1 :* Cd to the working directory, the folder where you want to watch the .md files and transpile on the fly.
```
cd working_directory
```
*Step 2 :* Modify CHANGE_PATH to the path of your template.html file.
```
fswatch -r -e ".*" -i ".*/[^.]*\\.md$" . | while read i ; do FILE=$i; basename "$FILE"; chemin=$FILE; cd "${chemin%/*}"; f="$(basename -a $FILE)";SUBSTR=$(echo $f | cut -d'.' -f 1);pandoc  -s $i -f markdown-auto_identifiers --template CHANGE_PATH/template.html -t html -o $SUBSTR.html; done
```
*Step 3 :* Run the script, by either «copy paste» it in the terminal or make a shell script and run it accordingly, in order to stop the script type \<ctrl> D.
## Script 2 recursively transpile a folder
*Step 1 :* Modify CHANGE_PATH_TO_FOLDER to the path of the folder you want to transpile.

*Step 2 :* Modify CHANGE_PATH to the path of your template.html file.
```
find CHANGE_PATH_TO_FOLDER -type f -name "*.md" | while read i ; do FILE=$i; basename "$FILE"; chemin=$FILE; cd "${chemin%/*}"; f="$(basename -a $FILE)";SUBSTR=$(echo $f | cut -d'.' -f 1);pandoc  -s $i -f markdown-auto_identifiers --template CHANGE_PATH/template.html -t html -o $SUBSTR.html; done
```
*Step 3 :* Run the script, by either «copy paste» it in the terminal or make a shell script and run it accordingly, the script will stop ounce all the folder and subfolder are passed with the find command.