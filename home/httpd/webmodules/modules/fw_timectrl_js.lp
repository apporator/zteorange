<script type="text/javascript">
(function(){
function initial_template(templateID)
{
var template = $("#"+templateID);
template.bind("fillDataByApplyResult", function(event, xml, template){
ActionByApplyResult(xml, template);
});
template.bind("fillDataByCancelResult", function(event,xml, template){
var OBJID = ["OBJ_FW_TIMECTRL_ID"];
ActionByCancelResult(xml, template, OBJID);
template.trigger("fillDataByCustom",[0, template, xml]);
});
template.bind("fillDataByCustom", function(event, suffix, ContainerOBJ, xml){
var timeVal = $("#Time").val();
for(var i=1; i<=24; i++)
{
if(timeVal[i-1] == "1")
{
$("#TimeCfg"+i).prop("checked", true);
}
else
{
$("#TimeCfg"+i).prop("checked", false);
}
}
});
template.bind("hiddenValueChangeByCustom", function(event,template){
var TimeVal = "";
$(":checkbox", template).each(function(){
var Elem = $(this);
if( Elem.is(':checked'))
{
TimeVal = TimeVal + "1";
}
else
{
TimeVal = TimeVal + "0";
}
});
$("#Time",template).val(TimeVal);
});
var AllObj = $(".AllOn, .AllOff",template);
AllObj.unbind("click");
AllObj.click(function(event){
var AllCtlItme = $(this);
var needCheck = 1;
var EleSelectValue;
if ( AllCtlItme.hasClass("AllOn") )
{
needCheck = 1;
EleSelectValue = 1;
}
else if ( AllCtlItme.hasClass("AllOff") )
{
needCheck = 0;
EleSelectValue = 0;
}
else
{
}
if ( AllCtlItme.attr("EleSelectValue") )
{
EleSelectValue = AllCtlItme.attr("EleSelectValue");
}
$(":checkbox",template).each(function(){
var CheckboxOBJ = $(this);
if ( needCheck == 1)
{
CheckboxOBJ.prop("checked", true);
}
else
{
CheckboxOBJ.prop("checked", false);
}
});
});
}
$(document).ready(function(){
var HeadID = "FwTimeCtrlConf";
var Head = $("#"+HeadID);
var templateID = "template_"+HeadID;
var ServerAddr = $("address span", Head).text();
initial_template(templateID);
Head.succfunction = function(xml){
if (Head.hasError(xml) == 0)
{
var template = $("#"+templateID);
var OBJID = ["OBJ_FW_TIMECTRL_ID"];
Head.fillDataByOBJID(xml ,OBJID, template,0);
template.trigger("fillDataByCustom",[0, template, xml]);
}
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
})();
</script>
