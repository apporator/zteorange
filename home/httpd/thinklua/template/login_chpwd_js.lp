$(document).ready(function(){
var cver = "<% =env.getenv("CountryCode")%>";
$("#login_warn_span").text("&?mali_login_error001;");
jQuery.validator.setDefaults({
errorPlacement: function (error, element) {
var tipHTML = "<div class=\"errorLabelWraperBottom\"></div>";
var tipObj = $(tipHTML);
error.appendTo(tipObj);
var rowObj = element.closest(".row");
if ( rowObj.length == 0 )
{
consoleLog("element id=["+element.attr("id")+"] is not in row div.");
return ;
}
var rowWidth = rowObj.width();
var usedWidth = 0;
var rightObj = undefined;
rowObj.children().each(function(){
if (!($(this).hasClass("_LuQUID_AccessDeviceList")||
$(this).hasClass("clear"))){
usedWidth += $(this).outerWidth(true);
}
if ($(this).hasClass("right")){
rightObj = $(this);
}
});
var errWidth = rowWidth - usedWidth;
var widthtmp = errWidth-5-23-10;
if (rightObj != undefined)
{
tipObj.insertAfter(rightObj);
}
else
{
tipObj.appendTo(rowObj);
}
}
});
jQuery.extend(jQuery.validator.messages, {
required: "&?mali_login_error004;",
equalTo: "&?mali_login_error003;"
});
jQuery.validator.addMethod(
"ChkPass",
function(val, element, relVal)
{
var PwdTypeNum = 0;
if( (/[0-9]+/).test(val) )
PwdTypeNum++;
if( (/[a-z]+/).test(val) )
PwdTypeNum++;
if( (/[A-Z]+/).test(val) )
PwdTypeNum++;
if( (/[!"#$%&'()*+,-./:;<=>?@\[\\\]^_`{|}~]+/).test(val) )
PwdTypeNum++;
if(PwdTypeNum<3)
return false;
if (val.length < 8)
{
return false;
}
return true;
},
$.validator.format("&?mali_login_error002;")
);
$("#fLogin").validate({
rules: {
"Password" : {
"required":true,
"ChkPass": true,
"ASCII": true
},
"NewPassword": {
"required":true,
"ASCII": true,
"equalTo": "#Password"
}
}
});
var dispErr = function(data){
$("#login_error_span").text(data.loginErrMsg);
$("#login_error").show();
};
$("#Password").val("").focus();
function doChgpwd(){
$.post( "/?_type=loginData&_tag=login_changepwd", $("#fLogin").serialize(), undefined, "json" )
.done(function( data ) {
if ( data.login_need_refresh )
{
top.location.href = top.location.href;
}
else
{
dispErr(data);
}
});
}
$("#Btn_apply").bind("click", function(){
if ( true == $("#fLogin").validate().form() )
{
$("#action").val("changepwd");
doChgpwd();
}
});
$("#Btn_cancel").bind("click", function(){
$("#action").val("changepwd_cancel");
doChgpwd();
});
showWaitTip(false);
});
