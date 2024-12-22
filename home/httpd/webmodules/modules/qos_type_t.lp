<%
cgilua_lp.include("../../webmodules/modules/qos_type_js.lp", getfenv(1))
local retTab_qp=cmapi.querylist("OBJ_QOSQP_ID","DEV")
local policerQueue = "<option value=''></option>"
local policerQueue_tmp = ""
for i, v in ipairs(retTab_qp) do
local t = cmapi.getinst("OBJ_QOSQP_ID", v)
local alias = t.Alias
policerQueue_tmp = "<option value='" .. v .."' title='" .. _G.encodeHTML(alias) .. "'>" .. _G.encodeHTML(alias) .. "</option>"
policerQueue = policerQueue .. policerQueue_tmp
end
%>
<div id="qosCfgType" class="HeadDIV">
<address style="display:none">
<span class="form-action">/?_type=menuData&_tag=qos_type_lua.lua</span>
</address>
<h1 class="collapBarWithDataTrans" id="qosCfgTypeBar">&?QosType_001;</h1>
<div class="externErrorHint" style="display:none;">
<span class="caption1"></span>
</div>
<div id="qosCfgType_container">
<div class="sceneTip">
<div class="sceneTipLink"><a>&?QosType_028;</a></div>
<div class="sceneTip_container">
<p>&?QosType_029;</p>
<p class="sceneTip_close"><a>&?public_020;</a></p>
</div>
</div>
<input type="hidden" id="_InstNum" value="0">
<input type="hidden" id="DataHasBeenGot" value="0">
<div id="template_qosCfgType" style="display:none;">
<form class="form_content">
<div id="topLine_qosCfgType" class="formTblCtrlBar">
<span id="instName_qosCfgType" class="instName collapsibleInst">&?public_041;</span>
<span class="instSwitch">
<div id="Enable">
<input type="radio" id="Enable1" name="Enable" value="1"/><label for="Enable1">&?public_033;</label>&nbsp;&nbsp;
<input type="radio" id="Enable0" name="Enable" value="0" checked="checked"/><label for="Enable0" >&?public_034;</label>
</div>
</span>
<span id="instDelete_qosCfgType" class="instDelete Btn_delete"><img src="img/del.png" alt="delete"/></span>
</div>
<div id="changeArea_qosCfgType" class="ChangeArea formTblWrap" style="display:none;">
<div class="errorHint" style="display:none;">
<span class="caption1"></span>
</div>
<div class="succHint" style="display:none;">
<span class="caption1">&?public_021;</span>
</div>
<div class="formTbl">
<input type="hidden" id="_InstID" value="-1" />
<input type="hidden" id="IPDestMask" value="" />
<input type="hidden" id="IPSrcMask" value="" />
<input type="hidden" id="MACSrc" value="" />
<input type="hidden" id="MACDest" value="" />
<input type="hidden" id="DscpMark" value="" />
<div class="row">
<label for="Alias" class="left w200">&?public_016;</label>
<div class="right">
<input type="text" class="inputNorm" id="Alias" name="Alias" value=""/>
<span class="utf8Compatible" style="display: none;">&?public_073; 1~64</span>
</div>
</div>
<div class="row">
<label for="Order" class="left w200">&?QosType_012;</label>
<div class="right">
<input type="text" class="inputNorm readonlyInputBg PostIgnore" id="Order" name="Order" value="" disabled="disabled"/>
</div>
</div>
<div class="row"><p><strong>&?QosType_026;</strong></p></div>
<div class="row">
<label class="left w200">&?QosType_008;</label>
<div id="AllInterface" class="right">
<input type="radio" value="1" name="AllInterface" id="AllInterface1"><label for="AllInterface1">&?public_033;</label>&nbsp;&nbsp;
<input type="radio" value="0" name="AllInterface" id="AllInterface0" checked="checked"><label for="AllInterface0" >&?public_034;</label>
</div>
</div>
<div class="row" id="Row_DevIn">
<label class="left w200" for="DevIn">&?QosType_003;</label>
<div class="right">
<select name="DevIn" id="DevIn" class="selectNorm">
<option value="LAN" title='&?public_084;'>&?public_084;</option>
<option value="WAN" title='&?public_128;'>&?public_128;</option>
<%
cgilua.put(_G.CreateIFOpStr("QoSTypeIn"))
%>
</select>
</div>
</div>
<div class="row">
<label class="left w200" for="sub_MACSrc0">&?QosType_005;</label>
<div class="right">
<input class="mac" name="sub_MACSrc0" type="text" maxlength="2" id="sub_MACSrc0" value="00" />:
<input class="mac" name="sub_MACSrc1" type="text" maxlength="2" id="sub_MACSrc1" value="00" />:
<input class="mac" name="sub_MACSrc2" type="text" maxlength="2" id="sub_MACSrc2" value="00" />:
<input class="mac" name="sub_MACSrc3" type="text" maxlength="2" id="sub_MACSrc3" value="00" />:
<input class="mac" name="sub_MACSrc4" type="text" maxlength="2" id="sub_MACSrc4" value="00" />:
<input class="mac" name="sub_MACSrc5" type="text" maxlength="2" id="sub_MACSrc5" value="00" />
<a class="_LuQUID_SelAccessDevice" _LuQUID_Access_Mode="ALL">&?public_143;</a>
</div>
</div>
<div class="row">
<label class="left w200" for="sub_MACDest0">&?QosType_004;</label>
<div class="right">
<input class="mac" name="sub_MACDest0" type="text" maxlength="2" id="sub_MACDest0" value="00" />:
<input class="mac" name="sub_MACDest1" type="text" maxlength="2" id="sub_MACDest1" value="00" />:
<input class="mac" name="sub_MACDest2" type="text" maxlength="2" id="sub_MACDest2" value="00" />:
<input class="mac" name="sub_MACDest3" type="text" maxlength="2" id="sub_MACDest3" value="00" />:
<input class="mac" name="sub_MACDest4" type="text" maxlength="2" id="sub_MACDest4" value="00" />:
<input class="mac" name="sub_MACDest5" type="text" maxlength="2" id="sub_MACDest5" value="00" />
<a class="_LuQUID_SelAccessDevice" _LuQUID_Access_Mode="ALL">&?public_143;</a>
</div>
</div>
<div class="row">
<label class="left w200" for="VlanPrio">&?public_103;</label>
<div class="right">
<select name="VlanPrio" id="VlanPrio" class="selectNorm">
<option value="-1" title='&?QosType_025;' selected="selected">&?QosType_025;</option>
<option value="0" title='0'>0</option>
<option value="1" title='1'>1</option>
<option value="2" title='2'>2</option>
<option value="3" title='3'>3</option>
<option value="4" title='4'>4</option>
<option value="5" title='5'>5</option>
<option value="6" title='6'>6</option>
<option value="7" title='7'>7</option>
</select>
</div>
</div>
<div class="row">
<label class="left w200" for="VlanID">&?public_137;</label>
<div class="right">
<input class="inputNorm" type="text" id="VlanID" name="VlanID" value=""/>
<span style="display:none;">&?public_072;0 ~ 4095</span>
</div>
</div>
<div class="segmentRow"></div>
<div class="row">
<label class="left w200" for="L2Protocol">&?QosType_007;</label>
<div class="right">
<select name="L2Protocol" id="L2Protocol" class="selectNorm">
<option value="" title='&?QosType_025;'>&?QosType_025;</option>
<option value="IP" title='&?public_100;'>&?public_100;</option>
<%
if "0" ~= env.getenv("DevIPv6Effect") then
%>
<option value="IPV6" title='&?public_101;'>&?public_101;</option>
<%
end
%>
<option value="ARP" title='&?public_045;'>&?public_045;</option>
<option value="PPPOE" title='&?public_047;'>&?public_047;</option>
</select>
</div>
</div>
<div id="IPArea">
<div class="row" id="">
<label for="IPSrc" class="left w200">&?QosType_009;</label>
<div class="right">
<input type="text" id="IPSrc" name="IPSrc" value="" class="inputNorm"/>/
<input type="text" id="I_IPSrcMask" name="I_IPSrcMask" value="" class="w37 PostIgnore"/>
</div>
</div>
<div class="row" id="div_IPSrcMin" style="display:none;">
<label for="IPSrcMin" class="left w200 PostIgnore">MIN</label>
<div class="right">
<input type="text" id="IPSrcMin" name="IPSrcMin" value="0.0.0.0" class="inputNorm"/>
</div>
</div>
<div class="row" id="div_IPSrcMax" style="display:none;">
<label for="IPSrcMax" class="left w200 PostIgnore">MAX</label>
<div class="right">
<input type="text" id="IPSrcMax" name="IPSrcMax" value="0.0.0.0" class="inputNorm"/>
</div>
</div>
<div class="row" id="">
<label for="IPDest" class="left w200">&?QosType_010;</label>
<div class="right">
<input type="text" id="IPDest" name="IPDest" value="" class="inputNorm"/>/
<input type="text" id="I_IPDestMask" name="I_IPDestMask" value="" class="w37 PostIgnore"/>
</div>
</div>
<div class="row" id="div_IPDestMin" style="display:none;">
<label for="IPDestMin" class="left w200 PostIgnore">MIN</label>
<div class="right">
<input type="text" id="IPDestMin" name="IPDestMin" value="0.0.0.0" class="inputNorm"/>
</div>
</div>
<div class="row" id="div_IPDestMax" style="display:none;">
<label for="IPDestMax" class="left w200 PostIgnore">MAX</label>
<div class="right">
<input type="text" id="IPDestMax" name="IPDestMax" value="0.0.0.0" class="inputNorm"/>
</div>
</div>
<div class="row">
<label class="left w200" for="DSCPCheck">&?QosType_019;</label>
<div class="right">
<input class="inputNorm" type="text" id="DSCPCheck" name="DSCPCheck" value=""/>
<span style="display:none;">&?public_072;0 ~ 63</span>
</div>
</div>
</div>
<div class="segmentRow"></div>
<div id="L3ProtocolArea">
<div class="row">
<label class="left w200" for="L3ProtocolList">&?QosType_017;</label>
<div class="right">
<select name="L3ProtocolList" id="L3ProtocolList" class="selectNorm">
<option value="" title='&?QosType_025;'>&?QosType_025;</option>
<option value="TCP" title='&?public_036;'>&?public_036;</option>
<option value="UDP" title='&?public_037;'>&?public_037;</option>
<option value="ICMP" title='&?public_038;'>&?public_038;</option>
</select>
</div>
</div>
<div class="row" style="display:none;">
<label class="left w200" for="SrcPort">&?QosType_013;</label>
<div class="right">
<input class="port" type="text" id="SrcPort" name="SrcPort" value=""/>
<span style="display:none;">&?public_072;0 ~ 65535</span>
~
<input class="port" type="text" id="SrcPortMax" name="SrcPortMax" value=""/>
<span style="display:none;">&?public_072;0 ~ 65535</span>
</div>
</div>
<div class="row" style="display:none;">
<label class="left w200" for="DestPort">&?QosType_018;</label>
<div class="right">
<input class="port" type="text" id="DestPort" name="DestPort" value=""/>
<span style="display:none;">&?public_072;0 ~ 65535</span>
~
<input class="port" type="text" id="DestPortMax" name="DestPortMax" value=""/>
<span style="display:none;">&?public_072;0 ~ 65535</span>
</div>
</div>
<div class="row" id="Row_TcpAck" style="display:none;">
<label class="left w200">&?QosType_011;</label>
<div id="TcpAck" class="right">
<input type="radio" value="1" name="TcpAck" id="TcpAck1"><label for="TcpAck1">&?public_033;</label>&nbsp;&nbsp;
<input type="radio" value="0" name="TcpAck" id="TcpAck0" checked="checked"><label for="TcpAck0" >&?public_034;</label>
</div>
</div>
</div>
<div class="segmentRow"></div>
<div class="row"><p><strong>&?QosType_027;</strong></p></div>
<div class="row">
<label class="left w200" for="VlanPrioMark">&?QosType_020;</label>
<div class="right">
<select name="VlanPrioMark" id="VlanPrioMark" class="selectNorm">
<option value="-1" title='&?QosBasic_008;' selected="selected">&?QosBasic_008;</option>
<option value="0" title='&?QosBasic_010;'>&?QosBasic_032;</option>
<option value="1" title='1'>1</option>
<option value="2" title='2'>2</option>
<option value="3" title='3'>3</option>
<option value="4" title='4'>4</option>
<option value="5" title='5'>5</option>
<option value="6" title='6'>6</option>
<option value="7" title='7'>7</option>
</select>
</div>
</div>
<div id="DscpMarkArea">
<div class="row">
<label for="S_DscpMark" class="left w200">&?QosType_021;</label>
<div class="right">
<select class="selectNorm PostIgnore" id="S_DscpMark" name="S_DscpMark">
<option value="-1" title='&?QosBasic_008;' selected="selected">&?QosBasic_008;</option>
<option value="-2" title='&?QosBasic_009;'>&?QosBasic_009;</option>
<option value="0" title='&?QosBasic_010;'>&?QosBasic_010;</option>
<option value="14" title='&?QosBasic_011;'>&?QosBasic_011;</option>
<option value="12" title='&?QosBasic_012;'>&?QosBasic_012;</option>
<option value="10" title='&?QosBasic_013;'>&?QosBasic_013;</option>
<option value="8" title='&?QosBasic_014;'>&?QosBasic_014;</option>
<option value="22" title='&?QosBasic_015;'>&?QosBasic_015;</option>
<option value="20" title='&?QosBasic_016;'>&?QosBasic_016;</option>
<option value="18" title='&?QosBasic_017;'>&?QosBasic_017;</option>
<option value="16" title='&?QosBasic_018;'>&?QosBasic_018;</option>
<option value="30" title='&?QosBasic_019;'>&?QosBasic_019;</option>
<option value="28" title='&?QosBasic_020;'>&?QosBasic_020;</option>
<option value="26" title='&?QosBasic_021;'>&?QosBasic_021;</option>
<option value="24" title='&?QosBasic_022;'>&?QosBasic_022;</option>
<option value="38" title='&?QosBasic_023;'>&?QosBasic_023;</option>
<option value="36" title='&?QosBasic_024;'>&?QosBasic_024;</option>
<option value="34" title='&?QosBasic_025;'>&?QosBasic_025;</option>
<option value="32" title='&?QosBasic_026;'>&?QosBasic_026;</option>
<option value="46" title='&?QosBasic_027;'>&?QosBasic_027;</option>
<option value="40" title='&?QosBasic_028;'>&?QosBasic_028;</option>
<option value="48" title='&?QosBasic_029;'>&?QosBasic_029;</option>
<option value="56" title='&?QosBasic_030;'>&?QosBasic_030;</option>
<option value="other" title='&?QosBasic_031;'>&?QosBasic_031;</option>
</select>
</div>
</div>
<div class="row" style="display:none;">
<label for="other_DscpMark" class="left w200">&nbsp;</label>
<div class="right">
<input type="text" id="other_DscpMark" name="other_DscpMark" value="" class="inputNorm PostIgnore"/>
<span style="display:none;">&?public_072;-2 ~ 63</span>
</div>
</div>
</div>
<div class="row">
<label class="left w200" for="PolicerQueue">&?QosType_022;</label>
<div class="right">
<select name="PolicerQueue" id="PolicerQueue" class="selectNorm">
<%
cgilua.put(policerQueue)
%>
</select>
</div>
</div>
<div class="row">
<label class="left w200" for="TrafficClass">&?QosType_023;</label>
<div class="right">
<input class="w150" type="text" id="TrafficClass" name="TrafficClass" value=""/>
<span style="display:none;">&?public_072;1 ~ 1024</span>
</div>
</div>
<div class="buttongroup">
<input type="button" class="Button Btn_cancel PostIgnore" id="Btn_cancel_qosCfgType" name="Btn_cancel_qosCfgType" value="&?public_019;" />
<input type="button" class="Button Btn_apply PostIgnore" id="Btn_apply_qosCfgType" name="Btn_apply_qosCfgType" value="&?public_018;" />
</div>
</div>
</div>
</form>
</div>
<div class="addInstBar AddContentContainer">
<span id="addInstBar_qosCfgType" class="instNew addInst">&?public_098;</span>
</div>
</div>
</div>
