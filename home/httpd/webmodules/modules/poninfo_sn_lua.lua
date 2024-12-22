require "data_assemble.common_lua"
local cgilua = cgilua.cgilua
local ErrorXML = ""
local InstXML = ""
local OutXML = ""
local tError = nil
local FP_OBJNAME = "OBJ_SN_INFO_ID"
local PARA =
{
"ViewName",
"Sn",
"Pwd",
"IsInform"
}
local FP_ACTION = cgilua.POST.IF_ACTION
local FP_IDENTITY = cgilua.POST._InstID
local para_table = {}
para_table.para = PARA
if "21" ~= env.getenv("CountryCode") then
para_table.encrypt = {"Pwd"}
end
local function callback(t)
if "21" ~= env.getenv("CountryCode") then
t.Pwd = nil
end
return true
end
InstXML, tError = ManagerOBJ(FP_OBJNAME, FP_ACTION, FP_IDENTITY, para_table, tError, nil, callback)
ErrorXML = outputErrorXML(tError)
OutXML = ErrorXML .. InstXML
outputXML(OutXML)
