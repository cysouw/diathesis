#!/bin/bash

cd `dirname "$0"`

pandoc text/c* -f markdown -o cysouwDiathesisManuscript.pdf\
	--pdf-engine=xelatex \
	--filter=pandoc-crossref \
	--filter=pandoc-citeproc
