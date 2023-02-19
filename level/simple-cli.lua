-->-------------------------------<--
local LRHMain = {}
function LRHMain:Obfuscate(Option) 
  local Script = Option.Script
  local String = require("module/generate-strings")  
  local Letter = required("module/generate-letter") 
  local RerFile = io.open('module/reburi.lua', 'rb')
-->-------------------------------<--

-->-------------------------------<--
local Watermark = [===[--[[
  Encrypted with LuaRH - V1.0
]]--]===] 
local NSpace = "\n"
-->-------------------------------<--

-->-------------------------------<--
local Rerubi = RerFile:read'*a'
RerFile:close()
-->-------------------------------<--

-->-------------------------------<--
local StLetter = [===[function IllIlIlIlllllIlIlIll(e,...)e=x("]===]..Letter:Generate(string.len(Script) + 600)..[===[");end;]===] 
-->-------------------------------<--

-->-------------------------------<--
local ByteResult = [===[local IlIlIlIIIIIlllIlIll="";local IllIlIlIlIlIlIlIlIlIlIlIlIl="\12211188";local IllIlIlIlIlIlIlIlIlIl=load;local IllIlIlIlIllIllIlIlIl="]===]..String:AddByte(Script)..[===[";local IllIlIlIlIllIllIlIIIl=function(e)return IllIlIlIlIlIlIlIlIlIl(e)end;IllIlIlIlIllIlIIIll = IllIlIlIlIllIllIlIlIl:gsub(IllIlIlIlIlIlIlIlIlIlIlIlIl, IlIlIlIIIIIlllIlIll);IllIlIlIlIllIllIlIIIl(IllIlIlIlIllIlIIIll)()]===]
-->-------------------------------<--

-->-------------------------------<--
if Option.LogMethod == true then
  print(Watermark..NSpace..NSpace..Rerubi..ByteResult)
elseif Option.LogMethod == false then
  io.write("> Obfuscated in ⏳["..os.time().."] Seconds!\n> See Output in `result.lua`.\n")
  local Files = io.open("result.lua", "w")
  Files:write(Watermark..NSpace..NSpace..Rerubi..ByteResult)
  Files:close() 
else
  error("Please set `LogMethod` to true or false then run again!")
end
-->-------------------------------<--
end
return LRHMain
-->-------------------------------<--