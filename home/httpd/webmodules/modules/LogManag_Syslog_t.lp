<%
cgilua.lp.include("../../webmodules/modules/LogManag_Syslog_js.lp", getfenv(1))
%>
<div id="SysLogManagerConf" class="HeadDIV">
<address style="display:none">
<span class="form-action">/?_type=menuData&_tag=LogManag_Syslog_lua.lua</span>
</address>
<div class="externErrorHint" style="display:none;">
<span class="caption1"></span>
</div>
<h1 class="collapBarWithDataTrans" id="SysLogManagerConfBar">&?LogManag_003;</h1>
<div id="SysLogManagerConf_container">
<input id="DataHasBeenGot" type="hidden" value="0">
<div id="template_SysLogManagerConf" class="formTblWrap">
<div id="errorHint" class="errorHint" style="display:none;">
<span class="caption1"></span>
</div>
<div class="succHint" style="display:none;">
<span class="caption1">&?public_021;</span>
</div>
<form class="form_content formTbl">
<div class="row">
<label class="cfgLabel w130" for="SysLogEnable">&?MgcpBasic_015;</label>
<div class="right" id="SysLogEnable">
<input type="radio" value="1" name="SysLogEnable" id="SYSLogEnable1"><label for="SYSLogEnable1">&?public_033;</label>&nbsp;&nbsp;
<input type="radio" value="0" name="SysLogEnable" id="SYSLogEnable0"><label for="SYSLogEnable0">&?public_034;</label>
</div>
</div>
<div class="row" id="div_SysLogTarget" style="">
<label class="cfgLabel w130" for="SysLogTarget">&?Security_031;</label>
<div class="right">
<select name="SysLogTarget" id="SysLogTarget" class="selectNorm">
<option value="0" title='&?LanDevDHCPSourceIpv4_004;'>&?LanDevDHCPSourceIpv4_004;</option>
<option value="1" title='&?pro_LogManag_002;'>&?pro_LogManag_002;</option>
</select>
</div>
</div>
<div class="row" id="div_SysLogTimeout" style="">
<label class="cfgLabel w130" for="SysLogTimeout">&?LoginTimeout_002;</label>
<div class="right">
<input class="inputNorm" name="SysLogTimeout" type="text" id="SysLogTimeout" value=""/>
</div>
</div>
<div class="row" id="div_SysLogServer" style="">
<label class="cfgLabel w130" for="SysLogServer">&?FTP_003;</label>
<div class="right">
<input class="inputNorm" name="SysLogServer" type="text" id="SysLogServer" value=""/>
<span class="dTip" style="display: none;">Length: 1 ~ 256</span>
</div>
</div>
<div class="row" id="div_SysLogPort" style="">
<label class="cfgLabel w130" for="SysLogPort">&?public_135;</label>
<div class="right">
<input class="inputNorm" name="SysLogPort" type="text" id="SysLogPort" value=""/>
<span class="dTip" style="display: none;">Range: 1 ~ 65535</span>
</div>
</div>
<div class="row" id="div_SysLogLevel" style="">
<label class="cfgLabel w130" for="SysLogLevel">&?pro_LogManag_003;</label>
<div class="right">
<select name="SysLogLevel" id="SysLogLevel" class="selectNorm">
<option value="0" title='&?LogManag_011;'>&?LogManag_011;</option>
<option value="1" title='&?LogManag_012;'>&?LogManag_012;</option>
<option value="2" title='&?LogManag_013;'>&?LogManag_013;</option>
<option value="3" title='&?LogManag_014;'>&?LogManag_014;</option>
<option value="4" title='&?LogManag_015;'>&?LogManag_015;</option>
<option value="5" title='&?LogManag_016;'>&?LogManag_016;</option>
<option value="6" title='&?LogManag_017;'>&?LogManag_017;</option>
<option value="7" title='&?LogManag_018;'>&?LogManag_018;</option>
</select>
</div>
</div>
<div class="buttongroup">
<input type="button" class="Button Btn_cancel" id="Btn_cancel_SysLogManagerConf" name="Btn_cancel_SysLogManagerConf" value="&?public_019;" />
<input type="button" class="Button Btn_apply" id="Btn_apply_SysLogManagerConf" name="Btn_apply_SysLogManagerConf" value="&?public_018;" />
</div>
</form>
</div>
</div>
</div>
