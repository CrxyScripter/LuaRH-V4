local Simple = {}

function Simple:Obfuscate(Option) 
  local Script = Option.Script
  local ByteTypes = Option.Bytes
  local Start = [===[return(function(e,...)]===]
  local End = [===[end)(getfenv, 0)]===]
  local String = require("module/simple/generate-strings")  

  local Comment = [===[--[[\n  ]===]..Option.WaterMark..[===[\n]]--]===]
  local NSpace = "\n"

  local ByteResult = [===[local IlIlIlIIIIIlllIlIll="";local IllIlIlIlIlIlIlIlIlIlIlIlIl="\]===]..ByteTypes..[===[";local IllIlIlIlIlIlIlIlIlIl=load;local IllIlIlIlIllIllIlIlIl="]===]..String:AddByte(Script, ByteTypes)..[===[";local IllIlIlIlIllIllIlIIIl=function(e)return IllIlIlIlIlIlIlIlIlIl(e)end;IllIlIlIlIllIlIIIll = IllIlIlIlIllIllIlIlIl:gsub(IllIlIlIlIlIlIlIlIlIlIlIlIl, IlIlIlIIIIIlllIlIll);IllIlIlIlIllIllIlIIIl(IllIlIlIlIllIlIIIll)()]===]

  if Option.Method == true then
    print(Comment..NSpace..NSpace..Start..ByteResult..End)
  elseif Option.Method == false then
    io.write("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
    io.write("> ғɪʟᴇ ᴏʙғᴜsᴄᴀᴛᴇᴅ ɪɴ ⏳["..os.clock().."] sᴇᴄᴏɴᴅs")
    io.write("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n")
    
    local Files = io.open("result.lua", "w")
    Files:write(Comment..NSpace..NSpace..Start..ByteResult..End)
    Files:close() 
  else
    error("ʏᴏᴜ ғᴏʀɢᴇᴛ ᴛᴏ ᴀᴅᴅ [ᴍᴇᴛʜᴏᴅ] ᴀᴅᴅ ɪᴛ ᴀɴᴅ sᴇᴛ ɪᴛ ᴛᴏ ғᴀʟsᴇ ᴏʀ ᴛʀᴜᴇ")
  end
end

return Simple
