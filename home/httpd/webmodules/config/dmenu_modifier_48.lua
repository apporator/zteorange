dmenu:addModifierLoader( function ()
if env.getenv("CountryCode") == "48" then
dmenu:findMenu("localServiceCtrl"):setAttribute("right","3")
dmenu:findMenu("dmz"):setAttribute("right","3")
dmenu:findMenu("alg"):setAttribute("right","3")
dmenu:findMenu("ddns"):setAttribute("right","3")
dmenu:findMenu("portForwarding"):setAttribute("right","3")
dmenu:findMenu("portTrigger"):setAttribute("right","3")
dmenu:findMenu("ethWanConfig"):setAttribute("right","3")
dmenu:findMenu("tunnel4in6Config"):setAttribute("right","3")
dmenu:findMenu("l2tpConfig"):setAttribute("right","3")
dmenu:findMenu("ponopticalinfo"):setAttribute("right","3")
dmenu:findMenu("portBinding"):setAttribute("right","3")
dmenu:findMenu("rip"):setAttribute("right","3")
dmenu:findMenu("multicastmode"):setAttribute("right","3")
dmenu:findMenu("igmp"):setAttribute("right","3")
dmenu:findMenu("mld"):setAttribute("right","3")
dmenu:findMenu("multicastbasic"):setAttribute("right","3")
dmenu:findMenu("multicastvlan"):setAttribute("right","3")
dmenu:findMenu("multicastaddress"):setAttribute("right","3")
dmenu:findMenu("portlocate"):setAttribute("right","3")
dmenu:findMenu("routeIpv4"):setAttribute("right","3")
dmenu:findMenu("routeIpv6"):setAttribute("right","3")
dmenu:findMenu("upnp"):setAttribute("right","3")
dmenu:findMenu("bpdu"):setAttribute("right","3")
dmenu:findMenu("dns"):setAttribute("right","3")
dmenu:findMenu("lanMgrIpv6"):setAttribute("right","3")
dmenu:findMenu("firmwareUpgr"):setAttribute("right","3")
dmenu:findMenu("logMgr"):setAttribute("right","3")
dmenu:findMenu("remoteMgr"):setAttribute("right","3")
dmenu:findMenu("networkDiag"):setAttribute("right","3")
dmenu:findMenu("mirror"):setAttribute("right","3")
dmenu:findMenu("loopbackDetect"):setAttribute("right","3")
dmenu:findMenu("arpTable"):setAttribute("right","3")
dmenu:findMenu("macTable"):setAttribute("right","3")
dmenu:findMenu("IPv6SwitchMgr"):setAttribute("right","3")
if env.getenv("usbSupport") ~= "0" then
dmenu:findMenu("usbrestore"):setAttribute("right","3")
dmenu:findMenu("usbbackup"):setAttribute("right","3")
dmenu:findMenu("Wan3gConfig"):setAttribute("right","3")
end
end
end)
