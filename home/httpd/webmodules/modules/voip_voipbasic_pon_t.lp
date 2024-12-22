<%
cgilua_lp.include("../../webmodules/modules/voip_voipbasic_pon_js.lp", getfenv(1))
%>
<div id="VOIPSipAccountConf" class="HeadDIV">
<address style="display:none">
<span class="form-action">/?_type=menuData&_tag=voip_voipbasic_pon_lua.lua</span>
</address>
<div class="externErrorHint" style="display:none;">
<span class="caption1"></span>
</div>
<h1 class="collapBarWithDataTrans" id="VOIPRegStatusBar">SIP Account</h1>
<div id="VOIPSipAccountConf_container">
<input type="hidden" id="DataHasBeenGot" value="0">
<div id="template_VOIPSipAccountConf">
<div class="sceneTip">
<div class="sceneTipLink"><a>&?VoipBasic_003;</a></div>
<div class="sceneTip_container">
<p>&?VoipBasic_004;</p>
<p class="sceneTip_close"><a>&?public_020;</a></p>
</div>
</div>
<form class="form_content">
<div id="changeArea_VOIPSipAccountConf" class="ChangeArea formTblWrap">
<div class="errorHint" style="display:none;">
<span class="caption1"></span>
</div>
<div class="succHint" style="display:none;">
<span class="caption1">&?public_021;</span>
</div>
<div class="formTbl">
<input type="hidden" id="_InstID" value="">
<input type="hidden" id="_InstIDVP" value="">
<input type="hidden" id="Enable" value="">
<div class="row">
<label for="AuthUserName" class="cfgLabel w180" >&?VoipBasic_005;</label>
<div class="right">
<input type="text" id="AuthUserName" name="AuthUserName" value="" class="inputNorm"/>
<span style="display: none;">&?public_073;0 ~ 127</span>
</div>
</div>
<div class="row">
<label for="DigestUserName" class="cfgLabel w180">&?VoipBasic_007;</label>
<div class="right">
<input type="text" id="DigestUserName" name="DigestUserName" class="inputNorm"/>
<span style="display: none;">&?public_073;0 ~ 127</span>
</div>
</div>
<div class="row">
<label for="AuthPassword" class="cfgLabel w180">&?public_027;</label>
<div class="right">
<input class="SpecialPassword inputNorm" type="password" id="AuthPassword" name="AuthPassword" value="						" autocomplete="new-password"/>
<span style="display: none;">&?public_073;0 ~ 31</span>
</div>
</div>
<div class="row">
<label for="cfgEnable" class="cfgLabel w180">&?Pinpublic_013;</label>
<div class="right">
<input type="checkbox" id="cfgEnable" name="cfgEnable" value="" checked="checked"/>
</div>
</div>
<div class="buttongroup">
<input type="button" class="Button Btn_apply" id="Btn_apply_VOIPSipAccountConf" name="Btn_apply_VOIPSipAccountConf" value="&?homeline_007;" />
</div>
</div>
</div>
</form>
</div>
<div id="VOIPSipAccount_devlist" class="colorTbl form_content" style="overflow-y:auto;height:220px;white-space: nowrap;overflow-x:hidden;text-align: center;width:745px;">
<table id="VOIPSipAccount_devlist_table">
<tr class="colorTblRow emFont titleRow">
<td>
<span class="w150" title="&?VoipBasic_005;">&?VoipBasic_005;</span>
</td>
<td>
<span class="w180" title="&?VoipBasic_007;">&?VoipBasic_007;</span>
</td>
<td>
<span class="w150" title="&?public_027;">&?public_027;</span>
</td>
<td>
<span class="w120" title="&?Pinpublic_013;">&?Pinpublic_013;</span>
</td>
<td>
<span class="w120" title="&?homeline_009;">&?homeline_009;</span>
</td>
</tr>
<tr id="template_VOIPSipAccount_devlist_table" class="colorTblRow" style="display:none;">
<input type="hidden" id="_InstID" value="">
<input type="hidden" id="_InstIDVP" value="">
<td class="w150" id="AuthUserName" title="" encode="1"></td>
<td class="w180" id="DigestUserName" title="" encode="1"></td>
<td class="w150" id="AuthPassword" title=""></td>
<td class="w120" id="Enable" title=""></td>
<td id="modify" title="modify">
<a href="">
<img src="img/modify.gif" alt="modify" />
</a>
</td>
</tr>
</table>
</div>
</div>
</div>
