<script type="text/javascript">
(function(){
$(document).ready(function(){
var RouteTblHeadID = "RouteTable";
var RouteTblHead = $("#"+RouteTblHeadID);
var RouteTblTempalteID = "template_"+ RouteTblHeadID;
var RouteTblServerAddr = $("address span", RouteTblHead).text();
RefreshClickHandle(RouteTblHead);
RouteTblHead.succfunction = function(xml){
RouteTblHead.hasError(xml,"externErrorHint");
var RouteTblOBJ = $(xml).find("OBJ_ROUTETABLE_ID");
var RuleNum = $("Instance", RouteTblOBJ).length;
var OBJID = ["OBJ_ROUTETABLE_ID"];
RouteTblHead.createPageDataByClone(RuleNum,OBJID,xml,
RouteTblHead.fillDataByCustom);
colorTblRow(".colorTbl", "even", RouteTblHead);
};
if ( $(".collapBarWithDataTrans",RouteTblHead).length <= 0 )
{
RouteTblHead.dataTransfer(RouteTblServerAddr,
"GET",
RouteTblHead.succfunction);
}
else
{
initial_collapBarWithDataTrans(RouteTblHead);
}
});
})();
</script>
