require "data_assemble.cmapi"
_G.ssidConf = {}
local DisableSSID = "DEV.WIFI.AP5"
_G.ssidConf["BSDisableSSID"] = DisableSSID
_G.wanConf = {
selfCfgIP = "1,1,1,0",
requiredF = "1,1,1,1",
status = {}
}
_G.wanConf.status.dhcpBtn = {}
_G.lanConf = {}
_G.voipConf = {}
_G.ssidConf["GRE"] = {
idxNum = {2}
}
_G.ssidConf["EncryptionType"] = ""
_G.commConf = {
getEncode = true,
setEncode = true,
IntegCheck = true,
webEnable = true,
ValidateCode = false,
serviceCtl = {},
fwPortServHidden = "",
PortForwarding ={},
oneWholePage = {},
wizard = {},
ChgpwdStrong = false,
passCanSee = "",
elementControl = {},
template = "",
diagnose = { ping=0, trace=0, simulate=0 },
language = {},
miniolt = "RoomPONInfo_002",
broadwiseTopo = false,
loginErrCustom = "login_029",
timeArea = ""
}
local cver = env.getenv("CountryCode")
local configFile = string.format("template/config_%s.lua",cver)
local configModule = string.format("template/config_%s",cver)
if cmapi.file_exists(configFile) == 1 then
require(configModule)
end
if _G.commConf.IntegCheck ~= true then
cmapi.set_webParams("IntegCheck", "false")
end
if _G.commConf.webEnable ~= true then
cmapi.set_webParams("webEnable", "false")
end
