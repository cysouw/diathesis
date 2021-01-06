--[[

Make all 'regular' paragraphs into a div and assign a numeric ID
For HTML, format this number in the left margin

Copyright © 2021 Michael Cysouw <cysouw@mac.com>

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
]]

count = 0
chapter = 0

function countPara (doc)

  for i=1,#doc.blocks do

    if  doc.blocks[i].tag == "Header" and 
        doc.blocks[i].level == 1 and
        doc.blocks[i].classes[1] ~= "unnumbered"
      then
        chapter = chapter + 1
        count = 0
    elseif doc.blocks[i].tag == "Para" then
      count = count + 1		
      doc.blocks[i] = pandoc.Div( doc.blocks[i], 
              pandoc.Attr(chapter.."."..count, {"paragraph-count"}))
    end

  end
  return doc
end

function formatNumber (div)

  if FORMAT:match "html" then
    if div.classes[1] == "paragraph-count" then
      local string = "["..div.identifier.."]"
      local number = pandoc.Superscript(string)
      --for i=1,3 do
        table.insert(div.content[1].content, 1, pandoc.Space())
      --end
      table.insert(div.content[1].content, 1, number)
      local points = string.len(div.identifier)*5 + 10
      div.attributes = {style = "text-indent: -"..points.."px;"}
    end
  end
  
  return(div)
end

function addGlobalFormatting (meta)

  local tmp = meta['header-includes'] or 
              pandoc.MetaList{meta['header-includes']}
  
  if FORMAT:match "html" then
    local css = [[ 
    <style>
    .paragraph-count sup { 
      color: grey;
      font-size: x-small;
    }
    </style>
    ]]
    tmp[#tmp+1] = pandoc.MetaBlocks(pandoc.RawBlock("html", css))
    meta['header-includes'] = tmp
  end

  return(meta)
end

return {
  { Pandoc = countPara },
  { Div = formatNumber },
  { Meta = addGlobalFormatting }
}
