require "data_assemble.common_lua"
local InstXML = ""
local InstXML_SubVersion = ""
local ErrorXML = ""
local OutXML = ""
local tError = nil
local tError_Status = nil
local need2Get = 1
local FP_OBJNAME = "OBJ_DEVINFO_ID";
local PARA =
{
"ManuFacturerOui",
"ModelName",
"SerialNumber",
"SoftwareVerExtent",
"HardwareVer",
"SoftwareVer",
"BootVer",
"OnuAlias",
"ManuFacturer",
"VerDate"
}
if need2Get == 1 then
InstXML, tError = getAllInstXML(FP_OBJNAME, "IGD", nil, nil,transToFilterTab(PARA))
end
ErrorXML = outputErrorXML(tError)
local InstXML_CpuMemUsage = ""
local ErrorXML_CpuMemUsage = ""
local tError_CpuMemUsage = nil
local FP_OBJNAME_CpuMemUsage = "OBJ_CPUMEMUSAGE_ID"
local PARA_CpuMemUsage =
{
"MemUsage",
"CpuUsage1",
"CpuUsage2",
"CpuUsage3",
"CpuUsage4"
}
InstXML_CpuMemUsage, tError_CpuMemUsage =getAllInstXML( FP_OBJNAME_CpuMemUsage, "IGD", nil, nil,transToFilterTab(PARA_CpuMemUsage))
if tError_CpuMemUsage.IF_ERRORID ~= 0 then
ErrorXML = outputErrorXML(tError_CpuMemUsage)
end
local InstXML_Time = ""
local tError_Time = nil
local FP_OBJNAME_TIME = "OBJ_POWERONTIME_ID"
local PARA_TIME =
{
"PowerOnTime"
}
InstXML_Time, tError_Time = getAllInstXML(FP_OBJNAME_TIME, "IGD", nil, nil,transToFilterTab(PARA_TIME))
if tError_Time.IF_ERRORID ~= 0 then
ErrorXML = outputErrorXML(tError_Time)
end
local InstXML_Poninfo = ""
local tError_Poninfo = nil
OutXML = ErrorXML .. InstXML .. InstXML_CpuMemUsage .. InstXML_Time .. InstXML_Poninfo
outputXML(OutXML)
