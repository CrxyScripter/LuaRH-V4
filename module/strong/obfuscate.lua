local Strong = {}

function Strong:Obfuscator(Option)
  local function getmodule()
      local mpath = "module/strong/obfuscate-cli.lua"
	  local mloaded, module = pcall(function()
		  return dofile(mpath)
	  end)
	  if not mloaded or module == nil then
		  if not mloaded then
			  print(module)
		  end
		  return getmodule()
	  else
		  return module
	  end
  end

  local M_ = getmodule()

  if not (M_.crypt ~= nil and type(M_.crypt) == 'function') then
	  return nil
  end

  local function getRfile()
	  local mpath = Option.Script
	  local mloaded, f, err = pcall(function()
		  return io.open(mpath, "rb")
	  end)
	  if not mloaded or f == nil then
		  if not mloaded then
			  print(f)
		  end
		  return getRfile()
	  else
		  return f
	  end
  end

  local obrfile = getRfile()
  local obrcode = obrfile:read("*a")
  obrfile:close()

  local function getWfile()
	  local mpath = "result.lua"
	  local mloaded, f, err = pcall(function()
		  return io.open(mpath, "w")
	  end)
	  if not mloaded or f == nil then
		  if not mloaded then
			  print(f)
		  end
		  return getWfile()
	  else
		  return f
	  end
  end

  local wfile = getWfile()

  local com_ = Option.Comment
  if com_ == "" then
	  com_ = "Encrypted with LuaRH"
  end

  local varcom_ = Option.VariableDesc
  if varcom_ == "" then
	  varcom_ = "LuaRH Obfuscator"
  end

  local varnam_ = Option.VariableName
  if varnam_ == "" then
	  varnam_ = "LuaRH"
  end

  local cryvar_ = Option.EncryptVar
  local cryyes = cryvar_

  local options_ = {
	  comment = com_,
	  variablecomment = varcom_,
	  cryptvarcomment = cryyes,
	  variablename = varnam_,
  }

  local memoryleakerlolwhat = M_(obrcode,options_)
  if Option.Method == true then
    print(memoryleakerlolwhat)
  elseif Option.Method == false then
    io.write("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
    io.write("> ғɪʟᴇ ᴏʙғᴜsᴄᴀᴛᴇᴅ ɪɴ ⏳["..os.clock().."] sᴇᴄᴏɴᴅs")
    io.write("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n")
    
    wfile:write(memoryleakerlolwhat)
    wfile:close()
  else
    error("ʏᴏᴜ ғᴏʀɢᴇᴛ ᴛᴏ ᴀᴅᴅ [ᴍᴇᴛʜᴏᴅ] ᴀᴅᴅ ɪᴛ ᴀɴᴅ sᴇᴛ ɪᴛ ᴛᴏ ғᴀʟsᴇ ᴏʀ ᴛʀᴜᴇ")
  end
end

return Strong