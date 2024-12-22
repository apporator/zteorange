require "data_assemble.common_lua"
local InstXML = ""
local ErrorXML = ""
local OutXML = ""
local tError = nil
local FP_OBJNAME = "OBJ_FW_TIMECTRL_ID"
local PARA_Time =
{
"Enable",
"Time",
}
local FP_ACTION = cgilua.cgilua.POST.IF_ACTION
local FP_IDENTITY = cgilua.cgilua.POST._InstID
InstXML, tError = ManagerOBJ(FP_OBJNAME, FP_ACTION, FP_IDENTITY, PARA_Time)
ErrorXML = outputErrorXML(tError)
OutXML = ErrorXML .. InstXML
outputXML(OutXML)
