<script type="text/javascript">
var CountryCode = "<%=env.getenv("CountryCode")%>";
(function(){
var getXml;
var VOIPSIPHead = $("#VOIPSipAccountConf");
VOIPSIPHead.regetdata = function (xml) {
getXml = xml;
$("[id^='template_VOIPSipAccount_devlist_table_']").remove();
var item_obj = $("#VOIPSipAccount_devlist_table");
var VOIPSIPOBJ = $(xml).find("OBJ_VOIPSIPLINE_ID");
var RuleNum = $("Instance", VOIPSIPOBJ).length;
var cmapiErrorContainer = $(".errorHint", VOIPSIPHead);
if (cmapiErrorContainer.hasError(xml) == 0) {
var OBJID = ["OBJ_VOIPSIPLINE_ID","OBJ_VOIPVPLINE_ID"];
item_obj.createPageDataByClone(RuleNum, OBJID, xml, fillDataByCustom);
}
}
function fillDataByCustom (suffix, ContainerOBJ){
var _instid = getParaValueInXML(getXml, "OBJ_VOIPSIPLINE_ID", suffix, "_InstID");
$("[id^='_InstID:']", ContainerOBJ).val(_instid);
var _instidvp = getParaValueInXML(getXml, "OBJ_VOIPVPLINE_ID", suffix, "_InstID");
$("[id^='_InstIDVP:']", ContainerOBJ).val(_instidvp);
var PasswordObj = $("[id^='AuthPassword']", ContainerOBJ);
PasswordObj.text("******");
var EnableObj = $("[id^='Enable']", ContainerOBJ);
if (EnableObj.text() == "2"){
EnableObj.text("&?homeline_006;");
}
else{
EnableObj.text("&?homeline_008;");
}
}
function initial_template(templateID, ServerAddr)
{
var template = $("#"+templateID);
template.bind("fillDataByApplyResult", function(event,xml, template){
ActionByApplyResult(xml, template);
$("#AuthUserName", template).val("");
$("#DigestUserName", template).val("");
$("#cfgEnable", template).val("");
$("#_InstID", template).val("");
$("#_InstIDVP", template).val("");
VOIPSIPHead.dataTransfer(ServerAddr,
"GET",
VOIPSIPHead.regetdata);
});
template.bind("hiddenValueChangeByCustom", function(event,template){
var cfgEnableObj = $("#cfgEnable",template);
var EnableObj = $("#Enable",template);
if (cfgEnableObj.is(':checked')){
EnableObj.val("2");
}
else{
EnableObj.val("1");
}
});
$("[id^='modify']", $("#VOIPSipAccount_devlist_table")).click(function (event) {
var tempShow = $("#template_VOIPSipAccountConf");
var index = $(this).attr("id").split(":")[1];
var OBJID = ["OBJ_VOIPSIPLINE_ID","OBJ_VOIPVPLINE_ID"];
tempShow.fillDataByOBJID(getXml, OBJID, tempShow, index);
var _instid = getParaValueInXML(getXml, "OBJ_VOIPSIPLINE_ID", index, "_InstID");
$("#_InstID", tempShow).val(_instid);
var _instidvp = getParaValueInXML(getXml, "OBJ_VOIPVPLINE_ID", index, "_InstID");
$("#_InstIDVP", tempShow).val(_instidvp);
var Enableval = getParaValueInXML(getXml, "OBJ_VOIPVPLINE_ID", index, "Enable");
var cfgEnableObj = $("#cfgEnable", tempShow);
if (Enableval == "2"){
cfgEnableObj.prop("checked", true);
}
else{
cfgEnableObj.prop("checked", false);
}
return false;
});
template.bind("applyPromptCheckJSON", function(event, template){
var checkJSONTempObj = {
"rules": {
"AuthUserName": {
"ASCII": true,
"rangelength":[0,127]
},
"AuthPassword": {
"PasswordASCII": true,
"rangelength":[0,31]
},
"DigestUserName": {
"ASCII": true,
"rangelength":[0,127]
},
},
"messages": {
"AuthUserName": {
"ASCII": "&?public_error018;"
}
}
};
template.setPromptCheckJSON(checkJSONTempObj, template);
});
}
$(document).ready(function(){
var HeadID = "VOIPSipAccountConf";
var Head = $("#" + HeadID);
var templateID = "template_" + HeadID;
var ServerAddr = $("address span", Head).text();
var item_obj = $("#VOIPSipAccount_devlist_table");
initial_template(templateID,ServerAddr);
$("#" + templateID).trigger("applyPromptCheckJSON", [$("#" + templateID)]);
Head.succfunction = function (xml) {
getXml = xml;
var VOIPSIPOBJ = $(xml).find("OBJ_VOIPSIPLINE_ID");
var RuleNum = $("Instance", VOIPSIPOBJ).length;
var cmapiErrorContainer = $(".errorHint", Head);
if (cmapiErrorContainer.hasError(xml) == 0) {
var OBJID = ["OBJ_VOIPSIPLINE_ID", "OBJ_VOIPVPLINE_ID"];
item_obj.createPageDataByClone(RuleNum, OBJID, xml, fillDataByCustom);
}
};
if ($(".collapBarWithDataTrans", Head).length <= 0) {
Head.dataTransfer(ServerAddr,
"GET",
Head.succfunction);
}
else {
initial_collapBarWithDataTrans(Head);
}
});
})();
</script>
