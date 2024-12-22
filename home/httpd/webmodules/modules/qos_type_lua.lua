require "data_assemble.common_lua"
local ErrorXML = ""
local InstXML = ""
local InstXMLTMP = ""
local OutXML = ""
local tError = nil
local need2Get = 1
local FP_OBJNAME = "OBJ_QOSQC_ID"
local ReturnIdentity = ""
local PARA =
{
"Enable",
"Alias",
"Order",
"DevIn",
"AllInterface",
"MACSrc",
"MACDest",
"VlanPrio",
"VlanID",
"L2Protocol",
"IPDest",
"IPDestMask",
"IPSrc",
"IPSrcMask",
"L3ProtocolList",
"DSCPCheck",
"SrcPort",
"SrcPortMax",
"DestPort",
"DestPortMax",
"TcpAck",
"VlanPrioMark",
"DscpMark",
"PolicerQueue",
"TrafficClass",
}
local FP_ACTION = cgilua.POST.IF_ACTION
local FP_IDENTITY = cgilua.POST._InstID
if FP_IDENTITY == "-1" then
FP_IDENTITY = ""
end
local Return_IDENTITY = ""
local function filterIPv6Rule(t)
if "0" == env.getenv("DevIPv6Effect") then
for k,v in pairs(t) do
if k == "L2Protocol" then
if v == "IPV6" then
return false
end
elseif k == "AllInterface" and v == "0" then
for i,j in pairs(t) do
if i == "DevIn" then
local wanTab = ListAllWanLanIF()
for m,n in ipairs(wanTab) do
if j == n.InstID and n.IPMode == 2 then
return false
end
end
end
end
elseif k == "IPSrc" or k == "IPDest" then
if nil ~= _G.string.find(v, ":") then
return false
end
end
end
end
return true
end
InstXML, tError = ManagerOBJ(FP_OBJNAME, FP_ACTION, FP_IDENTITY, PARA, tError, {xmlType = 2}, filterIPv6Rule, "DEV")
ErrorXML = outputErrorXML(tError)
OutXML = ErrorXML .. InstXML
outputXML(OutXML)
