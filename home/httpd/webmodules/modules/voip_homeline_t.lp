<% cgilua_lp.include("../../webmodules/modules/voip_homeline_js.lp", getfenv(1)) %>
<div id="VoipHomeLine" class="HeadDIV">
<address style="display:none">
<span class="form-action">/?_type=menuData&_tag=voip_homeline_lua.lua</span>
</address>
<div class="externErrorHint" style="display:none;">
<span class="caption1"></span>
</div>
<h1 class="collapBarWithDataTrans" id="VoipHomeLineBar">&?homeline_004;</h1>
<div id="VoipHomeLine_container">
<input type="hidden" id="DataHasBeenGot" value="0">
<div id="template_VoipHomeLine">
<form class="form_content">
<div id="changeArea_VoipHomeLine" class="ChangeArea formTblWrap">
<div class="errorHint" style="display:none;">
<span class="caption1"></span>
</div>
<div class="succHint" style="display:none;">
<span class="caption1">&?public_021;</span>
</div>
<div class="formTbl">
<input type="hidden" id="_InstID" value="">
<div class="row">
<label for="PhyNumber" class="cfgLabel w150" id="Lable_PhyNumber">&?homeline_005;</label>
<div class="right">
<input type="text" id="PhyNumber" name="PhyNumber" value="" class="inputNorm" />
<span style="display: none;">&?public_073;0 ~ 31</span>
</div>
</div>
<div class="row">
<label for="Password" class="cfgLabel w150">&?public_027;</label>
<div class="right">
<input class="SpecialPassword inputNorm" type="password" id="Password" name="Password" value="						" autocomplete="new-password"/>
<span style="display: none;">&?public_073;0 ~ 15</span>
</div>
</div>
<div class="row">
<label for="Enable" class="cfgLabel w150">&?Pinpublic_013;</label>
<div class="right">
<input type="checkbox" id="Enable" name="Enable" value="" checked="checked"/>
</div>
</div>
<div class="buttongroup">
<input type="button" class="Button Btn_apply" id="Btn_apply" name="Btn_apply" value="&?homeline_007;" />
</div>
</div>
</div>
</form>
</div>
<div id="homeline_devlist" class="colorTbl form_content" style="overflow-y:auto;height:250px;white-space: nowrap;overflow-x:hidden;text-align: center;width:745px;">
<table id="homeline_devlist_table">
<tr class="colorTblRow emFont titleRow">
<td>
<span class="w180" title="&?homeline_005;">&?homeline_005;</span>
</td>
<td>
<span class="w180" title="&?public_027;">&?public_027;</span>
</td>
<td>
<span class="w180" title="&?Pinpublic_013;">&?Pinpublic_013;</span>
</td>
<td>
<span class="w180" title="&?homeline_009;">&?homeline_009;</span>
</td>
</tr>
<tr id="template_homeline_devlist_table" class="colorTblRow" style="display:none;">
<input type="hidden" id="_InstID" value="-1">
<td class="w180" id="PhyNumber" title="" encode="1"></td>
<td class="w180" id="Password" title=""></td>
<td class="w180" id="Enable" title=""></td>
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
