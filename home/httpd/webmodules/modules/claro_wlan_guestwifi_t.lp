<%
cgilua_lp.include("../../webmodules/modules/claro_wlan_guestwifi_js.lp", getfenv(1))
%>
<div id="WlanGuestwifi" class="HeadDIV">
<address style="display:none">
<span class="form-action">/?_type=menuData&_tag=claro_wlan_guestwifi_lua.lua</span>
</address>
<div class="externErrorHint" style="display:none;">
<span class="caption1"></span>
</div>
<h1 class="collapBarWithDataTrans" id="Guestwifissid">&?GuestWifi_01;</h1>
<input type="hidden" id="DataHasBeenGot" value="0">
<input type="hidden" id="_InstNum" value="0">
<div id="template_WlanGuestwifi" style="display:none;">
<form class="form_content">
<div id="topLine_WlanGuestwifi" class="formTblCtrlBar">
<a id="instName_WlanGuestwifi" class="instName collapsibleInst" hidefocus="true" href="javascript:void(0);"></a>
<span class="instSwitch">
<div id="Enable">
<input type="radio" id="Enable1" name="Enable" value="1"/>
<label for="Enable1">&?public_033;</label>
&nbsp;&nbsp;
<input type="radio" id="Enable0" name="Enable" value="0"/>
<label for="Enable0">&?public_034;</label>
</div>
</span>
</div>
<div id="changeArea_WlanGuestwifi" class="ChangeArea formTblWrap" style="display:none;">
<div class="errorHint" style="display:none;">
<span class="caption1"></span>
</div>
<div class="succHint" style="display:none;">
<span class="caption1">&?public_021;</span>
</div>
<div class="formTbl">
<input type="hidden" id="Alias" value="" class="PostIgnore">
<input type="hidden" id="TitleName" class="PostIgnore" value="">
<input type="hidden" id="WLANViewName" class="PostIgnore" value="">
<input type="hidden" id="_InstID" value="">
<input type="hidden" id="_WEPCONIG" value="N">
<input type="hidden" id="_PSKCONIG" value="N">
<input type="hidden" id="BeaconType" value="">
<input type="hidden" id="WEPAuthMode" value="">
<input type="hidden" id="WPAAuthMode" value="">
<input type="hidden" id="11iAuthMode" value="">
<input type="hidden" id="WPAEncryptType" value="">
<input type="hidden" id="11iEncryptType" value="">
<input type="hidden" id="_InstID_WEP0" value="">
<input type="hidden" id="_InstID_WEP1" value="">
<input type="hidden" id="_InstID_WEP2" value="">
<input type="hidden" id="_InstID_WEP3" value="">
<input type="hidden" id="_InstID_PSK" value="">
<div class="row">
<label for="ESSID" class="left w180">&?WlanBasicAd_011;</label>
<div class="right">
<input type="text" id="ESSID" name="ESSID" class="w280" />
<span style="display:none;">&?public_073;1 ~ 32</span>
</div>
</div>
<div class="row">
<label for="ESSIDHideEnable" class="left w180">&?WlanBasicAd_043;</label>
<div id="ESSIDHideEnable" class="right">
<input type="radio" id="ESSIDHideEnable0" name="ESSIDHideEnable" value="1"/>
<label for="ESSIDHideEnable0">&?public_033;</label>
&nbsp;&nbsp;
<input type="radio" id="ESSIDHideEnable1" name="ESSIDHideEnable" value="0"/>
<label for="ESSIDHideEnable1">&?public_034;</label>
</div>
</div>
<div class="row">
<label for="EncryptionType" class="left w180">&?WlanBasicAd_012;</label>
<div class="right">
<select id="EncryptionType" name="EncryptionType" class="w280">
<option value="No Security" title='&?public_059;'>&?public_059;</option>
<option value="WPA2-PSK-AES" title='&?WlanBasicAd_062;'>&?WlanBasicAd_062;</option>
<option value="WPA/WPA2-PSK-TKIP/AES" title='&?WlanBasicAd_063;'>&?WlanBasicAd_063;</option>
</select>
</div>
</div>
<%
if "1" == env.getenv("Right") then
%>
<div class="row" id="div_KeyPassphrase" style="display:none">
<label for="KeyPassphrase" class="left w180">&?WlanBasicAd_013;</label>
<div class="right">
<input class="inputNorm valid" type="password" id="KeyPassphrase" name="KeyPassphrase" value="" style="width: 280px" />
<input type="text" id="KeyPassphrase" name="KeyPassphrase" class="PostIgnore" style="display:none"/>
<img id="ShowKeyPassphrase" src="../img/sleeping.png" style="width:16px; height:16px;"/>
</div>
</div>
<%
end
%>
<div class="row" id="div_WEPKeyIndex" style="display:none">
<label for="WEPKeyIndex" class="left w180">&?WlanBasicAd_015;</label>
<div class="right">
<select id="WEPKeyIndex" name="WEPKeyIndex" class="w280">
<option value="1" title='1'>1</option>
<option value="2" title='2'>2</option>
<option value="3" title='3'>3</option>
<option value="4" title='4'>4</option>
</select>
</div>
</div>
<div class="row" id="div_ShowWEPKey" style="display:none">
<label for="ShowWEPKey" class="left w180">&?WlanBasic_021;</label>
<div class="right">
<input type="checkbox" value="" id="ShowWEPKey" name="ShowWEPKey"/>
</div>
</div>
<div class="row" id="div_WEPKey00" style="display:none">
<label for="WEPKey00" class="left w180">&?WlanBasicAd_058;</label>
<div class="right">
<input class="inputNorm valid" type="password" id="WEPKey00" name="WEPKey00" value="" style="width: 280px" />
<input type="text" id="WEPKey00" name="WEPKey00" class="PostIgnore" style="display:none"/>
</div>
</div>
<div class="row" id="div_WEPKey01" style="display:none">
<label for="WEPKey01" class="left w180">&?WlanBasicAd_055;</label>
<div class="right">
<input class="inputNorm valid" type="password" id="WEPKey01" name="WEPKey01" value="" style="width: 280px" />
<input type="text" id="WEPKey01" name="WEPKey01" class="PostIgnore" style="display:none"/>
</div>
</div>
<div class="row" id="div_WEPKey02" style="display:none">
<label for="WEPKey02" class="left w180">&?WlanBasicAd_056;</label>
<div class="right">
<input class="inputNorm valid" type="password" id="WEPKey02" name="WEPKey02" value="" style="width: 280px" />
<input type="text" id="WEPKey02" name="WEPKey02" class="PostIgnore" style="display:none"/>
</div>
</div>
<div class="row" id="div_WEPKey03" style="display:none">
<label for="WEPKey03" class="left w180">&?WlanBasicAd_057;</label>
<div class="right">
<input class="inputNorm valid" type="password" id="WEPKey03" name="WEPKey03" value="" style="width: 280px" />
<input type="text" id="WEPKey03" name="WEPKey03" class="PostIgnore" style="display:none"/>
</div>
</div>
<div class="row">
<label for="VapIsolationEnable" class="left w180">&?WlanBasicAd_049;</label>
<div id="VapIsolationEnable" class="right">
<input type="radio" id="VapIsolationEnable1" name="VapIsolationEnable" value="1"/>
<label for="VapIsolationEnable1">&?public_033;</label>
&nbsp;&nbsp;
<input type="radio" id="VapIsolationEnable0" name="VapIsolationEnable" value="0"/>
<label for="VapIsolationEnable0">&?public_034;</label>
</div>
</div>
<div class="row">
<label for="MaxUserNum" class="left w180">&?WlanBasicAd_050;</label>
<div class="right">
<input type="text" id="MaxUserNum" name="MaxUserNum" class="w280"/>
<span style="display:none;">&?public_072;1 ~ 32</span>
</div>
</div>
<div class="row">
<label for="GuestSsidEnableTime" class="left w180">&?GuestWifi_02;</label>
<div class="right">
<select id="GuestSsidEnableTime" name="GuestSsidEnableTime" class="w280">
<option value="0" title='&?GuestWifi_03;'>&?GuestWifi_03;</option>
<option value="1" title='1'>1</option>
<option value="2" title='2'>2</option>
<option value="3" title='3'>3</option>
<option value="4" title='4'>4</option>
<option value="5" title='5'>5</option>
<option value="6" title='6'>6</option>
<option value="7" title='7'>7</option>
<option value="8" title='8'>8</option>
<option value="9" title='9'>9</option>
<option value="10" title='10'>10</option>
<option value="11" title='11'>11</option>
<option value="12" title='12'>12</option>
</select>
</div>
</div>
<div class="buttongroup">
<input type="button" class="Button Btn_cancel" id="Btn_cancel_WlanGuestwifi" name="Btn_cancel_WlanGuestwifi" value="&?public_019;" />
<input type="button" class="Button Btn_apply" id="Btn_apply_WlanGuestwifi" name="Btn_apply_WlanGuestwifi" value="&?public_018;" />
</div>
</div>
</div>
</form>
</div>
</div>
