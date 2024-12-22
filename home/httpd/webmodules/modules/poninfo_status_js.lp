<script type="text/javascript">
(function(){
var LosInfo = "";
$(document).ready(function(){
var RegStatusHeadID = "PonInfoOptical";
var RegStatusHead = $("#"+RegStatusHeadID);
var ServerAddr = $("address span", RegStatusHead).text();
RefreshClickHandle(RegStatusHead);
RegStatusHead.chanegeDataByCustom =function(xml){
colorTblRow(".colorTbl", "even", RegStatusHead);
};
RegStatusHead.succfunction = function(xml){
var cmapiErrorContainer = $(".errorHint",RegStatusHead);
if (cmapiErrorContainer.hasError(xml) == 0);
{
RegStatusHead.chanegeDataByCustom(xml);
LosInfo = getParaValueInXML(xml, "OBJ_LOS_INFO_ID", 0, "LosInfo");
var RegStatus = getParaValueInXML(xml, "OBJ_GPONREGSTATUS_ID", 0, "RegStatus");
var GponRegStatus = "";
switch(RegStatus)
{
case "0": GponRegStatus = "&?ponreg002;";break;
case "1": GponRegStatus = "&?ponreg003;";break;
case "2": GponRegStatus = "&?ponreg004;";break;
case "3": GponRegStatus = "&?ponreg005;";break;
case "4": GponRegStatus = "&?ponreg006;";break;
case "5": GponRegStatus = "&?ponreg007;";break;
case "6": GponRegStatus = "&?ponreg008;";break;
case "7": GponRegStatus = "&?ponreg009;";break;
default: GponRegStatus = "&?ponreg002;";break;
}
var InternetSipLineOBJ = $(xml).find("OBJ_PON_OPTICALPARA_ID");
var RegStatusRuleNum = $("Instance", InternetSipLineOBJ).length;
var OBJID = ["OBJ_PON_OPTICALPARA_ID"];
RegStatusHead.fillDataByOBJID(xml, OBJID, $("#PonInfoOptical_container"), 0);
if(LosInfo == "1")
{
$("#RxPower").html("--");
$("#TxPower").html("--");
}
$("#RegStatus").html(GponRegStatus);
}
};
if ( $(".collapBarWithDataTrans",RegStatusHead).length <= 0 )
{
RegStatusHead.dataTransfer(ServerAddr,
"GET",
RegStatusHead.succfunction);
}
else
{
initial_collapBarWithDataTrans(RegStatusHead);
}
});
})();
</script>
