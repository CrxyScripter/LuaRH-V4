local SimpleEncrypt = require("level/simple")
local NormalEncrypt = require("level/normal")
local StrongEncrypt = require("level/strong")

function wait(v)
    local r = os.time()
    repeat until os.time() > r + v
end

io.write("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
io.write("> ᴛʜᴀɴᴋ ʏᴏᴜ ғᴏʀ ᴜsɪɴɢ ʟᴜᴀʀʜ ᴏʙғᴜsᴄᴀᴛᴏʀ")
io.write("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n")

wait(0.5)

io.write("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
io.write("> sᴇʟᴇᴄᴛ ᴇɴᴄʀʏᴘᴛɪᴏɴ ʟᴇᴠᴇʟ [1 = sɪᴍᴘʟᴇ - 2 = ɴᴏʀᴍᴀʟ - 3 = sᴛʀᴏɴɢ]")
io.write("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n> ")

local levels = io.read()
if string.match(levels, 1) then
  SimpleLevel = true
  io.write("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
  io.write("> sᴇᴛ ᴇɴᴄʀʏᴘᴛɪᴏɴ ʟᴇᴠᴇʟ ᴛᴏ [sɪᴍᴘʟᴇ]")
  io.write("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n")
elseif string.match(levels, 2) then
  NormalLevel = true
  io.write("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
  io.write("> sᴇᴛ ᴇɴᴄʀʏᴘᴛɪᴏɴ ʟᴇᴠᴇʟ ᴛᴏ [ɴᴏʀᴍᴀʟ]")
  io.write("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n")
elseif string.match(levels, 3) then
  StrongLevel = true
  io.write("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
  io.write("> sᴇᴛ ᴇɴᴄʀʏᴘᴛɪᴏɴ ʟᴇᴠᴇʟ ᴛᴏ [sᴛʀᴏɴɢ]")
  io.write("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n")
else
  NormalLevel = true
  io.write("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
  io.write("> ᴡʀᴏɴɢ sᴇɴᴅ ᴀɴsᴡᴇʀ, ᴀᴜᴛᴏᴍᴀᴛɪᴄ sᴇᴛ ᴇɴᴄʀʏᴘᴛɪᴏɴ ʟᴇᴠᴇʟ ᴛᴏ [ɴᴏʀᴍᴀʟ]")
  io.write("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n")
end

io.write("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
io.write("> ғɪʟᴇ ʏᴏᴜ ᴡᴀɴᴛ ᴛᴏ ᴏʙғᴜsᴄᴀᴛᴇ [ᴇxᴀᴍᴘʟᴇ : ᴍʏsᴄʀɪᴘᴛ.ʟᴜᴀ]")
io.write("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n> ")

local UploadFile = io.read()
io.write("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
io.write("> sᴇᴛ ғɪʟᴇ ᴛᴏ ᴏʙғᴜsᴄᴀᴛᴇ ["..UploadFile.."]")
io.write("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n")

if SimpleLevel == true then
  local onlynumber = io.read()
  local Amount = tonumber(onlynumber)
  if Amount == nil then
    YourBytes = "112145"
    io.write("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
    io.write("> ɪɴᴠᴀʟɪᴅ ʙʏᴛᴇs, ᴀᴜᴛᴏᴍᴀᴛɪᴄ sᴇᴛ ᴛᴏ [112145]")
    io.write("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n")
  else
    YourBytes = Amount
    io.write("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
    io.write("> sᴇᴛ ʙʏᴛᴇs ᴛᴏ ["..Amount.."]")
    io.write("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n")
  end
end

local File_To_Obf = io.open(UploadFile)
local YourFile = File_To_Obf:read'*a'
File_To_Obf:close()

if SimpleLevel == true then
  SimpleEncrypt:Obfuscate({
  	Script = YourFile,
      Bytes = YourBytes,
      WaterMark = "Encrypted with LuaRH",
      Method = false
  })
elseif NormalLevel == true then
  NormalEncrypt:Obfuscate({
  	Script = YourFile,
      WaterMark = "Encrypted with LuaRH",
      Method = false
  })
elseif StrongLevel == true then
  StrongEncrypt:Obfuscate({
  	Script = UploadFile,
      WaterMark = "Encrypted with LuaRH",
      VariableName = "LuaRH",
      VariableDesc = "LuaRH Obfuscator",
      EncryptVar = false,
      Method = false
  })
end
