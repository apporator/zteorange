<script>
<%
if env.getenv("CountryCode") == "48" then
local uRight = session_get(sess_id, "Right")
if uRight == "2" then
%>
(function(){
$(document).ready(function(){
$("input,select").attr("disabled",true);
$('.buttongroup').remove();
});
})();
<%
end
end
%>
</script>
