require "data_assemble.common_lua"
function FindNameBaseID1(Identity)
local IFName = ""
local IFFind = 0
local Display = 1
local AllWANLANTbl = ListAllWanLanIF()
for k,v in ipairs(AllWANLANTbl) do
if Identity == v.InstID then
IFFind = 1
IFName = v.InstName
local sess_id = cgilua.cgilua.getCurrentSessID()
if env.getenv("CountryCode") == "41" and session_get(sess_id, "Right") ~= "1" and v.WANServlist ~= 0 and v.WANServlist ~= 1 and v.WANServlist ~= 3 and v.WANServlist ~= 5 and v.WANServlist ~= 7 then
Display = 0
end
break;
end
end
return IFFind,IFName,Display
end
local InstXML = ""
local ErrorXML = ""
local OutXML = ""
local FP_ACTION = cgilua.cgilua.POST.IF_ACTION
local FP_OBJNAME = "OBJ_ROUTETABLE_ID";
local PARA =
{
"DestIP",
"DestIPMask",
"GWIP",
"Interface"
}
local tError = {
IF_ERRORID = 0,
IF_ERRORTYPE = "SUCC",
IF_ERRORSTR = "SUCC",
IF_ERRORPARAM = "SUCC"
}
local xmlStr = ""
local xmlStrTmp = ""
local t = cmapi.getinst(FP_OBJNAME, "MGet")
local FP_INSTNUM = t.MGET_INST_NUM
FP_INSTNUM = tonumber(FP_INSTNUM)
for i=0,FP_INSTNUM - 1 do
local xmlSubStr = ""
local xmlSubStrTmp = ""
local FP_IFNAME = t["Interface" .. i]
local IFNameTmp
local IFFind
local Display
IFFind,IFNameTmp,Display = FindNameBaseID1(FP_IFNAME)
if Display == 1 then
if IFFind == 0 then
IFNameTmp = FP_IFNAME
end
xmlSubStr = getParaXMLNodeEntity("Interface", encodeXML(IFNameTmp))
local DestIP = t["DestIP" .. i]
DestIP = encodeXML(DestIP)
xmlSubStrTmp = getParaXMLNodeEntity("DestIP", DestIP)
xmlSubStr = xmlSubStr .. xmlSubStrTmp
local DestIPMask = t["DestIPMask" .. i]
DestIPMask = encodeXML(DestIPMask)
xmlSubStrTmp = getParaXMLNodeEntity("DestIPMask", DestIPMask)
xmlSubStr = xmlSubStr .. xmlSubStrTmp
local GWIP = t["GWIP" .. i]
GWIP = encodeXML(GWIP);
xmlSubStrTmp = getParaXMLNodeEntity("GWIP", GWIP)
xmlSubStr = xmlSubStr .. xmlSubStrTmp
xmlStrTmp = getXMLNodeEntity("Instance", xmlSubStr)
if env.getenv("CountryCode") ~= "66" or DestIP ~= "169.254.254.0" then
xmlStr = xmlStr .. xmlStrTmp
end
end
end
InstXML = getXMLNodeEntity("OBJ_ROUTETABLE_ID", xmlStr);
ErrorXML = outputErrorXML(tError)
OutXML = ErrorXML .. InstXML
outputXML(OutXML)
