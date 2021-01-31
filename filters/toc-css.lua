-- CSS to format table of content as a hover-object to the top left of the document

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
  white-space: nowrap; 
  overflow: hidden;
  overflow-y: scroll;
  transition: 0.5s;
}
nav h2:before {
  content: "◀ ";
}
nav:hover {
  width: 50%;
  padding-right: 1cm;
  background-color: rgba(255, 255, 255, 0.95);
}
nav li {
  white-space: nowrap; 
  overflow: hidden;
  text-overflow: ellipsis;
  margin-left: 1em;
}
nav li li li {
  margin-left: -1.5em;
  font-size: smaller;
}
nav li > a:not(:only-child):before {
  content: "▶ ";
}
nav li > a:not(:only-child):hover:before {
  content: "▼ ";
}
nav li > a:only-child {
  margin-left: 0.7em;
}
nav ul li ul  {
  visibility: hidden;
  display: none;
  margin-top: 0.2em;
  margin-bottom: 0.2em;
  transition: all 0.5s ease;
}
nav ul li:hover > ul , ul li ul:hover  {
  visibility: visible;
  display: block;
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


-- Javascript has to be added at the end through "include-after-body"
-- only for html though! gives errors with other outputs

--[[
  <style>
  .bodysmall {
    padding-left: 5cm;
    transition: 0.5s;
  }
  .navshown {
    margin-left: -5cm;
    width: 150px;
    transition: 0.5s;
  }
  .navshown h2:before {
    content: "▶ ";
  }
  .navshown:hover {
    width: 50%;
    padding-right: 1cm;
    padding-left: 1cm;
    background-color: rgba(255, 255, 255, 0.95);
  }
  </style>

  <script>
  function toggleNav() {
    var b = document.querySelector("body")
    b.classList.toggle("bodywide");
    var n = document.querySelector("nav")
    n.classList.toggle("navhidden");
  }

  document.querySelector("#toc-title").addEventListener("click", function() {
    toggleNav()
  });

  window.onresize = function() {
    if (window.innerWidth <= 800) toggleNav()
  };
  window.onload = function() {
    if (window.innerWidth <= 800) toggleNav()
  };
</script>
]]
