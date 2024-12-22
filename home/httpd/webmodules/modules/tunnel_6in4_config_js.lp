<script type="text/javascript">
(function(){
function initial_template_Tunnel6in4(templateID)
{
var template = $("#"+templateID);
var IPCheckRules = {
"required": true,
"integer": true,
"range":[0,255]
};
template.bind("applyPromptCheckJSON", function(event, template){
var checkJSONTempObj = {
"groups": {
"6rdBRIPv4Addr": "sub_6rdBRIPv4Addr0 sub_6rdBRIPv4Addr1 sub_6rdBRIPv4Addr2 sub_6rdBRIPv4Addr3",
"6rdprefix": "6rdprefix 6rdprefixLen"
},
"rules": {
"Tunl64Aliasname": {
"required": true,
"utf8": true,
"utf8LengthRange":[1,32]
},
"MTU": {
"required": true,
"integer": true,
"min":[1280]
},
"6rdprefix": {
"required": true,
"IPv6Addr": true
},
"6rdprefixLen": {
"required": true,
"range":[1,64]
},
"IPv4MaskLen": {
"required": true,
"range":[0,32]
},
"WANCID": {
"required": true
},
"sub_6rdBRIPv4Addr0": IPCheckRules,
"sub_6rdBRIPv4Addr1": IPCheckRules,
"sub_6rdBRIPv4Addr2": IPCheckRules,
"sub_6rdBRIPv4Addr3": IPCheckRules
},
"messages": {
}
};
template.setPromptCheckJSON(checkJSONTempObj, template);
});
template.bind("wholeIPorMACCheck", function(event, template, IPMACCheckResult){
var checkIPorMACObj = {
"6rdBRIPv4Addr": {
"eleType": "IP",
"labelId": "sub_6rdBRIPv4Addr0",
"rules":{
"banValue": ["0.0.0.0"]
},
"messages": {
}
}
};
template.checkIPorMACbyApply(checkIPorMACObj, template, IPMACCheckResult);
});
$("input[type='radio'][name='Method']", template).change(function(event){
var iTemplate = $(this).parents("[id^='template_']");
var wanRow = $("[id^='Div_WANCID']", iTemplate);
var autoObj = $("[id^='AutoSense']", iTemplate);
if (autoObj.is(':checked'))
{
wanRow.hide();
}
else
{
wanRow.show();
}
});
$("[id^='6rdtype']",template).change(function(event){
var typeOBJ = $(this);
var subTemplate = typeOBJ.parents("[id^='template_']");
var typeVal = typeOBJ.val();
var IdStr = "[id^='Div_6rdprefix'],"
+ "[id^='Div_IPv4MaskLen'],[id^='Div_6rdBRIPv4Addr']";
var controlOBJs = $(IdStr, subTemplate);
if (typeVal == "Static")
{
controlOBJs.show();
}
else if (typeVal == "Auto")
{
controlOBJs.hide();
}
else
{
consoleLog("The Val of 6rdtype is not right!");
}
});
template.bind("fillDataByApplyResult", function(event,xml, template){
ActionByApplyResult(xml, template, "Tunl64Aliasname");
});
template.bind("fillDataByCancelResult", function(event,xml, template){
var OBJID = ["OBJ_TUNNEL64_ID"];
ActionByCancelResult(xml, template, OBJID);
template.trigger("fillDataByCustom",[0, template, xml]);
});
template.bind("fillDataByCustom", function(event, suffix, ContainerOBJ, xml){
ContainerOBJ.collapsibleInstTitleChange("Tunl64Aliasname");
var Valrdtype = $("[id^='6rdtype']",ContainerOBJ).val();
if (Valrdtype == "Auto")
{
$("[id^='sub_6rdBRIPv4Addr']", ContainerOBJ).each(function(){
$(this).val("");
});
}
else
{
var IpJSON = {
"6rdBRIPv4Addr":"sub_6rdBRIPv4Addr"
};
for (var IPTmp in IpJSON)
{
var IPOBJ = $("[id^='"+IPTmp+"']",ContainerOBJ);
IPOBJ.FillIPorMacDataBySplit(IpJSON[IPTmp], ".", 4);
}
}
$("[id^='6rdtype']",ContainerOBJ).change();
if ($("[id^='WANCID']",ContainerOBJ).val() == "")
{
$("[id^='AutoSense']",ContainerOBJ).prop("checked",true);
}
else
{
$("[id^='Manual']",ContainerOBJ).prop("checked",true);
}
$(":radio[name^='Method']",ContainerOBJ).change();
});
template.bind("hiddenValueChangeByCustom", function(event,template){
var wanObj = $("[id^='WANCID']",template);
if ($("[id^='AutoSense']",template).is(':checked'))
{
wanObj.val("");
}
var IpJSON = {
"6rdBRIPv4Addr":"sub_6rdBRIPv4Addr"
};
for (var IPTmp in IpJSON)
{
$("[id^='"+IPTmp+"']",template).FillIPorMacDataCombination(IpJSON[IPTmp], ".", 4);
}
});
}
$(document).ready(function(){
var Tunnel6in4HeadID = "Tunnel6in4";
var Tunnel6in4Head = $("#"+Tunnel6in4HeadID);
var Tunnel6in4TempalteID = "template_"+ Tunnel6in4HeadID;
var Tunnel6in4ServerAddr = $("address span", Tunnel6in4Head).text();
initial_template_Tunnel6in4(Tunnel6in4TempalteID);
Tunnel6in4Head.succfunction = function(xml){
Tunnel6in4Head.hasError(xml,"externErrorHint");
var Tunnel6in4OBJ = $(xml).find("OBJ_TUNNEL64_ID");
var Tunnel6in4RuleNum = $("Instance", Tunnel6in4OBJ).length;
var OBJID = ["OBJ_TUNNEL64_ID"];
Tunnel6in4Head.createPageDataByClone(Tunnel6in4RuleNum, OBJID, xml);
};
if ( $(".collapBarWithDataTrans",Tunnel6in4Head).length <= 0 )
{
Tunnel6in4Head.dataTransfer(Tunnel6in4ServerAddr, "GET", Tunnel6in4Head.succfunction);
}
else
{
initial_collapBarWithDataTrans(Tunnel6in4Head);
}
});
})();
</script>
