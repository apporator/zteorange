require "data_assemble.common_lua"
local InstXML = ""
local ErrorXML = ""
local tempInstXML = ""
local OutXML = ""
local need2Get = 1
local tError = nil
local FP_OBJNAME = "OBJ_IGMPVLAN_ID"
local PARA =
{
"PortViewName",
"MultSrcVid",
"MultDstVid"
}
local FP_ACTION = cgilua.cgilua.POST.IF_ACTION
local FP_IDENTITY = cgilua.cgilua.POST._InstID
if FP_IDENTITY == "-1" then
FP_IDENTITY = ""
end
local function transferPort(t)
for k,v in pairs(t) do
if k == "PortViewName" then
local wlanCommFunc = require "modules.wlan_common_func"
local FilterBySSIDName = wlanCommFunc.getSSIDNameFilter()
local iSSSID = string.sub(t.PortViewName,10,13)
if iSSSID == "SSID" then
local SSIDIndex = string.sub(t.PortViewName,10,14)
if FilterBySSIDName(SSIDIndex) ~= true then
return false
end
end
local portTbl = cmapi.getinst("OBJ_IGMPADDLIMITUNTAG_ID", v)
if type(portTbl) ~= "table" then
g_logger:warn("portTbl is not a table! Modifying PortViewName failed!")
return true
end
if portTbl.IF_ERRORID == 0 then
t.PortViewName = portTbl.PortViewName
end
end
end
return true
end
if FP_ACTION == "Apply" or FP_ACTION == "Delete" then
need2Get = 0
tError = applyOrNewOrDelInst(FP_OBJNAME, FP_ACTION, FP_IDENTITY, transToPostTab(PARA))
InstXML = getXMLNodeEntity("_InstID", tError.INSTIDENTITY or "")
elseif FP_ACTION == "Cancel" then
need2Get = 0
InstXML, tError = getSpecificInstXML(FP_OBJNAME, FP_IDENTITY, nil, transferPort, transToFilterTab(PARA))
end
if need2Get == 1 then
local IFTbl = cmapi.ListIFByApp("MulticastVlan")
for i,v in ipairs(IFTbl) do
tempInstXML, tError = getAllInstXML(FP_OBJNAME, v.InstID, tError, transferPort, transToFilterTab(PARA))
InstXML = InstXML .. tempInstXML
end
end
ErrorXML = outputErrorXML(tError)
OutXML = ErrorXML .. InstXML
outputXML(OutXML)