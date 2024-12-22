<script type="text/javascript">
(function(){
function initial_CutomButton(template)
{
$(".Btn_refresh", template).each(function(){
$(this).unbind("click");
$(this).bind("click", function(){
var template = $(this).parents("[id^='template_']");
var Head = template.parents(".HeadDIV");
var ServerAddr = $("address span", Head).text();
var PostData = "IF_ACTION=Refresh";
var PostSuccHandler = "fillDataByCustomActionResult";
dataPost("Refresh", PostSuccHandler, ServerAddr, template, PostData);
});
});
$(".Btn_save", template).each(function(){
$(this).unbind("click");
$(this).bind("click", function(){
var HeadID = "LogManagerConf";
var Head = $("#"+HeadID);
var loadAllowAddr = "/?_type=menuData&_tag=updownload_prevent_ctl.lua";
var postData = "&sessToken=" +document.getElementById("TOKEN_DOWNLOAD").value;
dataPost("updownload", "g_downLoadAllowHandle", loadAllowAddr, template, postData);
});
});
}
function initial_template(templateID)
{
var template = $("#"+templateID);
template.bind("g_downLoadAllowHandle", function(event,xml, template){
var HeadID = "LogManagerConf";
var Head = $("#"+HeadID);
if (Head.hasError(xml) == 0)
{
var fileURL = "/?_type=menuData&_tag=do_download_syslog.lua";
document.getElementById("fDownload").action = fileURL;
document.fDownload.submit();
}
else
{
showWaitTip(false);
}
});
template.bind("fillDataByApplyResult", function(event, xml, template){
if (template.hasError(xml) == 0)
{
succHintShow(template);
var OBJID = ["OBJ_LOG_ID"];
template.fillDataByOBJID(xml ,OBJID, template,0);
}
});
template.bind("fillDataByCancelResult", function(event, xml, template){
var OBJID = ["OBJ_LOG_ID"];
ActionByCancelResult(xml, template, OBJID);
template.trigger("fillDataByCustom",[0, template]);
});
template.bind("fillDataByCustomActionResult",function(event, xml, template){
if (template.hasError(xml) == 0)
{
var templateID = template.attr("id");
var OBJID = ["OBJ_LOG_ID"];
template.fillDataByOBJID(xml ,OBJID, template, 0);
}
});
$("#LogEnable").click(function(){
var LogEnableRadio = $("input[name=LogEnable]:checked").val();
if(1==LogEnableRadio)
{
$("#div_LogLevel").showIt(true);
$("#LogLevel").removeClass("PostIgnore");
}
else
{
$("#div_LogLevel").showIt(false);
$("#LogLevel").addClass("PostIgnore");
}
});
template.bind("fillDataByCustom", function(event, suffix, ContainerOBJ){
var CustomizeParams = {
"ContainerOBJ":ContainerOBJ
};
$("#LogEnable").click();
});
}
$(document).ready(function(){
var HeadID = "LogManagerConf";
var Head = $("#"+HeadID);
var templateID = "template_"+HeadID;
initial_template(templateID);
initial_CutomButton($("#"+templateID));
Head.succfunction = function(xml){
if (Head.hasError(xml) == 0)
{
var OBJID = ["OBJ_LOG_ID"];
var template = $("#"+templateID);
Head.fillDataByOBJID(xml, OBJID, template, 0);
template.trigger("fillDataByCustom",[0, template]);
}
};
if ( $(".collapBarWithDataTrans",Head).length > 0 )
{
initial_collapBarWithDataTrans(Head);
}
});
})();
</script>
