local url2type = require("router.urlpath_2type_map")
url2type:addModifier(function ()
if env.getenv("CountryCode") == "125" then
local upgradeFunc = function ()
local loginStatus = require("user_mgr.usermgr_logic_impl"):getLoginStatus()
if "loginAlready" == loginStatus then
return "hiddenView", "fastway.ghtml"
else
return "loginView", nil
end
end
url2type:addItem({urlPath="fastway.ghtml",routerType=upgradeFunc})
end
end)
local url2type = require("router.urlpath_2type_map")
url2type:addModifier(function ()
if env.getenv("CountryCode") == "98" then
local upgradeFunc = function ()
local loginStatus = require("user_mgr.usermgr_logic_impl"):getLoginStatus()
if "loginAlready" == loginStatus then
return "hiddenView", "hathway_upgrade.ghtml"
else
return "loginView", nil
end
end
url2type:addItem({urlPath="hathway_upgrade.ghtml",routerType=upgradeFunc})
end
end)
local url2type = require("router.urlpath_2type_map")
url2type:addModifier(function ()
if env.getenv("CountryCode") == "156" then
local rcmFunc = function ()
local accessPort = cgilua.servervariable("SERVER_PORT")
if accessPort==265 or accessPort==266 or accessPort==300 then
return "hiddenView", "autoconfig/command.cgi"
else
return "hiddenView", "template/NotFoundPage.html"
end
end
url2type:addItem({urlPath="autoconfig/command.cgi",routerType=rcmFunc})
local sysFunc = function ()
local accessPort = cgilua.servervariable("SERVER_PORT")
if accessPort==265 or accessPort==266 or accessPort==300 then
return "hiddenView", "information/getinfo.cgi/sys_info"
else
return "hiddenView", "template/NotFoundPage.html"
end
end
url2type:addItem({urlPath="information/getinfo.cgi/sys_info",routerType=sysFunc})
local syslogFunc = function ()
local accessPort = cgilua.servervariable("SERVER_PORT")
if accessPort==265 or accessPort==266 or accessPort==300 then
return "hiddenView", "information/getinfo.cgi/sys_loginfo"
else
return "hiddenView", "template/NotFoundPage.html"
end
end
url2type:addItem({urlPath="information/getinfo.cgi/sys_loginfo",routerType=syslogFunc})
local wifiFunc = function ()
local accessPort = cgilua.servervariable("SERVER_PORT")
if accessPort==265 or accessPort==266 or accessPort==300 then
return "hiddenView", "information/getinfo.cgi/wifi_info"
else
return "hiddenView", "template/NotFoundPage.html"
end
end
url2type:addItem({urlPath="information/getinfo.cgi/wifi_info",routerType=wifiFunc})
local debugFunc = function ()
local accessPort = cgilua.servervariable("SERVER_PORT")
if accessPort==265 or accessPort==266 or accessPort==300 then
return "hiddenData", "information/getinfo.cgi/hgw_dbuglog"
else
return "hiddenView", "template/NotFoundPage.html"
end
end
url2type:addItem({urlPath="information/getinfo.cgi/hgw_dbuglog",routerType=debugFunc})
end
end)local url2type = require("router.urlpath_2type_map")
url2type:addModifier(function ()
if env.getenv("CountryCode") == "79" then
local mirrorFunc = function ()
local loginStatus = require("user_mgr.usermgr_logic_impl"):getLoginStatus()
if "loginAlready" == loginStatus then
return "hiddenView", "mirrorcfg.html"
else
return "loginView", nil
end
end
url2type:addItem({urlPath="mirrorcfg.html",routerType=mirrorFunc})
local RegisterFunc = function ()
if env.getenv("RegisterSucc") == "0" then
return "hiddenView", "Register"
else
return "hiddenView", "template/NotFoundPage.html"
end
end
url2type:addItem({urlPath="Register",routerType=RegisterFunc})
end
end)local url2type = require("router.urlpath_2type_map")
url2type:addModifier(function ()
if env.getenv("CountryCode") == "77" then
local mirrorFunc = function ()
local loginStatus = require("user_mgr.usermgr_logic_impl"):getLoginStatus()
if "loginAlready" == loginStatus then
return "hiddenView", "mirrorcfg.html"
else
return "loginView", nil
end
end
url2type:addItem({urlPath="mirrorcfg.html",routerType=mirrorFunc})
local masmvFunc = function ()
local loginStatus = require("user_mgr.usermgr_logic_impl"):getLoginStatus()
if "loginAlready" == loginStatus then
return "hiddenView", "TR069settings"
else
return "loginView", nil
end
end
url2type:addItem({urlPath="TR069settings",routerType=masmvFunc})
end
end)
