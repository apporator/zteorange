require "data_assemble.common_lua"
local ErrorXML = ""
local InstXML = ""
local OutXML = ""
local tError = nil
local FP_OBJNAME = "OBJ_QOSQP_ID"
local PARA =
{
"Enable",
"Alias",
"CommittedRate",
"CommittedBurstSize",
"ExcessBurstSize",
"PeakRate",
"PeakBurstSize",
"MeterType",
"ConformingAction",
"PartialConformingAction",
"NonConformingAction"
}
local FP_ACTION = cgilua.cgilua.POST.IF_ACTION
local FP_IDENTITY = cgilua.cgilua.POST._InstID
if FP_IDENTITY == "-1" then
FP_IDENTITY = ""
end
InstXML, tError = ManagerOBJ(FP_OBJNAME, FP_ACTION, FP_IDENTITY, PARA, tError, {xmlType = 2}, nil, "DEV")
ErrorXML = outputErrorXML(tError)
OutXML = ErrorXML .. InstXML
outputXML(OutXML)