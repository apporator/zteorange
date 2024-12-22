<script type="text/javascript">
var g_isThinklua = true;
</script>
<%
if env.getenv("TopoPageVer") == "v2" then
if _G.commConf.broadwiseTopo then
cgilua.lp.include("../../webmodules/modules/topo_v2_broadwise_js.lp", getfenv(1))
else
cgilua.lp.include("../../webmodules/modules/topo_v2_common_js.lp", getfenv(1))
end
else
cgilua.lp.include("../../webmodules/modules/topo_common_js.lp", getfenv(1))
end
%>
