<script type="text/javascript">
var cver = "<%=CountryCode%>";
function initial_template_LanDevDHCPSource(templateID)
{
var template = $("#"+templateID);
template.bind("fillDataByApplyResult", function(event, xml, template){
ActionByApplyResult(xml, template);
});
template.bind("fillDataByCancelResult", function(event, xml, template){
var templateID = template.attr("id");
if ( template.hasError(xml) == 0 )
{
var RuleNum = $("#_InstNum", template).val();
for (var i=0; i<RuleNum; i++)
{
var _InstID = $("[id^='_InstID_']", template).eq(i).val();
var RuleObj = $("[id^='div_LanDevDHCPSourceRule_']", template).eq(i);
var DataOBJID = ["OBJ_LANDEVDHCPSOURCE_ID"];
var suffix = getInstIndexByPath(xml, DataOBJID[0], _InstID);
RuleObj.fillDataByOBJID(xml, DataOBJID, RuleObj, suffix, "_");
}
}
});
if (cver=="174")
{
$("#Btn_apply_LanDevDHCPSource").bind("click", {templateOBJ:template}, function(event){
var template = event.data.templateOBJ;
var Head = template.parents(".HeadDIV");
var ServerAddr = $("address span", Head).text();
var confirmLayerOBJ = IniConfirm("&?mali_IPV4Apply_001;");
$("#confirmOK", confirmLayerOBJ).val("&?Lan_IPV4_001;");
$("#confirmCancel", confirmLayerOBJ).val("&?Lan_IPV4_002;");
$("#confirmOK",confirmLayerOBJ).bind("click", {FuncOBJ: template}, function(event){
showWaitTip(false);
dataPost("Apply", "fillDataByApplyResult", ServerAddr, template, undefined, false);
});
});
}
}
$(document).ready(function(){
var HeadID = "LanDevDHCPSource";
var Head = $("#"+HeadID);
var ServerAddr = $("address span", Head).text();
if (cver=="174")
{
$("#Btn_apply_LanDevDHCPSource",Head).remove();
var BtnStr = "<input type='button' class='Button' id='Btn_apply_LanDevDHCPSource' name='Btn_apply_LanDevDHCPSource' value='&?public_018;' />"
$(".buttongroup",Head).append(BtnStr);
}
initial_template_LanDevDHCPSource("template_"+HeadID);
Head.succfunction = function(xml){
Head.hasError(xml,"externErrorHint");
var OBJ = $(xml).find("OBJ_LANDEVDHCPSOURCE_ID");
var RuleNum = $("Instance", OBJ).length;
var TemplateOBJ = $("#template_"+HeadID,Head);
if (RuleNum == 0)
{
$(".noDataHint",Head).showIt(true);
TemplateOBJ.showIt(false);
}
else
{
$(".noDataHint",Head).showIt(false);
TemplateOBJ.showIt(true);
$("#_InstNum", Head).val(RuleNum);
for (var i=0; i<RuleNum; i++)
{
var ruleTemplate = $("#div_LanDevDHCPSourceRule");
var clone = ruleTemplate.cloneWithSuffix(i, "_");
ruleTemplate.before(clone);
var DataOBJID = ["OBJ_LANDEVDHCPSOURCE_ID"];
clone.fillDataByOBJID(xml, DataOBJID, clone, i, "_");
clone.showIt(true);
}
}
$.publish("/some/softVersionModify", [Head]);
$.publish("/some/sncTAHidden", [Head]);
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
