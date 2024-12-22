<script type="text/javascript">
function Customize_SecondIP(paramsOBJ)
{
var TemplateOBJ = paramsOBJ["TemplateOBJ"];
var IPJSON = {
"SecIPAddr":"sub_SecIPAddr",
"SecNetMask":"sub_SecNetMask"
};
for (var IPTmp in IPJSON)
{
var ipHiddenObj = $("[id^='"+IPTmp+"']", TemplateOBJ);
ipHiddenObj.FillIPorMacDataBySplit(IPJSON[IPTmp], ".", 4);
}
}
function initial_template_SecondIP(templateID)
{
var template = $("#"+templateID);
var ipSegmentCheck = {
"required": true,
"integer": true,
"range": [0, 255]
};
template.bind("applyPromptCheckJSON", function(event, template){
var checkJSONTempObj = {
"groups": {
SecIPAddr: "sub_SecIPAddr0 sub_SecIPAddr1 sub_SecIPAddr2 sub_SecIPAddr3",
SecNetMask: "sub_SecNetMask0 sub_SecNetMask1 sub_SecNetMask2 sub_SecNetMask3"
},
"rules": {
"sub_SecIPAddr0": ipSegmentCheck,
"sub_SecIPAddr1": ipSegmentCheck,
"sub_SecIPAddr2": ipSegmentCheck,
"sub_SecIPAddr3": ipSegmentCheck,
"sub_SecNetMask0": ipSegmentCheck,
"sub_SecNetMask1": ipSegmentCheck,
"sub_SecNetMask2": ipSegmentCheck,
"sub_SecNetMask3": ipSegmentCheck,
},
"messages": {
}
};
template.setPromptCheckJSON(checkJSONTempObj, template);
});
template.bind("fillDataByApplyResult", function(event,xml, template){
if(ActionByApplyResult(xml, template) == 0){
var OBJID = ["OBJ_BRGRP2ndIP_ID"];
template.fillDataByOBJID(xml, OBJID, template, 0);
var CustomizeParams = {
"TemplateOBJ":template
};
Customize_SecondIP(CustomizeParams);
}
});
template.bind("fillDataByCancelResult", function(event,xml, template){
var OBJID = ["OBJ_BRGRP2ndIP_ID"];
ActionByCancelResult(xml, template, OBJID);
var CustomizeParams = {
"TemplateOBJ":template
};
Customize_SecondIP(CustomizeParams);
});
template.bind("hiddenValueChangeByCustom", function(event,template){
var IPJSON = {
"SecIPAddr":"sub_SecIPAddr",
"SecNetMask":"sub_SecNetMask"
};
for (var IPTmp in IPJSON)
{
var ipHiddenObj = $("[id^='"+IPTmp+"']", template);
ipHiddenObj.FillIPorMacDataCombination(IPJSON[IPTmp], ".", 4);
}
});
}
$(document).ready(function(){
var HeadID = "SECONDIP";
var Head = $("#"+HeadID);
var templateID = "template_"+ HeadID;
var ServerAddr = $("address span", Head).text();
initial_template_SecondIP(templateID);
Head.succfunction = function(xml){
var cmapiErrorContainer = $(".errorHint",Head);
if (cmapiErrorContainer.hasError(xml) == 0)
{
var tempobj = $("#template_SECONDIP");
var OBJID = ["OBJ_BRGRP2ndIP_ID"];
Head.fillDataByOBJID(xml, OBJID, tempobj, 0);
Head.fillDataByCustom(0, tempobj);
}
};
Head.fillDataByCustom = function(suffix,TemplateOBJ){
var CustomizeParams = {
"TemplateOBJ":TemplateOBJ
};
Customize_SecondIP(CustomizeParams);
};
if ( $(".collapBarWithDataTrans",Head).length <= 0 )
{
Head.dataTransfer(ServerAddr,
"GET",
Head.succfunction);
}
else
{
initial_collapBarWithDataTrans(Head);
}
});
</script>
