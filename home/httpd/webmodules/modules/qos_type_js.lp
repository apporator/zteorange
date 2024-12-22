<script type="text/javascript">
(function(){
function isDscpMarkOption(v)
{
if (v == "-1" || v == "-2" || v == "0" || v == "14" || v == "12" ||
v == "10" || v == "8" || v == "22" || v == "20" || v == "18" ||
v == "16" || v == "30" || v == "28" || v == "26" || v == "24" ||
v == "38" || v == "36" || v == "34" || v == "32" || v == "46" ||
v == "40" || v == "48" || v == "56")
{
return true;
}
return false;
}
function initial_template_qosType(templateID)
{
var template = $("#"+templateID);
$("input:radio[name='AllInterface']",template).change(function(){
var subTemplate = $(this).parents("[id^='template_qosCfgType']");
var devInRow = $("[id^='Row_DevIn']",subTemplate);
if ($("[id^='AllInterface1']",subTemplate).is(":checked"))
{
devInRow.hide();
}
else
{
devInRow.show();
}
});
$("[id^='L2Protocol']",template).change(function(){
var L2ProtocolOBJ = $(this);
var subTemplate = L2ProtocolOBJ.parents("[id^='template_']");
var hideAreaObjStr = "[id^='IPArea'],[id^='L3ProtocolArea'],[id^='DscpMarkArea']";
var hideAreaObj = $(hideAreaObjStr, subTemplate);
var L2Protocol = L2ProtocolOBJ.val();
if (L2Protocol == "ARP")
{
hideAreaObj.hide();
}
else
{
hideAreaObj.show();
}
});
$("[id^='L3ProtocolList']",template).change(function(){
var L3POBJ = $(this);
var subTemplate = L3POBJ.parents("[id^='template_']");
var portIdStr = "[id^='DestPort\\:'],[id^='DestPortMax'],"
+ "[id^='SrcPort\\:'],[id^='SrcPortMax']";
var portObjs = $(portIdStr, subTemplate);
var tcpackRow = $("[id^='Row_TcpAck']",subTemplate);
var L3Val = L3POBJ.val();
if (L3Val != "TCP" && L3Val != "UDP")
{
portObjs.parent().parent().hide();
}
else
{
portObjs.parent().parent().show();
portObjs.each(function(){
if ($(this).val() == "-1")
{
$(this).val("");
}
});
}
if (L3Val == "TCP")
{
tcpackRow.show();
}
else
{
tcpackRow.hide();
}
});
$("[id^='S_DscpMark']", template).change(function(){
var subTemplate = $(this).parents("[id^='template_']");
var selectDMVal = $("[id^='S_DscpMark']", subTemplate).val();
var inputDM = $("[id^='other_DscpMark']", subTemplate);
if (selectDMVal != "other")
{
inputDM.parent().parent().hide();
}
else
{
inputDM.parent().parent().show();
}
});
var MACCheckRules = {
"required": true,
"HEX": true,
"fixedlength": 2
};
template.bind("applyPromptCheckJSON", function(event, template){
var checkJSONTempObj = {
"groups": {
MACSrc: "sub_MACSrc0 sub_MACSrc1 sub_MACSrc2 sub_MACSrc3 sub_MACSrc4 sub_MACSrc5",
MACDest: "sub_MACDest0 sub_MACDest1 sub_MACDest2 sub_MACDest3 sub_MACDest4 sub_MACDest5",
DestPortRow: "DestPort DestPortMax",
SrcPortRow: "SrcPort SrcPortMax",
IPSrcRow: "IPSrc I_IPSrcMask",
IPDestRow: "IPDest I_IPDestMask"
},
"rules": {
"Alias": {
"required": true,
"utf8": true,
"utf8LengthRange":[1,64]
},
"SrcPort": {
"integer": true,
"range":[0, 65535],
"extremumRange":["lessThan","SrcPortMax",{"equal" :true}]
},
"SrcPortMax": {
"integer": true,
"range":[0, 65535],
"extremumRange":["greatThan","SrcPort",{"equal" :true}]
},
"DestPort": {
"integer": true,
"range":[0, 65535],
"extremumRange":["lessThan","DestPortMax",{"equal" :true}]
},
"DestPortMax": {
"integer": true,
"range":[0, 65535],
"extremumRange":["greatThan","DestPort",{"equal" :true}]
},
"DSCPCheck": {
"integer": true,
"range":[0, 63]
},
"TrafficClass": {
"integer": true,
"range":[1, 1024]
},
"other_DscpMark": {
"required": true,
"integer": true,
"range":[-2, 63]
},
"VlanID": {
"integer": true,
"range":[0, 4095]
},
"sub_MACSrc0": MACCheckRules,
"sub_MACSrc1": MACCheckRules,
"sub_MACSrc2": MACCheckRules,
"sub_MACSrc3": MACCheckRules,
"sub_MACSrc4": MACCheckRules,
"sub_MACSrc5": MACCheckRules,
"sub_MACDest0": MACCheckRules,
"sub_MACDest1": MACCheckRules,
"sub_MACDest2": MACCheckRules,
"sub_MACDest3": MACCheckRules,
"sub_MACDest4": MACCheckRules,
"sub_MACDest5": MACCheckRules
},
"messages": {
}
};
template.setPromptCheckJSON(checkJSONTempObj, template);
});
template.bind("fillDataByApplyResult", function(event, xml, template){
if ( ActionByApplyResult(xml, template, "Alias") == 0 )
{
var pArr = {
"Order" : {
ValueOrigin: ""
}
};
xmlParaInInstOperate(xml, "OBJ_QOSQC_ID", 0, pArr);
$("[id^='Order']", template).val(pArr.Order.ValueOrigin);
template.trigger("fillDataByCustom",[0, template, xml]);
}
});
template.bind("fillDataByCancelResult", function(event, xml, template){
var OBJID = ["OBJ_QOSQC_ID"];
ActionByCancelResult(xml, template, OBJID);
template.trigger("fillDataByCustom",[0, template, xml]);
});
template.bind("hiddenValueChangeByCustom", function(event,template){
var hiddenDM = $("[id^='DscpMark']", template);
var selectDMValue = $("[id^='S_DscpMark']", template).val();
var inputDMValue = $("[id^='other_DscpMark']", template).val();
if (selectDMValue == "other")
{
hiddenDM.val(inputDMValue);
}
else
{
hiddenDM.val(selectDMValue);
}
var L2P = $("[id^='L2Protocol']",template).val();
var idStr = "[id^='IPDest\\:'],[id^='IPDestMask'],[id^='IPSrc\\:'],"
+ "[id^='IPSrcMask'],[id^='SrcPort\\:'],[id^='SrcPortMax'],"
+ "[id^='DestPortMax'],[id^='DestPort\\:'],[id^='DSCPCheck'],"
+ "[id^='I_IPDestMask'],[id^='I_IPSrcMask'],"
+ "[id^='DscpMark\\:'],[id^='L3ProtocolList'],"
+ "[id^='IPSrcMin\\:'],[id^='IPSrcMax'],"
+ "[id^='IPDestMin\\:'],[id^='IPDestMax']";
var hideOBJs = $(idStr, template);
if (L2P == "ARP")
{
hideOBJs.each(function(){
$(this).val("");
});
}
var ipStr = "[id^='IPSrcMin\\:'],[id^='IPSrcMax'],"
+ "[id^='IPDestMin\\:'],[id^='IPDestMax']";
var ipOBJs = $(ipStr, template);
ipOBJs.each(function(){
if($(this).val() == "")
$(this).val("0.0.0.0");
});
var L3P = $("[id^='L3ProtocolList']",template).val();
var portIdStr = "[id^='DestPort\\:'],[id^='DestPortMax'],"
+ "[id^='SrcPort\\:'],[id^='SrcPortMax']";
var portObjs = $(portIdStr, template);
if (L3P != "TCP" && L3P != "UDP")
{
portObjs.each(function(){
$(this).val("-1");
});
}
if (L3P != "TCP" )
{
$("[id^='TcpAck0']",template).prop("checked", true);
}
var iSMask = $("[id^='I_IPSrcMask']", template).val();
var iDMask = $("[id^='I_IPDestMask']", template).val();
var sIP = $("[id^='IPSrc\\:']", template).val();
var dIP = $("[id^='IPDest\\:']", template).val();
if (iSMask != "" && sIP != "")
{
iSMask = sIP + "/" +iSMask;
}
if (iDMask != "" && dIP != "")
{
iDMask = dIP + "/" +iDMask;
}
$("[id^='IPSrcMask']", template).val(iSMask);
$("[id^='IPDestMask']", template).val(iDMask);
var MACJSON = {
"MACSrc":"sub_MACSrc",
"MACDest":"sub_MACDest"
};
for (var MACTmp in MACJSON)
{
$("[id^='"+MACTmp+"']",template).FillIPorMacDataCombination(MACJSON[MACTmp], ":", 6);
}
});
template.bind("PostDataChangeByCustom", function(event, NameValueJson){
var ElemsMainID = NameValueJson.ElemsMainID;
var ElemsValue = NameValueJson.ElemsValue;
var portNameValue = {
"DestPort" : "",
"DestPortMax" : "",
"SrcPort" : "",
"SrcPortMax" : "",
"DSCPCheck": "",
"DscpMark": "",
"TrafficClass": "",
"VlanID": ""
};
if (portNameValue[ElemsMainID] == ElemsValue)
{
NameValueJson.ElemsValue = "-1";
}
});
template.bind("fillDataByCustom", function(event, suffix, template, xml){
template.collapsibleInstTitleChange("Alias");
var MacJSON = {
"MACSrc":"sub_MACSrc",
"MACDest":"sub_MACDest"
};
for (var MACTmp in MacJSON)
{
var MACOBJ = $("[id^='"+MACTmp+"']",template);
MACOBJ.FillIPorMacDataBySplit(MacJSON[MACTmp], ":", 6);
}
var idString = "[id^='SrcPort'],[id^='SrcPortMax'],[id^='DestPort'],"
+ "[id^='VlanID'],[id^='DestPortMax'],"
+ "[id^='DSCPCheck'],[id^='TrafficClass']";
var portOBJs = $(idString, template);
portOBJs.each(function(){
if ($(this).val() == "-1")
{
$(this).val("");
}
});
var sMaskOBJ = $("[id^='I_IPSrcMask']", template);
var dMaskOBJ = $("[id^='I_IPDestMask']", template);
var sMask = $("[id^='IPSrcMask']", template).val();
var dMask = $("[id^='IPDestMask']", template).val();
if(sMask != "")
{
sMask = sMask.slice(sMask.indexOf("/")+1);
}
if(dMask != "")
{
dMask = dMask.slice(dMask.indexOf("/")+1);
}
sMaskOBJ.val(sMask);
dMaskOBJ.val(dMask);
var hiddenDMVal = $("[id^='DscpMark']", template).val();
if (hiddenDMVal == "-0")
{
hiddenDMVal = "0";
}
var selectDM = $("[id^='S_DscpMark']", template);
var inputDM = $("[id^='other_DscpMark']", template);
if (isDscpMarkOption(hiddenDMVal))
{
selectDM.val(hiddenDMVal);
}
else
{
selectDM.val("other");
inputDM.val(hiddenDMVal);
}
selectDM.change();
$("input:radio[name^='AllInterface']",template).change();
$("[id^='L2Protocol']",template).change();
$("[id^='L3ProtocolList']",template).change();
});
}
$(document).ready(function(){
var qosTypeHeadID = "qosCfgType";
var qosTypeHead = $("#"+qosTypeHeadID);
var qosTypetemplateID = "template_"+ qosTypeHeadID;
var qosTypeServerAddr = $("address span", qosTypeHead).text();
initial_template_qosType(qosTypetemplateID);
qosTypeHead.succfunction = function(xml){
qosTypeHead.hasError(xml,"externErrorHint");
var OBJ = $(xml).find("OBJ_QOSQC_ID");
var RuleNum = $("Instance", OBJ).length;
var OBJID = ["OBJ_QOSQC_ID"];
qosTypeHead.createPageDataByClone(RuleNum, OBJID, xml);
};
if ( $(".collapBarWithDataTrans",qosTypeHead).length <= 0 )
{
qosTypeHead.dataTransfer(qosTypeServerAddr,"GET",qosTypeHead.succfunction);
}
else
{
initial_collapBarWithDataTrans(qosTypeHead);
}
});
})();
</script>
