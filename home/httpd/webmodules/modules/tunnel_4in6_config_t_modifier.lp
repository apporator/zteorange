<script type="text/javascript">
<% if CountryCode == "174" then %>
(function(){
$(document).ready(function(){
$(".utf8Compatible").html("&?public_073;1 ~ 21");
});
})();
$.addModifier("internetConfig/DSLite", function(data){
data.checkJSONTemp["rules"]["Tunnel46name"]={
"utf8": true,
"required": true,
"utf8LengthRange":[1,64]
}
});
<%end%>
</script>
<script>
<% if env.getenv("CountryCode") == "124" then %>
(function(){
$(document).ready(function(){
$("[id^='TUN46REMOTEIPAddr']").val("aftr.orange.sn");
});
})();
<%
end
%>
</script>
