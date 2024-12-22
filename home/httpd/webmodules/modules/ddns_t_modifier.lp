<script>
<%
if "36" == env.getenv("CountryCode") then
%>
function ddnsSelectModify(e,subTemplate,b,c)
{
var provideTmpValue = $("#Provider").find("option:selected").val();
if(provideTmpValue == "DynDNS" || provideTmpValue == "No-IP")
$("#div_Status").show();
else
$("#div_Status").hide();
}
$.subscribe("/some/selectModify", ddnsSelectModify);
<%
end
%>
</script>
