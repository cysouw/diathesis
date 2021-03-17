--[[

Change crossref IDs to real numbers as used in final output

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

function changeHeaderID (head)
  if head.classes[1] ~= "unnumbered" then
    head.identifier = "sec:"..tostring(head.attributes.label)
  end
  return head
end

function changeTabID (div)
  if div.content[1].tag == "Table" then
    div.identifier = "tbl:"..tostring(div.attributes.label)
  end
  return div
end

function changeFigID (para)
  if para.content[1].tag == "Image" then
    para.content[1].identifier = "fig:"..tostring(para.content[1].attributes.label)
  end
  return para
end

function changeLinks (link)
  if string.sub(link.target,1,1) == "#" then
    local kind = string.match(link.target,"^.-:")
    if kind ~= nil then
      link.target = kind..pandoc.utils.stringify(link.content)
    end
  end
  return link
end

--------------------
-- basic Pandoc loop
--------------------

return {
  { Header = changeHeaderID },
  { Div = changeTabID },
  { Para = changeFigID },
  { Link = changeLinks }
}
