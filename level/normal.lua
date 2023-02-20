local Normal = {}

function Normal:Obfuscate(Option)
  local script = Option.Script
  local RerFile = io.open('module/reburi.lua', 'rb')
  local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/' -- You will need this for encoding/decoding

  local Rerubi = RerFile:read'*a'
  RerFile:close()
  
  function enc(data)
    return ((data:gsub('.', function(x) 
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
  end
 
  local function splitByChunk(text, chunkSize)
    local s = {}
      for i=1, #text, chunkSize do
        s[#s+1] = text:sub(i,i+chunkSize - 1)
      end
    return s
  end
 
  local data = tostring(script:gsub(".", function(bb) return "\\" .. bb:byte() end) or script .. "\"")
  local encdata = tostring(enc(data))
  local splitdata = splitByChunk(encdata, 5)
 
  local b64table = "local _0x38ndf = {"
  local b64dec = "function _0x93mdw(a)a=string.gsub(a,'[^'..b..'=]','')return a:gsub('.',function(c)if c=='='then return''end;local d,e='',b:find(c)-1;for f=6,1,-1 do d=d..(e%2^f-e%2^(f-1)>0 and'1'or'0')end;return d end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(c)if#c~=8 then return''end;local g=0;for f=1,8 do g=g+(c:sub(f,f)=='1'and 2^(8-f)or 0)end;return string.char(g)end)end"
  local onescript = "do local _0x62tdg='' for i,v in pairs(_0x38ndf) do _0x62tdg=_0x62tdg..v end local _0x29dke = (_0x47fjs(_0x93mdw(_0x62tdg), ' ')[1]) _0x29dke='load(\"\'.._0x29dke..\'\")()' load(_0x29dke)() end end"
  local b = "do local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'"
  local prescript = 'function _0x47fjs(a,b)if b==nil then b="%s"end;local c={}for d in string.gmatch(a,"([^"..b.."]+)")do table.insert(c,d)end;return c end'.." "
 
  for i,v in pairs(splitdata) do
    if i ~= #splitdata then
      b64table = b64table.."\""..v.."\""..","
    else
      b64table = b64table.."\""..v.."\""
    end
  end
 
  b64table = b64table.."}"
 
  if Option.Method == true then
    print([===[--[[\n  ]===]..Option.WaterMark..[===[\n]]--]===].."\n".."\n"..Rerubi..b.." "..b64table.." "..b64dec.. " "..prescript.." "..onescript)
  elseif Option.Method == false then
    io.write("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
    io.write("> ғɪʟᴇ ᴏʙғᴜsᴄᴀᴛᴇᴅ ɪɴ ⏳["..os.clock().."] sᴇᴄᴏɴᴅs")
    io.write("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n")
    
    local Files = io.open("result.lua", "w")
    Files:write([===[--[[\n  ]===]..Option.WaterMark..[===[\n]]--]===].."\n".."\n"..Rerubi..b.." "..b64table.." "..b64dec.. " "..prescript.." "..onescript)
    Files:close() 
  else
    error("ʏᴏᴜ ғᴏʀɢᴇᴛ ᴛᴏ ᴀᴅᴅ [ᴍᴇᴛʜᴏᴅ] ᴀᴅᴅ ɪᴛ ᴀɴᴅ sᴇᴛ ɪᴛ ᴛᴏ ғᴀʟsᴇ ᴏʀ ᴛʀᴜᴇ")
  end
end

return Normal
