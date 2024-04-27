#!/bin/bash
for file in *.md; do
  filename="${file%.md}"
  markdown2html --source "$file" --destination "${filename}.html"
done

