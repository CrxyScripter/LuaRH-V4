local LRH = {}

function LRH:AddByte(v, e)
  local thing = v
  local encoded = thing:gsub(".", function(bb) return "\\"..e.."\\".. bb:byte().."\\"..e end) or thing .. "\""
  return encoded
end

return LRH