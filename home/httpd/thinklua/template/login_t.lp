<%
%>
<script type="text/javascript">
<%
cgilua_lp.include("../template/login_js.lp", getfenv(1))
cgilua_lp.include("../template/commpage_status_comm.lp", getfenv(1))
%>
</script>
<%
cgilua_lp.include("../template/common_eventtriggering.lp", _G.getfenv(1))
local usermgrLogicImpl = require("user_mgr.usermgr_logic_impl")
local username, disabled = usermgrLogicImpl:getAutofillUsername()
local password, disabled = usermgrLogicImpl:getAutofillPassword()
%>
<link rel="stylesheet" type="text/css" href="css/login.css" />
<style>
<%
if require"common_lib.file_utils".isFileExist("../../public/css/pro_style.css") then
cgilua_lp.include("../../public/css/pro_style.css")
end
%>
</style>
<%
local GponSN = ""
local tGponSNData = cmapi.getinst("OBJ_SN_INFO_ID","IGD")
if tGponSNData.IF_ERRORID == 0 then
GponSN = tGponSNData.Sn
end
%>
<% if env.getenv("IsFirstLogin") == "0" and env.getenv("CountryCode") == "124" then %>
<div id="FirstLoginDiv" style="padding: 1.5cm">
<div id="PonSn" class="HeadDIV">
<div class="externErrorHint" style="display:none;">
<span class="caption1"></span>
</div>
<h1 id="PonSnBar">&?SN_Orang_001;<%=_G.encodeHTML(env.getenv("WEBTitle"))%></h1>
<div id="template_PonSn">
<div id="PonSn_container">
<input type="hidden" id="DataHasBeenGot" value="0">
<div class="formTblWrap">
<div class="errorHint" style="display:none;">
<span class="caption1"></span>
</div>
<div class="succHint" style="display:none;">
<span class="caption1">&?public_021;</span>
</div>
<div class="formTbl">
<form class="form_content">
<div class="staticInfoHint">
<p>&?SN_Orang_002;</p>
</div>
<input type="hidden" id="_InstID" value="IGD">
<div class="row">
<label for="Sn" class="cfgLabel w150">&?PON_005;</label>
<div class="right">
<input class="inputNorm" type="text" id="Sn" name="Sn" value="<%=GponSN%>" disabled/>
</div>
</div>
<div class="row">
<label for="Pwd" class="cfgLabel w150">&?SN_Orang_004;</label>
<div class="right">
<input class="inputNorm" type="text" id="Pwd" name="Pwd" value="" autocomplete="new-password"/>
<span class="dTip" style="display: none;">&?public_073;1 ~ 10</span>
</div>
</div>
</form>
<div class="buttongroup">
<input type="button" class="Button" id="Btn_cancel" name="Btn_cancel" value="&?SN_Orang_005;"/>
<input type="button" class="Button" id="Btn_apply" name="Btn_apply" value="&?SN_Orang_003;" />
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<%end%>
<div id="loginWrapper">
<div class="emFont loginTitle">&?login_001;<%=_G.encodeHTML(env.getenv("WEBTitle"))%>&?login_019;</div>
<div id="loginContainer" class="loginContainer">
<input type="hidden" name="_sessionTOKEN" id="_sessionTOKEN" value="<%=token%>"/>
<div class="loginInstCfgArea">
<div class="row">
<label for="Frm_Username" class="left w120">&?public_026;</label>
<div class="right">
<input type="text" name="Frm_Username" id="Frm_Username" autocomplete="new-password" class="w180" value="<% =_G.encodeHTML(username) %>" <%if disabled then cgilua.put("disabled") end%>/>
</div>
</div>
<div class="row">
<label for="Frm_Password" class="left w120">&?public_027;</label>
<div class="right">
<input type="password" name="Frm_Password" id="Frm_Password" autocomplete="new-password" class="w180 passInvisible" value="<% =_G.encodeHTML(password) %>"/>
</div>
</div>
<div id="login_error" class="errorHint" style="display:none;">
<span id="login_error_span"></span>
<span id="login_error_waittime" value="0"></span>
</div>
</div>
</div>
<div id="loginBtn" class="">
<input type="submit" id="LoginId" class="button login" value="&?login_004;"/>
</div>
</div>
