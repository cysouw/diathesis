#!/bin/bash

pandoc c* -f markdown -o mcysouwDiathesisManuscript.pdf\
	--pdf-engine=xelatex \
	--filter=pandoc-crossref \
	--filter=pandoc-citeproc
