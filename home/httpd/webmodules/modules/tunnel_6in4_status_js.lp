<script type="text/javascript">
(function(){
function Customize_T64Status(paramsOBJ)
{
var ContainerOBJ = paramsOBJ["ContainerOBJ"];
$("[id^='Item_6rdtype']", ContainerOBJ).show();
var sixrdTypeObj = $("[id^='6rdtype\\:']", ContainerOBJ);
var sixrdType = sixrdTypeObj.text();
if (sixrdType == "Auto")
{
$("[id^='Item_6rdprefix']", ContainerOBJ).hide();
$("[id^='Item_6rdBRIPv4Addr']", ContainerOBJ).hide();
$("[id^='Item_IPv4MaskLen']", ContainerOBJ).hide();
$("[id^='Item_CS4Static']", ContainerOBJ).hide();
$("[id^='Item_ConnStatus']", ContainerOBJ).show();
}
else
{
$("[id^='Item_6rdprefix']", ContainerOBJ).show();
$("[id^='Item_6rdBRIPv4Addr']", ContainerOBJ).show();
$("[id^='Item_IPv4MaskLen']", ContainerOBJ).show();
$("[id^='Item_CS4Static']", ContainerOBJ).show();
$("[id^='Item_ConnStatus']", ContainerOBJ).hide();
}
var sixrdTypeText = {
"Auto": "&?public_071;",
"Static": "&?public_099;"
};
sixrdTypeObj.text(sixrdTypeText[sixrdType]);
sixrdTypeObj.attr("title", sixrdTypeText[sixrdType]);
var TUN64WANName = $("[id^='TUN64WANName']", ContainerOBJ);
if ("" == TUN64WANName.text())
{
TUN64WANName.text("&?public_094;");
}
TUN64WANName.attr("title", TUN64WANName.text());
$("[id^='ConnStatus']", ContainerOBJ).each(function(){
var statusItem = $(this);
if (statusItem.text() == "0")
{
statusItem.text("&?Tnl6in4Status_004;");
}
else if (statusItem.text() == "1")
{
statusItem.text("&?Tnl6in4Status_005;");
}
else
{
}
statusItem.attr("title", statusItem.text());
});
var sixrdprefixObj = $("[id^='6rdprefix\\:']", ContainerOBJ);
var sixrdprefixLen = $("[id^='6rdprefixLen']", ContainerOBJ).val();
sixrdprefixObj.text(sixrdprefixObj.text() + "/" + sixrdprefixLen);
sixrdprefixObj.attr("title", sixrdprefixObj.text());
}
$(document).ready(function(){
var T64StatusHeadID = "Tnl6in4Status";
var T64StatusHead = $("#"+T64StatusHeadID);
var T64StatusServerAddr = $("address span", T64StatusHead).text();
RefreshClickHandle(T64StatusHead);
T64StatusHead.fillDataByCustom = function(suffix,ContainerOBJ){
var CustomizeParams = {
"ContainerOBJ":ContainerOBJ
};
Customize_T64Status(CustomizeParams);
};
T64StatusHead.succfunction = function(xml){
T64StatusHead.hasError(xml,"externErrorHint");
var OBJ = $(xml).find("OBJ_TUNNEL64_ID");
var RuleNum = $("Instance", OBJ).length;
if (RuleNum == 0)
{
$(".noDataHint", T64StatusHead).showIt(true);
}
else
{
$(".noDataHint", T64StatusHead).showIt(false);
var OBJID = ["OBJ_TUNNEL64_ID"];
T64StatusHead.createPageDataByClone(RuleNum,OBJID,xml,T64StatusHead.fillDataByCustom);
colorTblRow(".colorTbl", "even", T64StatusHead);
}
};
if ( $(".collapBarWithDataTrans",T64StatusHead).length <= 0 )
{
T64StatusHead.dataTransfer(T64StatusServerAddr, "GET", T64StatusHead.succfunction);
}
else
{
initial_collapBarWithDataTrans(T64StatusHead);
}
});
})();
</script>
