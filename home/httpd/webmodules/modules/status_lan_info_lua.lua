require "data_assemble.common_lua"
local ErrorXML = ""
local InstXML1 = ""
local OutXML = ""
local tError = nil
local PARA_ETH =
{
"InBytes",
"InPkts",
"InUnicast",
"InMulticast",
"InError",
"InDiscard",
"OutBytes",
"OutPkts",
"OutUnicast",
"OutMulticast",
"OutError",
"OutDiscard",
"Status",
"Speed",
"Duplex"
}
InstXML1 , tError = getAllInstXML("OBJ_PON_PORT_BASIC_STATUS_ID", "IGD", tError, nil, transToFilterTab(PARA_ETH))
ErrorXML = ErrorXML .. outputErrorXML(tError)
OutXML = ErrorXML .. InstXML1
outputXML(OutXML)
