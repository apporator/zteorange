<%
local FirstLogin = env.getenv("IsFirstLogin")
%>
var loginLockInterval = null;
var editableInputs;
var dftFcsTaget;
var IsAllowedSubmit = true;
function createTimeCountDownMessage(lockingTime, promptMsg)
{
if((promptMsg != null && promptMsg.length > 0) || lockingTime > 0 )
{
<%
local usermgrLogicImpl = require("user_mgr.usermgr_logic_impl")
local lockMaxTime = usermgrLogicImpl:getUserMgrAttrValue("lockMaxTime") or 3
%>
var timeOutHint = promptMsg.concat("&?login_011;");
$("#login_error_waittime").text(timeOutHint.format(<% =lockMaxTime %>,lockingTime)).show();
}
else
{
$("#login_error_waittime").hide();
}
}
function timer(seconds, promptMsg) {
window.setTimeout(function() {
editableInputs.removeAttr("disabled");
if(dftFcsTaget){
dftFcsTaget.focus();
}
$("#LoginId").removeAttr("disabled").removeClass("disableBtn");
$("#login_error").hide();
$("#login_error_waittime").hide().text("");
if (loginLockInterval) {
window.clearInterval(loginLockInterval);
consoleLog("timeout to clearInterval!!!");
}
}, seconds * 1000);
loginLockInterval = window.setInterval((function(sec, msg){
return function () {
if (sec > 0){
sec--;
}
createTimeCountDownMessage(sec, msg);
}
})(seconds, promptMsg), 1000);
}
function SetPasswordValue(obj)
{
var template = $("#loginWrapper");
var objJQ = $(obj);
var passInvisibleOBJ = $("[id^='Frm_Password'][class*='passInvisible']", template);
var pwvalue = objJQ.val();
passInvisibleOBJ.val(pwvalue);
}
function ShowLoginPonSN()
{
<% if env.getenv("CountryCode") == "124" then %>
var FirstLogin = "<%=FirstLogin%>";
if (FirstLogin=="1")
{
$("#FirstLoginDiv").hide();
$("#loginWrapper").show();
}
else
{
$("#FirstLoginDiv").show();
$("#loginWrapper").hide();
}
var tempconfig = $("#template_PonSn");
tempconfig.bind("fillDataByApplyResult", function(event,xml, tempconfig)
{
ActionByApplyResult(xml, tempconfig);
if (tempconfig.hasError(xml)==0)
{
setTimeout(function(){$("#FirstLoginDiv").hide();$("#loginWrapper").show();},1000);
}
else
{
}
});
var ServerAddr="/?_type=hiddenData&_tag=poninfo_sn";
$("#Btn_apply").bind("click",function()
{
if($("#Pwd",tempconfig).val()!="")
{
dataPost("Apply", "fillDataByApplyResult", ServerAddr, $("#template_PonSn"), undefined, false);
}
else
{
$("#FirstLoginDiv").hide();
$("#loginWrapper").show();
}
});
$("#Btn_cancel").bind("click",function(){
$("#FirstLoginDiv").hide();
$("#loginWrapper").show();
});
<% end %>
}
function PasswordChange(template)
{
var typeOBJ = $("[id^='Switch_Password']", template);
var passVisibleOBJ = $("[id^='Frm_Password'][class*='passVisible']", template);
var passVisibleVal = passVisibleOBJ.val();
var passInvisibleOBJ = $("[id^='Frm_Password'][class*='passInvisible']", template);
var passInvisibleVal = passInvisibleOBJ.val();
passInvisibleOBJ.addClass("valid");
if( typeOBJ.is(':checked'))
{
passInvisibleOBJ.hide();
passVisibleOBJ.show();
passVisibleOBJ.val(passInvisibleVal);
}
else
{
passVisibleOBJ.hide();
passInvisibleOBJ.show();
passInvisibleOBJ.val(passVisibleVal);
}
}
function showTimeCountDown(lockingTime, promptMsg)
{
if(lockingTime > 0)
{
createTimeCountDownMessage(lockingTime, promptMsg);
$("#LoginId").attr("disabled","true").addClass("disableBtn");
editableInputs.attr("disabled","true");
timer(lockingTime, promptMsg);
}
}
function DisplayLoginErrorTip(loginData)
{
var loginErrMsg = loginData.loginErrMsg;
var lockingTime = loginData.lockingTime;
var promptMsg = loginData.promptMsg;
lockingTime = parseInt(lockingTime);
if ( IsBrowserSupportCookie() == false )
{
$("#login_error").show();
$("#login_error_span").text("&?login_024;");
}
else if(loginErrMsg.length > 0 || promptMsg.length > 0)
{
$("#login_error").show();
if(loginErrMsg.length > 0)
{
$("#login_error_span").text(loginErrMsg).show();
}
else
{
$("#login_error_span").hide();
}
if (lockingTime > 0 || promptMsg.length > 0)
{
showTimeCountDown(lockingTime, promptMsg);
}
}
else
{
$("#login_error").hide();
}
}
function g_loginToken(xml)
{
var xmlObj = $(xml).text();
var Password =$("#Frm_Password").val();
var SHA256Password =sha256(Password+xmlObj);
var postData = {};
postData["action"] = "login";
postData["Password"] = SHA256Password;
postData["Username"] = $("#Frm_Username").val();
postData["_sessionTOKEN"] = $("#_sessionTOKEN").val();
Password = undefined;
SHA256Password = undefined;
$.post( "/?_type=loginData&_tag=login_entry", postData, undefined, "json" )
.done(function( data ) {
$("#_sessionTOKEN").val(data.sess_token);
if ( data.login_need_refresh )
{
top.location.href = top.location.href;
}
else
{
DisplayLoginErrorTip(data);
}
});
postData = undefined;
}
function CanTextAndPasswordSwitch_InputType()
{
var pass = document.createElement('input');
pass.type = 'text';
pass.style.display = "none";
document.body.appendChild(pass);
var retVal = true;
try
{
pass.type = 'password';
if ( "password" == pass.type )
{
pass.type = 'text';
if ( "text" == pass.type )
{
retVal = true;
}
else
{
retVal = false;
}
}
else
{
retVal = false;
}
}
catch(e)
{
retVal = false;
}
document.body.removeChild(pass);
return retVal;
}
var throttle = function (fn, delay, atleast) {
var timer = null, previous = null;
return function () {
var context = this, args = arguments, now = +new Date();
if (!previous) {previous = now;}
if (now - previous > atleast) {
fn.apply(context, args);
previous = now;
} else {
clearTimeout(timer);
timer = setTimeout(function() {
fn.apply(context, args);
}, delay);
}
}
};
$(document).ready(function(){
ShowLoginPonSN();
var loginForm = $(".loginInstCfgArea");
editableInputs = $("input",loginForm).not(":disabled").not("[readonly=readonly]");
$.getJSON("/?_type=loginData&_tag=login_entry")
.done(function( json ) {
$("#_sessionTOKEN").val(json.sess_token);
DisplayLoginErrorTip(json);
})
.fail(function( jqxhr, textStatus, error ) {
var err = textStatus + ", " + error;
consoleLog( "Request Failed: " + err );
});
editableInputs.each(function(){
if ($(this).val() == "") {
$(this).focus();
dftFcsTaget = $(this);
return false;
}
});
$("#LoginId").bind("click", throttle(function(){
if ( true == IsAllowedSubmit )
{
var loadAllowAddr = "/?_type=loginData&_tag=login_token";
$(this).dataTransfer(loadAllowAddr, "GET", g_loginToken, undefined, false);
}
}, 300, 300));
showWaitTip(false);
editableInputs.keydown(function(event){
if(event.keyCode==13){
event.preventDefault();
event.stopPropagation();
$("#LoginId").click();
}
});
});
