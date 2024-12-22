require "data_assemble.common_lua"
local ErrorXML = ""
local InstXML = ""
local InstXMLTMP = ""
local OutXML = ""
local need2Get = 1
local tError = nil
local FP_OBJNAME = "OBJ_LANDEVDHCPSOURCE_ID";
local PARA =
{
"VendorClassID",
"ProcFlag",
}
local InstXML_Mac = ""
local tError_Mac = nil
local FP_MAC_OBJNAME = "OBJ_MAC_LEARN_ID";
local PARA_MAC =
{
"MacLearn"
}
local function transData(num)
if num == nil then
return
end
num = tonumber(num)
if num == 0 then
num = 3
return num
end
if num == 3 then
num = 0
return num
end
return num
end
local function transProcFlag(t)
if type(t) == "table" then
t.ProcFlag = transData(t.ProcFlag)
t.VendorClassID=ChangePortName(t.VendorClassID)
end
local wlanCommFunc = require "modules.wlan_common_func"
local FilterBySSIDName = wlanCommFunc.getSSIDNameFilter()
local paraName = "VendorClassID"
local aliasName = t[paraName]
if string.sub(aliasName,1,4) =="SSID" then
if FilterBySSIDName(aliasName) then
return true
else
return false
end
end
return true
end
local FP_ACTION = cgilua.cgilua.POST.IF_ACTION
if FP_ACTION == "Apply" then
need2Get = 0
tError_Mac = applyOrNewOrDelInst(FP_MAC_OBJNAME, FP_ACTION, "IGD", transToPostTab(PARA_MAC), tError_Mac)
local instNum = cgilua.cgilua.POST._InstNum
for i = 0, instNum - 1 do
local identityName = "_InstID_" .. i
local identity = cgilua.cgilua.POST[identityName]
if identity ~= nil then
local t_Data = {}
for j, k in pairs(PARA) do
t_Data[k] = cgilua.cgilua.POST[k .. "_" .. i]
if k == "ProcFlag" then
t_Data[k] = transData(t_Data[k])
end
end
tError = applyOrNewOrDelInst(FP_OBJNAME, FP_ACTION, identity, t_Data, tError)
end
end
end
if need2Get == 1 then
InstXML, tError = getAllInstXML(FP_OBJNAME, "IGD", tError, transProcFlag, transToFilterTab(PARA))
InstXML_Mac, tError_Mac = getAllInstXML(FP_MAC_OBJNAME, "IGD", tError_Mac, nil, transToFilterTab(PARA_MAC))
end
ErrorXML = outputErrorXML(tError)
OutXML = ErrorXML .. InstXML .. InstXML_Mac
outputXML(OutXML)
