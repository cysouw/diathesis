-- use strikeout markup with ~~ for smallcaps
-- add "--lua-filter=smallcaps.lua" to pandoc

makelower = {
  Str = function (s)
    return pandoc.Str(pandoc.text.lower(s.text))
  end
}

function Strikeout(elem)
  elem = pandoc.walk_inline(elem, makelower)
  return pandoc.SmallCaps(elem.content)
end


