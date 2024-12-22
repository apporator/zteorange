<script type="text/javascript">
function Customize_IP(paramsOBJ)
{
var ContainerOBJ = paramsOBJ["ContainerOBJ"];
var IPOBJ = $("[id^='SysLogServer']",ContainerOBJ);
if (IPOBJ.val() == "0.0.0.0")
{
IPOBJ.val("")
}
}
function initial_template(templateID)
{
var template = $("#"+templateID);
var instForm = template.find("form");
instForm.validate({
"rules": {
"SysLogServer": {
"rangelength":[1,256]
},
"SysLogPort": {
"required": true,
"integer": true,
"rangelength":[1,65535]
}
}
});
template.bind("fillDataByApplyResult", function(event, xml, template){
if (template.hasError(xml) == 0)
{
succHintShow(template);
var OBJID = ["OBJ_SYSLOG_ID"];
template.fillDataByOBJID(xml ,OBJID, template,0);
}
});
template.bind("fillDataByCancelResult", function(event, xml, template){
var OBJID = ["OBJ_SYSLOG_ID"];
ActionByCancelResult(xml, template, OBJID);
template.trigger("fillDataByCustom",[0, template]);
});
template.bind("fillDataByCustomActionResult",function(event, xml, template){
if (template.hasError(xml) == 0)
{
var templateID = template.attr("id");
var OBJID = ["OBJ_SYSLOG_ID"];
template.fillDataByOBJID(xml ,OBJID, template, 0);
}
});
template.bind("fillDataByCustom", function(event, suffix, ContainerOBJ){
var CustomizeParams = {
"ContainerOBJ":ContainerOBJ
};
Customize_IP(CustomizeParams);
});
}
$(document).ready(function(){
var HeadID = "SysLogManagerConf";
var Head = $("#"+HeadID);
var templateID = "template_"+HeadID;
var ServerAddr = $("address span", Head).text();
initial_template(templateID);
Head.succfunction = function(xml){
if (Head.hasError(xml) == 0)
{
var OBJID = ["OBJ_SYSLOG_ID"];
var template = $("#"+templateID);
Head.fillDataByOBJID(xml, OBJID, template, 0);
template.trigger("fillDataByCustom",[0, template]);
}
};
if ( $(".collapBarWithDataTrans",Head).length <= 0 )
{
Head.dataTransfer(ServerAddr, "GET", Head.succfunction);
}
else
{
initial_collapBarWithDataTrans(Head);
}
});
</script>
