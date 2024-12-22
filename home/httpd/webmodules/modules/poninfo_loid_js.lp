<script type="text/javascript">
(function(){
jQuery.validator.addMethod("spaceForbid", function(value, element) {
return ( this.optional(element) || value.match("[ ]") == null );
}, $.validator.format("&?PON_007;"));
function initial_template_PonLoidHead(templateID)
{
var template = $("#"+templateID);
var instForm = template.find("form");
instForm.validate({
"rules": {
"PonLoid": {
"ASCII": true,
"required": true,
"rangelength":[1,24],
"spaceForbid":true
},
"LoidPasswd": {
"PasswordASCII": true,
"rangelength":[0,12]
}
},
"messages": {
}
});
template.bind("fillDataByApplyResult", function(event,xml, template){
ActionByApplyResult(xml, template);
});
template.bind("fillDataByCancelResult", function(event,xml, template){
var OBJID = ["OBJ_PON_LOID_ID"];
ActionByCancelResult(xml, template, OBJID);
});
}
$(document).ready(function(){
var HeadID = "PonLoidHead";
var Head = $("#"+HeadID);
var ServerAddr = $("address span", Head).text();
initial_template_PonLoidHead("template_"+HeadID);
Head.succfunction = function(xml){
var cmapiErrorContainer = $(".errorHint",Head);
if (cmapiErrorContainer.hasError(xml) == 0)
{
var OBJ = $(xml).find("OBJ_PON_LOID_ID");
var RuleNum = $("Instance", OBJ).length;
var tempobj = $("#template_PonLoidHead");
var OBJID = ["OBJ_PON_LOID_ID"];
Head.fillDataByOBJID(xml, OBJID, tempobj, 0);
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
