dmenu:addModifierLoader( function ()
if env.getenv("CountryCode") == "125" then
dmenu:newArea({area="trunkmode_t.lp", backendFile="trunkmode_lua.lua", right=1}):insertAfter("portBinding", "portbinding_t.lp")
dmenu:setRight("1",{
menuList = {
"firewall",
"filterCriteria",
"sntp",
"wlanAdvanced",
"wps",
"lanMgrIpv4",
"ftp",
"dms",
"samba",
"usbfunccfg",
"rebootAndReset",
"usrCfgMgr",
"accountMgr"
},
pageList = {
{"wlanBasic","wlan_wlanbasicadconf_t.lp","wlan_wlanbasiconoff_t.lp"}
}
})
dmenu:setRight("3",{
menuList = {
"networkDiag",
"ponopticalinfo",
"ethWanConfig",
"firewall",
"filterCriteria",
"localServiceCtrl",
"alg",
"dmz",
"portForwarding",
"portTrigger",
"portBinding",
"multicastmode",
"igmp",
"mld",
"multicastbasic",
"multicastvlan",
"multicastaddress",
"lanMgrIpv4",
"lanMgrIpv6",
"voipBasic",
"voipServices",
"sipIf",
"sipAdvanced",
"sip",
"sipDigitmap",
"sipMedia",
"sipslc",
"sipCallerID",
"fax",
"voipqos",
"dialPlan",
"mgcpBasic",
"mgcpAuth",
"h248Basic",
"h248Auth",
"voipSwithPtcl",
"rebootAndReset",
"accountMgr",
"logMgr",
"mirror",
"loopbackDetect",
"arpTable",
"macTable",
"routeIpv4",
"routeIpv6",
"remoteMgr"
},
pageList = {
{"filterCriteria","firewall_macfilterv3_t.lp"}
}
})
end
end)
