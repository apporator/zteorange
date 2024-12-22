#!/bin/sh

if [[ "$1" == "--help" ]];
then
   echo "Please type in:$0 'wlanx' 'mac'."
   echo "'wlanx' is the wlan interface, 'wlanx' default is wlan5g0."
   echo "'mac' is sta mac, %02x:%02x:%02x:%02x:%02x:%02x."
   exit 1
fi

WLAN_STR=wlan5g0

case "$1" in
"wlan"*)
    WLAN_STR=$1;;
esac

iwpriv $WLAN_STR set Debug=2

iwpriv $WLAN_STR show driverinfo
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR stat
    iwpriv $WLAN_STR set ResetCounter=1
    sleep 1
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show stat
    sleep 1
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show stainfo
    sleep 1
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show trinfo
done

iwpriv $WLAN_STR show sysinfo
iwpriv $WLAN_STR show devinfo
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show stacountinfo
    sleep 1
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show bainfo
    sleep 1
done

iwpriv $WLAN_STR e2p

iwpriv $WLAN_STR show sta_tr
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show peerinfo=$2
    sleep 1
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show mibinfo
done

for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show radiostat
    sleep 1
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show bcninfo
done
iwpriv $WLAN_STR show wifi_sys
iwpriv $WLAN_STR show radio_info
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show staoffline
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show chanutil
done

for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show tpinfo
done

for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show swqinfo
done

for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show pseinfo
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show MibBucket
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show wtbl=0
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show dschinfo
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show ser
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show serinfo
done

for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820F3190
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82000200
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820682ec
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820FD000
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820FD020
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820FD220
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820F4128
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820F3080
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820f3110
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820F409c
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820FA044
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820F6024
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820600b0
done
for i in 1 2 3
do
    iwpriv $WLAN_STR mac 820f5220-820f523c
    sleep 1
done
for i in 1 2 3
do
    iwpriv $WLAN_STR mac 820fb05c
done
for i in 1 2 3
do
    iwpriv $WLAN_STR mac 820fc008
done
for i in 1 2 3
do
    iwpriv $WLAN_STR mac 820f3110-820f3114
    sleep 1
done
for i in 1 2 3
do
    iwpriv $WLAN_STR mac 820fb030-820fb034
    sleep 1
done

iwpriv $WLAN_STR set Debug=0