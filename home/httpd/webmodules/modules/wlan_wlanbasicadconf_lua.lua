require "data_assemble.common_lua"
local InstXML = ""
local InstXMLTMP = ""
local ErrorXML = ""
local OutXML = ""
local tError = {IF_ERRORID = 0}
local need2Get = 1
local sess_id = cgilua.cgilua.getCurrentSessID()
local uRight = session_get(sess_id, "Right")
local FP_OBJNAME = "OBJ_WLANSETTING_ID"
local PARA
local CHANNEL_OBJNAME
local CHANNEL_PARA
if uRight ~= "3" then
PARA =
{
"Standard",
"CardMode",
"BasicDataRates",
"OpDataRates",
"11nMode",
"GreenField",
"Channel",
"ScndChannel",
"AutoChannelEnabled",
"Band",
"RadioStatus",
"CountryCode",
"BandWidth"
}
local advParas = {
"SideBand",
"SGIEnabled",
"BeaconInterval",
"TxPower",
"QosType",
"RtsCts",
"DTIM"
,
"WorkMode"
};
table.foreach(advParas, function(i, v)
table.insert(PARA, v)
end);
CHANNEL_OBJNAME = "OBJ_CHANNEL_ID"
CHANNEL_PARA =
{
"CountryCode",
"Band",
"BandWidth",
"ChannelList"
}
end
local FP_ACTION = cgilua.cgilua.POST.IF_ACTION
local FP_IDENTITY = cgilua.cgilua.POST._InstID
local function callback(t, ID)
return true
end
if FP_ACTION == "Apply" then
need2Get = 0
tError = applyOrNewOrDelInst(FP_OBJNAME, FP_ACTION, FP_IDENTITY, transToPostTab(PARA), tError)
end
if FP_ACTION == "Cancel" then
need2Get = 0;
InstXMLTMP, tError = getSpecificInstXML(FP_OBJNAME, FP_IDENTITY, tError, nil, transToFilterTab(PARA))
InstXML = InstXML .. InstXMLTMP
end
if need2Get == 1 then
InstXMLTMP, tError = getAllInstXML(FP_OBJNAME, "IGD", tError, callback, transToFilterTab(PARA))
InstXML = InstXML .. InstXMLTMP
if uRight ~= "3" then
local CountryStr = _G.ssidConf["wlanCountryConf"]
local CountryCode = "IGD"
if CountryStr ~= nil then
CountryCode = CountryStr[1]
end
InstXMLTMP, tError = getAllInstXML(CHANNEL_OBJNAME, CountryCode, tError, nil, transToFilterTab(CHANNEL_PARA))
InstXML = InstXML .. InstXMLTMP
end
end
ErrorXML = outputErrorXML(tError)
OutXML = ErrorXML .. InstXML
outputXML(OutXML)
