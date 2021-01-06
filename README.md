# A survey of German diatheses

Michael Cysouw <cysouw@mac.com>

This is a developing manuscript of a book about German diatheses. The current status is very rough, and consists of many notes to be developed further. Chapter 1-6 are already in useable shape.

The easiest way to read the current version is by using the latest HTML output, which can be directly accessed [here](https://rawgit.com/cysouw/diathesis/master/cysouwDiathesisManuscript.html).

This (large) scientific book is completely written in markdown, which has been amazingly extended by the framework provided by [Pandoc](https://pandoc.org/index.html), see the `default.yaml` and `metadata.yaml` files for the setup. Most importantly, this manuscript uses various filters to allow a scientific workflow.  In this way, the source of the manuscript is easy to read and type (see the files in `/text`) and can be transformed to many output formats with reasonable accuracy (e.g. see the html output as linked to above). 

The following Pandoc filters are used to assist the preparation of this manuscript:
- [`pandoc-ling`](https://github.com/cysouw/pandoc-ling) for the layout, numbering and cross-reference of linguistic examples.
- [`pandoc-crossref`](https://github.com/lierdakil/pandoc-crossref) for cross-reference to sections, figures and tables.
- [`citeproc`](https://github.com/jgm/citeproc) for citation and bibliography.
- [`count-para`](/filters/count-para.lua) to add numbers to text paragraphs. This becomes important as scientific writing has to move away from a page-based citation mechanism. As this book shows, it is now technically feasible to publish in many formats in parallel, and adaptive design makes page-numbering obsolete.
- [`strikeout-to-smallcaps`](/filters/strikeout-to-smallcaps.lua) to use ~~strikeout~~ to indicate small caps (I never user strikeout, but often use small caps).
-  [`setdata`](filters/setdate.lua) to add the current date
-  
  

