# magic-markdown-html
Shell Script that transform markdown's directories to html page. Check reload and recursive script.

The first shell script check for file change of a markdown (.md) file and transform it in html on the fly.

The second script scan directories in order to find markdowm files (.md) and transform all of them in html files.

The script use a Pandoc as the converter, as a default setting the script output clean semantic html without id in the various header level \<h1>, \<h2> etc.

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
## Use the script for recursive convertion of all markdown
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
**Note 1 :&nbsp;** The «style.css» file should be an absolute url so the html files in «subfolder» will have the right style sheet.

**Note 2 :&nbsp;** The «style.css» file should be an absolute url so the .css linked to the html files will work on all folder files in «subfolder».