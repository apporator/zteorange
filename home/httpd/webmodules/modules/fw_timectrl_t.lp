<%
cgilua_lp.include("../../webmodules/modules/fw_timectrl_js.lp", getfenv(1))
%>
<div id="FwTimeCtrlConf" class="HeadDIV">
<address style="display:none">
<span class="form-action">/?_type=menuData&_tag=fw_timectrl_lua.lua</span>
</address>
<div class="externErrorHint" style="display:none;">
<span class="caption1"></span>
</div>
<h1 class="collapBarWithDataTrans" id="FwTimeCtrlConfBar">&?fwtimectrl_001;</h1>
<div id="FwTimeCtrlConf_container">
<input type="hidden" id="DataHasBeenGot" value="0">
<div id="template_FwTimeCtrlConf">
<form class="form_content">
<div id="changeArea_LocalBPDU" class="ChangeArea formTblWrap">
<div class="errorHint" style="display:none;">
<span class="caption1"></span>
</div>
<div class="succHint" style="display:none;">
<span class="caption1">&?public_021;</span>
</div>
<div class="formTbl">
<input type="hidden" id="_InstID" value="">
<input type="hidden" id="Time" value="">
<div class="row" id="div_Enable">
<label class="cfgLabel w130">&?fwtimectrl_003;</label>
<div class="right" id="Enable">
<input type="radio" id="Enable1" name="Enable" value="1"/><label for="Enable1">&?public_033;</label>&nbsp;&nbsp;
<input type="radio" id="Enable0" name="Enable" value="0"/><label for="Enable0" >&?public_034;</label>
</div>
</div>
<div class="row">
<label class="cfgLabel w130">&?fwtimectrl_004;</label>
</div>
<%
for i=0, 5 do
for j=i*4, (i+1)*4-1 do
%>
<div class="rowWithoutClear left w120" >
<input type="checkbox" name="TimeCfg<%=j+1%>" id="TimeCfg<%=j+1%>">
<label for="time" id="timeinfo"><%=j%>-<%=j+1%></label>
</div>
<%
end
end
%>
<div class="row"></div>
<div class="buttongroup">
<input type="button" class="Button Btn_cancel" id="Btn_cancel_FwTimeCtrlConf" name="Btn_cancel_FwTimeCtrlConf" value="&?public_019;" />
<input type="button" class="Button Btn_apply" id="Btn_apply_FwTimeCtrlConf" name="Btn_apply_FwTimeCtrlConf" value="&?public_018;" />
<span class="AllOn emColor ctrlFont" id="allOn_FwTimeCtrlConf" name="allOn_FwTimeCtrlConf">&?public_042;</span>
&nbsp;&nbsp;|&nbsp;&nbsp;
<span class="AllOff emColor ctrlFont" id="allOff_FwTimeCtrlConf" name="allOn_FwTimeCtrlConf">&?public_043;</span>
</div>
</div>
</div>
</form>
</div>
</div>
</div>
