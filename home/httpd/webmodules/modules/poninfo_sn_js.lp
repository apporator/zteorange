<script type="text/javascript">
(function(){
function changeSnVenderToHex(){
<% if "173" == CountryCode then %>
var snval = $("#Sn").val();
$("#Sn").val("5A544547" + snval.substr(snval.length-8));
<% elseif "183" == CountryCode or "202" == CountryCode or "2005" == CountryCode then %>
var snval = $("#Sn").val();
$("#Sn").val("5A544547" + snval.substr(snval.length-8).toUpperCase());
<% end %>
}
function initial_template_PonSn(templateID)
{
var template = $("#"+templateID);
var instForm = template.find("form");
instForm.validate({
"rules": {
"Pwd": {
<% if "21" == CountryCode then %>
"ASCII": true,
<% else %>
"PasswordASCII": true,
<% end %>
"required": true,
"rangelength":[1,10]
}
},
"messages": {
}
});
template.bind("fillDataByApplyResult", function(event,xml, template){
ActionByApplyResult(xml, template);
});
template.bind("fillDataByCancelResult", function(event,xml, template){
var OBJID = ["OBJ_SN_INFO_ID"];
ActionByCancelResult(xml, template, OBJID);
changeSnVenderToHex();
});
}
$(document).ready(function(){
var HeadID = "PonSn";
var Head = $("#"+HeadID);
var ServerAddr = $("address span", Head).text();
initial_template_PonSn("template_"+HeadID);
Head.succfunction = function(xml){
var cmapiErrorContainer = $(".errorHint",Head);
if (cmapiErrorContainer.hasError(xml) == 0)
{
var OBJ = $(xml).find("OBJ_SN_INFO_ID");
var RuleNum = $("Instance", OBJ).length;
var tempobj = $("#template_PonSn");
var OBJID = ["OBJ_SN_INFO_ID"];
Head.fillDataByOBJID(xml, OBJID, tempobj, 0);
changeSnVenderToHex();
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
