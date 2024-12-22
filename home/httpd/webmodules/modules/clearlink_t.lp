<%
cgilua_lp.include("../../webmodules/modules/clearlink_js.lp", getfenv(1))
%>
<div id="ClearLink" class="HeadDIV">
<address style="display:none">
<span class="form-action">/?_type=menuData&_tag=clearlink_lua.lua</span>
</address>
<div class="externErrorHint" style="display:none;">
<span class="caption1"></span>
</div>
<h1 class="collapBarWithDataTrans" id="ClearLinkBar">&?ClearLink_001;</h1>
<div id="ClearLink_container">
<input id="DataHasBeenGot" type="hidden" value="0">
<div id="template_ClearLink" style="display:none;">
<div id="changeArea_ClearLink" class="ChangeArea formTblWrap">
<div class="errorHint" style="display:none;">
<span class="caption1"></span>
</div>
<div class="succHint" style="display:none;">
<span class="caption1">&?public_021;</span>
</div>
<div class="formTbl">
<form class="form_content">
<input type="hidden" id="_InstID" value="">
<div class="row">
<label for="PPPEnable" class="left w150">&?ClearLink_004;</label>
<div id="PPPEnable" class="right">
<input type="radio" id="PPPEnable1" name="PPPEnable" value="1"/>
<label for="PPPEnable1">&?public_033;</label>
&nbsp;&nbsp;
<input type="radio" id="PPPEnable0" name="PPPEnable" value="0"/>
<label for="PPPEnable0">&?public_034;</label>
</div>
</div>
</form>
<div class="buttongroup">
<input type="button" class="Button Btn_cancel PostIgnore" id="Btn_cancel_ClearLink" name="Btn_cancel_ClearLink" value="&?public_019;" />
<input type="button" class="Button Btn_apply PostIgnore" id="Btn_apply_ClearLink" name="Btn_apply_ClearLink" value="&?public_018;" />
</div>
</div>
</div>
</div>
</div>
</div>
