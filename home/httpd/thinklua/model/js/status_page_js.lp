<script type="text/javascript">
(function(){
var pageConf = JSON.parse("<%=page.jsInfo%>");
$(document).ready(function(){
var commStatusHeadID = pageConf.id;
var commStatusHead = $("#"+commStatusHeadID);
var commStatusContainer = $("#"+commStatusHeadID+"_container");
var commStatusTemplate = $("#template_"+commStatusHeadID);
var ServerAddr = $("address span", commStatusHead).text();
var changeDataFunc = new Array();
changeDataFunc["chS2HMS"] = function(sec){
var chResult = Second2DHMS(sec);
var h = chResult.day*24+chResult.hour;
return (h + " &?Statusuptime_002; " + chResult.minute + " &?Statusuptime_003; " + chResult.second + " &?Statusuptime_004;");
};
changeDataFunc["chS2DHMS"] = function(sec){
var chResult = Second2DHMS(sec);
return (chResult.day + " &?Statusuptime_001; " + chResult.hour + " &?Statusuptime_002; " + chResult.minute + " &?Statusuptime_003; " + chResult.second + " &?Statusuptime_004;");
};
RefreshClickHandle(commStatusHead);
commStatusHead.chanegeDataByCustom =function(xml){
colorTblRow(".colorTbl", "even", commStatusHead);
if(pageConf.action == undefined){
return;
}
if(pageConf.action.changeData == undefined){
return;
}
var chData = pageConf.action.changeData;
for(index in pageConf.objList){
var objName = pageConf.objList[index];
var instances = xml[objName].Instance;
for(i in instances){
var inst = instances[i];
for(para in inst){
if(chData[para] == undefined){
continue;
}
var rule = chData[para];
if(changeDataFunc[rule] == undefined){
continue;
}
inst[para] = changeDataFunc[rule](inst[para]);
}
}
}
};
commStatusHead.fillDataByCustom =function(xml){
};
commStatusHead.succfunction = function(xml){
var cmapiErrorContainer = $(".errorHint",commStatusHead);
if (cmapiErrorContainer.hasError(xml) == 0){
commStatusHead.chanegeDataByCustom(xml);
if(pageConf.mode=="single"){
commStatusHead.fillDataByOBJID(xml, pageConf.objList, commStatusContainer, 0);
}
else{
var OBJName = pageConf.objList[0];
var instNum = xml[OBJName].Instance.length;
commStatusHead.createPageDataByClone(instNum, pageConf.objList, xml, commStatusHead.fillDataByCustom);
}
}
};
if ( $(".collapBarWithDataTrans",commStatusHead).length <= 0 ){
commStatusHead.dataTransfer(ServerAddr,"GET",commStatusHead.succfunction);
}
else{
initial_collapBarWithDataTrans(commStatusHead);
}
});
})();
</script>
