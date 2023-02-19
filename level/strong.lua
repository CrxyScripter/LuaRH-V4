local Strong = {}

function Strong:Obfuscate(Option)
  local StrongCli = require("module/strong/obfuscate")
  StrongCli:Obfuscator({
      Script = Option.Script,
      Comment = Option.WaterMark,
      VariableName = Option.VariableName,
      VariableDesc = Option.VariableDesc,
      EncryptVar = Option.EncryptVar,
      Method = Option.Method
  })
end

return Strong
