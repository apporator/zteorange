<script type="text/javascript">
<% if CountryCode == "140" then %>
$(document).ready(function(){
$("#LocalTimeZoneandName option[value='50']").text("&?OJO_SNTP_001;");
});
<%end%>
</script>
<script type="text/javascript">
<% if env.getenv("CountryCode") == "138" then %>
$(document).ready(function(){
$("#LocalTimeZoneandName option[value='61']").text("&?Ivory_SNTP_001;");
});
<%end%>
</script>
<script type="text/javascript">
<% if env.getenv("CountryCode") == "174" then %>
$(document).ready(function(){
$("#LocalTimeZoneandName option[value='61']").text("&?Orange_SNTP_001;");
});
<%end%>
</script>
<script type="text/javascript">
<% if env.getenv("CountryCode") == "156" then %>
$.unsubscribe("/some/SNTPModify");
function ctcSNTP(e,subTemplate,b,c)
{
$("#_DevCurrTime").text(currTimeNotSec.replace("T"," "));
var TimeValue = $('#CurrentLocalTime', subTemplate).val();
$("#CCurrentLocalTime").text(TimeValue.replace("T"," "));
$("#TipSntp",subTemplate).text("&?public_086;");
}
$.subscribe("/some/SNTPModify", ctcSNTP);
<%end%>
</script><script type="text/javascript">
$(document).ready(function(){
<% if CountryCode == "128" or CountryCode == "185" or CountryCode == "124" then %>
$("#LocalTimeZoneandName option[value='13']").text("&?Kama_Sntp_001;");
<%end%>
<% if CountryCode == "204" then %>
$("#LocalTimeZoneandName option[value='45']").text("&?Kama_Sntp_002;");
<%end%>
});
</script>
