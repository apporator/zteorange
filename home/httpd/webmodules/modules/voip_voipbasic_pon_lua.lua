require "data_assemble.common_lua"
local InstXML = ""
local ErrorXML = ""
local OutXML = ""
local need2Get = 1
local tError = nil
local FP_OBJNAME = "OBJ_VOIPSIPLINE_ID"
local PARA =
{
"AuthUserName",
"AuthPassword",
"DigestUserName"
}
local FP_OBJNAMEVP = "OBJ_VOIPVPLINE_ID"
local VP_PARA =
{
"Enable"
}
local FP_ACTION = cgilua.cgilua.POST.IF_ACTION
local FP_IDENTITY = cgilua.cgilua.POST._InstID
local FP_IDENTITYVP = cgilua.cgilua.POST._InstIDVP
local para_table = {}
para_table.para = PARA
para_table.encrypt = {"AuthUserName","AuthPassword","DigestUserName"}
InstXML, tError = ManagerOBJ(FP_OBJNAME, FP_ACTION, FP_IDENTITY, para_table, nil, nil)
local InstXML1 = ""
InstXML1, tError = ManagerOBJ(FP_OBJNAMEVP, FP_ACTION, FP_IDENTITYVP, VP_PARA, tError)
ErrorXML = outputErrorXML(tError)
OutXML = ErrorXML .. InstXML .. InstXML1
outputXML(OutXML)
