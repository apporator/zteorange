require "data_assemble.common_lua"
local InstXML = ""
local ErrorXML = ""
local OutXML = ""
local tError = nil
local FP_OBJNAME = "OBJ_UPNPCONFIG_ID"
local PARA =
{
"EnableUPnPIGD",
"EnableAction",
"ADPeriod",
"TTL"
}
local FP_ACTION = cgilua.cgilua.POST.IF_ACTION
local FP_IDENTITY = cgilua.cgilua.POST._InstID
InstXML, tError = ManagerOBJ(FP_OBJNAME, FP_ACTION, FP_IDENTITY, PARA, nil, {xmlType = 1})
ErrorXML = outputErrorXML(tError)
OutXML = ErrorXML .. InstXML
outputXML(OutXML)