<script type="text/javascript">
(function () {
var g_CfgGlobalXMLLocalCache;
var VOIPHLHead = $("#VoipHomeLine");
VOIPHLHead.regetdata = function (xml) {
g_CfgGlobalXMLLocalCache = xml;
$("[id^='template_homeline_devlist_table_']").remove();
var item_obj = $("#homeline_devlist_table");
var VOIPHLOBJ = $(xml).find("OBJ_VOIPHOMELINE_ID");
var RuleNum = $("Instance", VOIPHLOBJ).length;
var cmapiErrorContainer = $(".errorHint", VOIPHLHead);
if (cmapiErrorContainer.hasError(xml) == 0) {
var OBJID = ["OBJ_VOIPHOMELINE_ID"];
item_obj.createPageDataByClone(RuleNum, OBJID, xml, fillDataByCustom);
}
}
function fillDataByCustom(suffix, ContainerOBJ){
var PasswordObj = $("[id^='Password']", ContainerOBJ);
PasswordObj.text("******");
var EnableObj = $("[id^='Enable']", ContainerOBJ);
if (EnableObj.text() == "1"){
EnableObj.text("&?homeline_006;");
}
else{
EnableObj.text("&?homeline_008;");
}
}
function initial_template_VoipHomeLine(templateID,ServerAddr) {
var template = $("#" + templateID);
template.bind("applyPromptCheckJSON", function (event, template) {
var checkJSONTempObj = {
"groups": {
},
"rules": {
"PhyNumber": {
"ASCII": true,
"rangelength":[0,31]
},
"Password": {
"PasswordASCII": true,
"rangelength":[0,15]
}
},
"messages": {
}
};
template.setPromptCheckJSON(checkJSONTempObj, template);
});
template.bind("fillDataByApplyResult", function (event, xml, template) {
ActionByApplyResult(xml, template);
$("#PhyNumber", template).val("");
$("#_InstID", template).val("");
VOIPHLHead.dataTransfer(ServerAddr,
"GET",
VOIPHLHead.regetdata);
});
$("[id^='modify']", $("#homeline_devlist_table")).click(function (event) {
var tempShow = $("#template_VoipHomeLine");
var index = $(this).attr("id").split(":")[1];
tempShow.fillDataByOBJID(g_CfgGlobalXMLLocalCache, ["OBJ_VOIPHOMELINE_ID"], tempShow, index);
return false;
});
}
$(document).ready(function () {
var HeadID = "VoipHomeLine";
var Head = $("#" + HeadID);
var templateID = "template_" + HeadID;
var ServerAddr = $("address span", Head).text();
var item_obj = $("#homeline_devlist_table");
initial_template_VoipHomeLine(templateID,ServerAddr);
$("#" + templateID).trigger("applyPromptCheckJSON", [$("#" + templateID)]);
Head.succfunction = function (xml) {
g_CfgGlobalXMLLocalCache = xml;
var VOIPHLOBJ = $(xml).find("OBJ_VOIPHOMELINE_ID");
var RuleNum = $("Instance", VOIPHLOBJ).length;
var cmapiErrorContainer = $(".errorHint", Head);
if (cmapiErrorContainer.hasError(xml) == 0) {
var OBJID = ["OBJ_VOIPHOMELINE_ID"];
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
