<%
cgilua_lp.include("../../webmodules/modules/tunnel_6in4_status_js.lp", getfenv(1))
%>
<div id="Tnl6in4Status" class="HeadDIV">
<address style="display:none">
<span class="form-action">/?_type=menuData&_tag=tunnel_6in4_status_lua.lua</span>
</address>
<div class="externErrorHint" style="display:none;">
<span class="caption1"></span>
</div>
<h1 class="collapBarWithDataTrans" id="Tnl6in4StatusBar">&?Tnl6in4Status_007;</h1>
<div id="Tnl6in4Status_container">
<div class="errorHint" style="display:none;">
<span class="caption1"></span>
</div>
<div class="noDataHint" style="display:none;">
<span>&?public_023;</span>
</div>
<input type="hidden" id="DataHasBeenGot" value="0">
<div id="template_Tnl6in4Status" style="display:none;">
<form class="colorTbl form_content">
<input type="hidden" id="6rdprefixLen" name="6rdprefixLen" value="" />
<div id="Tnl6in4Status_title" class="colorTblRow emFont titleRow">
<span class="w250 emFont" title="&?Tunnel6in4_003;">&?Tunnel6in4_003;</span>
<span class="w400" id="Tunl64Aliasname" title=""></span>
</div>
<div class="colorTblRow">
<span class="w250 emFont" title="&?public_104;">&?public_104;</span>
<span class="w400" id="MTU" title=""></span>
</div>
<div class="colorTblRow">
<span class="w250 emFont" title="&?public_015;">&?public_015;</span>
<span class="w400" id="TUN64WANName"></span>
</div>
<div class="colorTblRow">
<span id="Item_6rdtype">
<span class="w250 emFont" title="&?Tunnel6in4_009;">&?Tunnel6in4_009;</span>
<span class="w400" id="6rdtype" title=""></span>
</span>
</div>
<div class="colorTblRow" id="Item_6rdprefix">
<span class="w250 emFont" title="&?Tunnel6in4_010;">&?Tunnel6in4_010;</span>
<span class="w400" id="6rdprefix" title=""></span>
</div>
<div class="colorTblRow" id="Item_6rdBRIPv4Addr">
<span class="w250 emFont" title="&?Tunnel6in4_012;">&?Tunnel6in4_012;</span>
<span class="w400" id="6rdBRIPv4Addr" title=""></span>
</div>
<div class="colorTblRow" id="Item_IPv4MaskLen">
<span class="w250 emFont" title="&?Tunnel6in4_011;">&?Tunnel6in4_011;</span>
<span class="w400" id="IPv4MaskLen" title=""></span>
</div>
<div class="colorTblRow" id="Item_CS4Static">
<span class="w250 emFont" title="&?Tnl6in4Status_003;">&?Tnl6in4Status_003;</span>
<span class="w400" id="ConnStatus" title=""></span>
</div>
<div class="colorTblRow" id="Item_ConnStatus">
<span class="w250 emFont" title="&?Tnl6in4Status_003;">&?Tnl6in4Status_003;</span>
<span class="w400" id="ConnStatus"></span>
</div>
</form>
</div>
<div class="buttongroup">
<input type="button" class="Button Btn_refresh" id="Tnl6in4Status_Btn_refresh" name="Tnl6in4Status_Btn_refresh" value="&?public_003;" />
</div>
</div>
</div>
