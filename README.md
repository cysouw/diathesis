# Encyclopaedia of German diatheses

Michael Cysouw <cysouw@mac.com>

This is the manuscript of [LSP Volume 374](https://langsci-press.org/catalog/book/374). The first version is published, this repository is the development version of any upcoming future edition. Please do not cite this version, but only cite the officially published version as linked above.

The easiest way to read the current development version is by using the latest HTML or PDF output included in the [`/docs`](docs) directory of this repository. The HTML output can be directly accessed [here](https://cysouw.github.io/diathesis/).

This (large) scientific book is completely written in markdown, which has been amazingly extended by the framework provided by [Pandoc](https://pandoc.org/index.html), see the [`tohtml.yaml`](tohtml.yaml) file for my setup. To make for a cleaner setup, I have decided to separate the metadata into different files, see the files in [`/settings`](settings).

Most importantly, this manuscript uses various filters to allow a scientific workflow.  In this way, the source of the manuscript is easy to read and type (see the raw files in [`/text`](text)), but still provide good output formatting. Pandoc + filters transform this raw text to many output formats with reasonable accuracy (e.g. see the html output as linked to above). 

The following Pandoc filters are used to assist the preparation of this manuscript:

- [`pandoc-ling`](https://github.com/cysouw/pandoc-ling) for the layout, numbering and cross-reference of linguistic examples.
- [`pandoc-crossref`](https://github.com/lierdakil/pandoc-crossref) for cross-reference to sections, figures and tables.
- [`crossref-adapt`](https://github.com/cysouw/crossref-adapt) for changing the IDs of these cross-references, so they can transparantly be cited.
- [`citeproc`](https://github.com/jgm/citeproc) for citation and bibliography, using [`CSL`](https://www.zotero.org/styles) ('citations style language') for rendering
- [`count-para`](https://github.com/cysouw/count-para) to add numbers to text paragraphs. This becomes important as scientific writing has to move away from a page-based citation mechanism. As this book shows, it is now technically feasible to publish in many formats in parallel, and adaptive design makes page-numbering obsolete. Refer to a specific paragraph for example as (Cysouw 2021: #2.7). Adding the suffix to a stable link directly redirects the reader to the paragraph, e.g. (cysouw 2021: [#2.7](https://cysouw.github.io/diathesis/fulltext.html#2.7))!
- [`toc-css`](https://github.com/cysouw/toc-css) adds some extra CSS and Javascript for HTML output to format the table of contents.
- [`strikeout-to-smallcaps`](/filters/strikeout-to-smallcaps.lua) to use the commonmark-markup for  ~~strikeout~~ (using `~~`) to indicate small caps (I never use strikeout, but often use small caps). This filter simply makes this change when processing the file for output.
- [`inline-footnotes`] to include the footnotes inline in the HTML text. Some CSS is added to make the footnotes expand when clicked.
- [`setdata`](filters/setdate.lua) to add the current date. This is only used in the development version.


