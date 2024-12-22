<script>
<% if "156" == env.getenv("CountryCode") then%>
function CtcWANhideLAN(e,subTemplate,b,c){
var userObj = $("[id='template_AccountManag_1']",subTemplate);
if(userObj.length > 0)
{
userObj.remove();
}
}
$.subscribe("/some/ctcHideUser", CtcWANhideLAN);
<% end %>
</script><script>
<% if "98" == env.getenv("CountryCode") and "1" == env.getenv("Right") then%>
$.unsubscribe("/some/ctcHideUser");
function IndiaHathwayHideAdmin(e,subTemplate,b,c){
var adminObj = $("[id='template_AccountManag_0']",subTemplate);
if(adminObj.length > 0)
{
adminObj.remove();
$("[id='AccountManagBar:1]",subTemplate).attr("class","collapsibleBar collapsibleBarExp");
$("[id='AccountManag_container:1']",subTemplate).show();
}
}
$.subscribe("/some/ctcHideUser", IndiaHathwayHideAdmin);
<% end %>
</script>
