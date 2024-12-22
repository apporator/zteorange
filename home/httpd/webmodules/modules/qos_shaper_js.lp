<script type="text/javascript">
(function(){
function Customize_qosShaper(paramsOBJ)
{
var ContainerOBJ = paramsOBJ["ContainerOBJ"];
ContainerOBJ.collapsibleInstTitleChange("Alias");
}
function initial_template_qosShaper(templateID)
{
var template = $("#"+templateID);
var qbwMin = $("[id^='QBW_MIN']",template);
var qbwMax = $("[id^='QBW_MAX']",template);
qbwMin.text(reformString(qbwMin.text(), 3));
qbwMax.text(reformString(qbwMax.text(), 3));
template.bind("applyPromptCheckJSON", function(event, template){
var checkJSONTempObj = {
"rules": {
"ShapingRate": {
"required": true,
"integer": true,
"ranges":[0, [8192, 100000000]]
},
"Alias": {
"required": true,
"utf8": true,
"utf8LengthRange":[1,64]
}
},
"messages": {
}
};
template.setPromptCheckJSON(checkJSONTempObj, template);
});
template.bind("fillDataByApplyResult", function(event,xml, template){
ActionByApplyResult(xml, template, "Alias");
});
template.bind("fillDataByCancelResult", function(event,xml, template){
var OBJID = ["OBJ_QOSSHAPER_CONF_ID"];
ActionByCancelResult(xml, template, OBJID);
template.trigger("fillDataByCustom",[0, template, xml]);
});
template.bind("fillDataByCustom", function(event, suffix, ContainerOBJ, xml){
var CustomizeParams = {
"ContainerOBJ":ContainerOBJ
};
Customize_qosShaper(CustomizeParams);
});
}
$(document).ready(function(){
var qosShaperHeadID = "qosShaper";
var qosShaperHead = $(".HeadDIV");
var templateID = "template_"+ qosShaperHeadID;
var ServerAddr = $("address span", qosShaperHead).text();
initial_template_qosShaper(templateID);
qosShaperHead.succfunction = function(xml){
qosShaperHead.hasError(xml,"externErrorHint");
var OBJ = $(xml).find("OBJ_QOSSHAPER_CONF_ID");
var RuleNum = $("Instance", OBJ).length;
var OBJID = ["OBJ_QOSSHAPER_CONF_ID"];
qosShaperHead.createPageDataByClone(RuleNum, OBJID, xml);
};
if ( $(".collapBarWithDataTrans",qosShaperHead).length <= 0 )
{
qosShaperHead.dataTransfer(ServerAddr,"GET",qosShaperHead.succfunction);
}
else
{
initial_collapBarWithDataTrans(qosShaperHead);
}
});
})();
</script>
