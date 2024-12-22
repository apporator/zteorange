<%
cgilua_lp.include("../../webmodules/modules/tunnel_6in4_config_js.lp", getfenv(1))
%>
<div id="Tunnel6in4" class="HeadDIV">
<address style="display:none">
<span class="form-action">/?_type=menuData&_tag=tunnel_6in4_config_lua.lua</span>
</address>
<div class="externErrorHint" style="display:none;">
<span class="caption1"></span>
</div>
<h1 class="collapBarWithDataTrans" id="Tunnel6in4Bar">&?Tunnel6in4_016;</h1>
<div id="Tunnel6in4_container">
<div class="sceneTip">
<div class="sceneTipLink"><a>&?Tunnel6in4_017;</a></div>
<div class="sceneTip_container">
<p>&?Tunnel6in4_018;</p>
<p class="sceneTip_close"><a>&?public_020;</a></p>
</div>
</div>
<input type="hidden" id="_InstNum" value="0">
<input type="hidden" id="DataHasBeenGot" value="0">
<div id="template_Tunnel6in4" style="display:none;">
<div id="topLine_Tunnel6in4" class="formTblCtrlBar">
<span id="instName_Tunnel6in4" class="instName collapsibleInst">&?public_041;</span>
<span id="instDelete_Tunnel6in4" class="instDelete Btn_delete"><img src="img/del.png" alt="delete" /></span>
</div>
<form class="form_content">
<div id="changeArea_Tunnel6in4" class="formTblWrap ChangeArea" style="display:none">
<div class="errorHint" style="display:none;">
<span class="caption1"></span>
</div>
<div class="succHint" style="display:none;">
<span class="caption1">&?public_021;</span>
</div>
<div class="formTbl">
<input type="hidden" id="_InstID" value="-1" />
<input type="hidden" id="REMOTEIPAddr" value="" />
<input type="hidden" id="6rdBRIPv4Addr" value="" />
<div class="row">
<label for="Tunl64Aliasname" class="left w180">&?Tunnel6in4_003;</label>
<div class="right">
<input type="text" id="Tunl64Aliasname" name="Tunl64Aliasname" value="" class="inputNorm"/>
<span class="utf8Compatible" style="display:none;">&?public_073;1 ~ 32</span>
</div>
</div>
<div class="row">
<label class="left w180">&?public_015;</label>
<div id="Method" class="right">
<input type="radio" id="AutoSense" name="Method" value="1" checked="checked"><label for="AutoSense">&?public_094;</label>&nbsp;&nbsp;
<input type="radio" id="Manual" name="Method" value="0"><label for="Manual">&?public_093;</label>
</div>
</div>
<div class="row" id="Div_WANCID" style="display:none;">
<label for="WANCID" class="left w180">&nbsp;</label>
<div class="right">
<select name="WANCID" id="WANCID" class="selectNorm">
<option value="" title='&?public_089;' selected="selected">&?public_089;</option>
<%cgilua.put(_G.CreateIFOpStr("Tunnel6in4"))%>
</select>
</div>
</div>
<div class="row">
<label for="MTU" class="left w180">&?public_104;</label>
<div class="right">
<input type="text" id="MTU" name="MTU" value="1380" class="inputNorm"/>
</div>
</div>
<div class="row" id="Div_6rdtype">
<label for="6rdtype" class="left w180">&?Tunnel6in4_009;</label>
<div class="right">
<select name="6rdtype" id="6rdtype" class="selectNorm">
<option value ="Static" title='&?public_099;'>&?public_099;</option>
<option value ="Auto" title='&?public_071;'>&?public_071;</option>
</select>
</div>
</div>
<div class="row" id="Div_6rdprefix">
<label for="6rdprefix" class="left w180">&?Tunnel6in4_010;</label>
<div class="right">
<input type="text" id="6rdprefix" name="6rdprefix" value="" class="inputNorm"/>/
<input type="text" id="6rdprefixLen" name="6rdprefixLen" value="" class="w37"/>
<span style="display:none;">&?public_072;1 ~ 64</span>
</div>
</div>
<div class="row" id="Div_IPv4MaskLen">
<label for="IPv4MaskLen" class="left w180">&?Tunnel6in4_011;</label>
<div class="right">
<input type="text" id="IPv4MaskLen" name="IPv4MaskLen" value="" class="inputNorm"/>
<span style="display:none;">&?public_072;0 ~ 32</span>
</div>
</div>
<div class="row" id="Div_6rdBRIPv4Addr">
<label for="sub_6rdBRIPv4Addr0" class="left w180">&?Tunnel6in4_012;</label>
<div class="right">
<input class="ip" name="sub_6rdBRIPv4Addr0" type="text" maxlength="3" id="sub_6rdBRIPv4Addr0" value="" />.
<input class="ip" name="sub_6rdBRIPv4Addr1" type="text" maxlength="3" id="sub_6rdBRIPv4Addr1" value="" />.
<input class="ip" name="sub_6rdBRIPv4Addr2" type="text" maxlength="3" id="sub_6rdBRIPv4Addr2" value="" />.
<input class="ip" name="sub_6rdBRIPv4Addr3" type="text" maxlength="3" id="sub_6rdBRIPv4Addr3" value="" />
</div>
</div>
<div class="buttongroup">
<input type="button" class="Button Btn_cancel PostIgnore" id="Btn_cancel_Tunnel6in4" name="Btn_cancel_Tunnel6in4" value="&?public_019;" />
<input type="button" class="Button Btn_apply PostIgnore" id="Btn_apply_Tunnel6in4" name="Btn_apply_Tunnel6in4" value="&?public_018;" />
</div>
</div>
</div>
</form>
</div>
<div class="addInstBar">
<span id="addInstBar_Tunnel6in4" class="instNew addInst">&?public_098;</span>
</div>
</div>
</div>
