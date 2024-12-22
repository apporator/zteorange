require "data_assemble.common_lua"
local InstXML = ""
local ErrorXML = ""
local OutXML = ""
local tError = nil
local need2Get = 1
local FP_OBJNAME = "OBJ_TUNNEL64_ID";
local PARA =
{
"Tunl64ViewName",
"MTU",
"6rdtype",
"6rdprefix",
"6rdprefixLen",
"IPv4MaskLen",
"6rdBRIPv4Addr",
"Tunl64Aliasname",
"WANCID",
"ConnStatus",
"TUN64WANName"
}
function get6in4AllInstXML(FP_OBJNAME, ListBaseStr, tErr, callback, getTParam)
local xmlStr=""
local xmlError = {
IF_ERRORID = 0,
IF_ERRORTYPE = "SUCC",
IF_ERRORSTR = "SUCC",
IF_ERRORPARAM = "SUCC"
}
if not tErr then
tErr = xmlError
end
local reTable = cmapi.querylist("OBJ_6IN4TUNL_ID", ListBaseStr)
if reTable.IF_ERRORID ~= 0 then
g_logger:warn("querylist failed")
if tErr.IF_ERRORID == 0 then
tErr = reTable
end
return "", tErr
end
local xmlTable = {}
local count = reTable.Count
if count ~= 888 then
for i=1, count do
local id = reTable[i].InstName or reTable[i]
if tErr.IF_ERRORID == 0 then
xmlTable, xmlError, exitCycle = getInstParaXML(FP_OBJNAME, id, callback, getTParam, xmlTable)
if xmlError.IF_ERRORID ~= 0 then
tErr = xmlError
end
else
xmlTable, _, exitCycle = getInstParaXML(FP_OBJNAME, id, callback, getTParam, xmlTable)
end
if exitCycle then
break
end
end
else
xmlTable,xmlError = getInstParaXML(FP_OBJNAME, "IGD", callback, getTParam,xmlTable)
if tErr.IF_ERRORID == 0 then
tErr = xmlError
end
end
xmlStr = table.concat(xmlTable)
xmlStr = getXMLNodeEntity(FP_OBJNAME, xmlStr)
return xmlStr,tErr
end
function callback(t)
_,t.TUN64WANName = FindNameBaseID(t.WANCID)
if t["6rdtype"] == "Auto" then
t["6rdprefix"] = ""
t["6rdprefixLen"] = ""
t.IPv4MaskLen = ""
t["6rdBRIPv4Addr"] = ""
end
return true
end
local FP_ACTION = cgilua.cgilua.POST.IF_ACTION
local FP_IDENTITY = cgilua.cgilua.POST._InstID
if FP_IDENTITY == "-1" then
FP_IDENTITY = ""
end
if FP_ACTION == "Apply" or FP_ACTION == "Delete" then
need2Get = 0
if cgilua.cgilua.POST["6rdtype"] == "Auto" then
cgilua.cgilua.POST["6rdprefix"] = "::"
cgilua.cgilua.POST["6rdprefixLen"] = "0"
cgilua.cgilua.POST.IPv4MaskLen = "0"
cgilua.cgilua.POST["6rdBRIPv4Addr"] = "0.0.0.0"
end
tError = applyOrNewOrDelInst(FP_OBJNAME, FP_ACTION, FP_IDENTITY, transToPostTab(PARA))
local ReturnIdentity = tError.INSTIDENTITY or ""
InstXML = getXMLNodeEntity("_InstID", encodeXML(ReturnIdentity))
elseif FP_ACTION == "Cancel" then
need2Get = 0
InstXML, tError = getSpecificInstXML(FP_OBJNAME, FP_IDENTITY, nil, callback, transToFilterTab(PARA))
else
end
if need2Get == 1 then
InstXML, tError = get6in4AllInstXML(FP_OBJNAME, "IGD", nil, callback,transToFilterTab(PARA))
end
ErrorXML = outputErrorXML(tError)
OutXML = ErrorXML .. InstXML
outputXML(OutXML)
