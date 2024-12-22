require "data_assemble.common_lua"
local ErrorXML = ""
local InstXML = ""
local OutXML = ""
local tError = nil
local FP_OBJNAME_LOS = "OBJ_LOS_INFO_ID"
local PARA_LOS =
{
"LosInfo"
}
InstXML_LOS, tError = getAllInstXML(FP_OBJNAME_LOS, "IGD", nil, nil,transToFilterTab(PARA_LOS))
local FP_OBJNAME_ONUID = "OBJ_PONONUID_ID"
local PARA_ONUID =
{
"OnuId"
}
InstXML_ONUID, tError = getAllInstXML(FP_OBJNAME_ONUID, "IGD", nil, nil,transToFilterTab(PARA_ONUID))
local FP_OBJNAME_REG = "OBJ_GPONREGSTATUS_ID"
local PARA_REG =
{
"RegStatus"
}
InstXML_REG, tError = getAllInstXML(FP_OBJNAME_REG, "IGD", nil, nil,transToFilterTab(PARA_REG))
local FP_OBJNAME = "OBJ_PON_OPTICALPARA_ID"
local PARA =
{
"Volt",
"RxPower",
"TxPower",
"Temp",
"Current"
}
local function setValueCallback(tbl)
tbl.RxPower = tbl.RxPower/10000;
tbl.TxPower = tbl.TxPower/10000;
tbl.Current = tbl.Current/1000;
tbl.Temp = tbl.Temp/1000;
return true
end
InstXML, tError = getAllInstXML(FP_OBJNAME, "IGD", nil, setValueCallback,transToFilterTab(PARA))
ErrorXML = outputErrorXML(tError)
OutXML = ErrorXML .. InstXML .. InstXML_LOS .. InstXML_ONUID .. InstXML_REG
outputXML(OutXML)
