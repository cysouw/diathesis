#!/bin/bash

cd /Users/cysouw/Dropbox/Linguistics/Scientific\ Production/1.\ Books/Diathesis/text

pandoc c* -f markdown -o mcysouwDiathesisManuscript.pdf\
	--pdf-engine=xelatex \
	--filter=pandoc-crossref \
	--filter=pandoc-citeproc
