-- adapted from https://girondi.net/post/pandoc_notes/

function colorHead (head)
  color = head.attributes['color']

  -- if no color attribute, return unchange
  if color == nil then return head end

  -- transform to style="color:red;"
  if FORMAT:match 'html' then
    -- remove color attributes
    head.attributes['color'] = nil
    -- use style attribute instead
    head.attributes['style'] = 'color:' .. color .. ';'
  elseif FORMAT:match 'latex' then
    -- remove color attributes
    head.attributes['color'] = nil
    -- encapsulate in latex code
    table.insert(
      head.content, 1,
      pandoc.RawInline('latex', '\\textcolor{'..color..'}{')
    )
    table.insert(
      head.content,
      pandoc.RawInline('latex', '}')
    )
  end
  
  return head
end

return {
  { Header = colorHead }
}
