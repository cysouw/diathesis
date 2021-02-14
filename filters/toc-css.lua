-- CSS to format table of content as a hover-object to the top left of the document
-- to be used together with toc-script.js to be added at the end of the document

css = [[ 
<!-- CSS added by filter 'toc-css.lua' for TOC hovering to the side -->
<style>
body {
  padding-left: 2cm;
  padding-right: 1cm;
  transition: 0.5s;
}
nav {
  width: 1em;
  margin-left: -1.5cm;
  float: left;
  position: fixed;
  top: 0;
  bottom: 0;
  font-size: smaller;
  color: grey;
  white-space: nowrap; 
  overflow: hidden;
  overflow-y: scroll;
  transition: 0.5s;
}
nav::-webkit-scrollbar {
  display: none;
}
nav h2:before {
  content: "◀ ";
}
nav:hover {
  width: 10cm;
  padding-right: 1cm;
  background-color: rgba(255, 255, 255, 0.95);
}
nav a, nav a:visited {
  color: grey;
}
nav li {
  white-space: nowrap; 
  overflow: hidden;
  text-overflow: ellipsis;
}
nav li > a:not(:only-child):before {
  content: "▶ ";
}
nav li > a:only-child {
  margin-left: 0.75em;
}
nav li li li {
  font-size: smaller;
}
nav ul li ul  {
  visibility: hidden;
  display: none;
  margin-top: 0.2em;
  margin-bottom: 0.2em;
  transition: 0.5s;
}
.bodysmall {
  padding-left: 9cm;
  transition: 0.5s;
}
.navshown {
  margin-left: -9cm;
  width: 7cm;
  transition: 0.5s;
}
.navshown h2:before {
  content: "▶ ";
}
.navshown:hover {
  width: 10cm;
  background-color: rgba(255, 255, 255, 0.95);
}
.subShow > ul {
  visibility: visible;
  display: block;
  transition: 0.5s;
  margin-left: -1em;
}
.subShow > a:not(:only-child):before {
  content: "▼ ";
}
</style>
]]

function addCSS (meta)
  -- read current "header-includes" from metadata, or make a new one
  local current = meta['header-includes'] or pandoc.MetaList{meta['header-includes']}
  -- add css to the end of "header-includes"
  current[#current+1] = pandoc.MetaBlocks(pandoc.RawBlock("html", css))
  meta['header-includes'] = current
  -- return metadata
  return(meta)
end

return {
  { Meta = addCSS }
}


--[[
  nav ul li:hover > ul , ul li ul:hover  {
    visibility: visible;
    display: block;
  }
]]