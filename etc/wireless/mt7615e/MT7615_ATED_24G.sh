#!/bin/sh

read -p "-----MT7603 2.4G ATED Test---BEGIN----Press Enter To Continue!"
read -p "Please confirm the packet capture channel: 1(bgn)!! Press Enter To Continue!"
echo "11b  11M  CH1   catch channel：1(bgn)"
`iwpriv wlan0 set ATE=TXSTOP`
`iwpriv wlan0 set ATE=ATESTART`
`iwpriv wlan0 set ATETXANT=1`
`iwpriv wlan0 set ATERXANT=1`
`iwpriv wlan0 set ATETXMODE=0`
`iwpriv wlan0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan0 set ATETXMCS=3`
`iwpriv wlan0 set ATETXBW=0`
`iwpriv wlan0 set ATECHANNEL=1`
`iwpriv wlan0 set ATETXGI=0`
`iwpriv wlan0 set ATETXCNT=2000`
`iwpriv wlan0 set ATETXLEN=1000`
`iwpriv wlan0 set ATE=TXFRAME`


echo "11g  54M  CH1   catch channel：1(bgn)"
`iwpriv wlan0 set ATE=TXSTOP`
`iwpriv wlan0 set ATE=ATESTART`
`iwpriv wlan0 set ATETXANT=1`
`iwpriv wlan0 set ATERXANT=1`
`iwpriv wlan0 set ATETXMODE=1`
`iwpriv wlan0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan0 set ATETXMCS=7`
`iwpriv wlan0 set ATETXBW=0`
`iwpriv wlan0 set ATECHANNEL=1`
`iwpriv wlan0 set ATETXGI=0`
`iwpriv wlan0 set ATETXCNT=2000`
`iwpriv wlan0 set ATETXLEN=1000`
`iwpriv wlan0 set ATE=TXFRAME`


echo "11n MCS7 65M  catch channel：1(bgn)"
`iwpriv wlan0 set ATE=TXSTOP`
`iwpriv wlan0 set ATE=ATESTART`
`iwpriv wlan0 set ATETXANT=1`
`iwpriv wlan0 set ATERXANT=1`
`iwpriv wlan0 set ATETXMODE=2`
`iwpriv wlan0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan0 set ATETXMCS=7`
`iwpriv wlan0 set ATETXBW=0`
`iwpriv wlan0 set ATECHANNEL=1`
`iwpriv wlan0 set ATETXGI=0`
`iwpriv wlan0 set ATETXCNT=2000`
`iwpriv wlan0 set ATETXLEN=1000`
`iwpriv wlan0 set ATE=TXFRAME`

read -p "Please confirm the packet capture channel: 6(bgn)!! Press Enter To Continue!"
echo "11b  11M  CH6   catch channel：6(bgn)"
`iwpriv wlan0 set ATE=TXSTOP`
`iwpriv wlan0 set ATE=ATESTART`
`iwpriv wlan0 set ATETXANT=1`
`iwpriv wlan0 set ATERXANT=1`
`iwpriv wlan0 set ATETXMODE=0`
`iwpriv wlan0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan0 set ATETXMCS=3`
`iwpriv wlan0 set ATETXBW=0`
`iwpriv wlan0 set ATECHANNEL=6`
`iwpriv wlan0 set ATETXGI=0`
`iwpriv wlan0 set ATETXCNT=2000`
`iwpriv wlan0 set ATETXLEN=1000`
`iwpriv wlan0 set ATE=TXFRAME`

echo "11g  54M  CH6   抓取信道：6(bgn)"
`iwpriv wlan0 set ATE=TXSTOP`
`iwpriv wlan0 set ATE=ATESTART`
`iwpriv wlan0 set ATETXANT=1`
`iwpriv wlan0 set ATERXANT=1`
`iwpriv wlan0 set ATETXMODE=1`
`iwpriv wlan0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan0 set ATETXMCS=7`
`iwpriv wlan0 set ATETXBW=0`
`iwpriv wlan0 set ATECHANNEL=6`
`iwpriv wlan0 set ATETXGI=0`
`iwpriv wlan0 set ATETXCNT=2000`
`iwpriv wlan0 set ATETXLEN=1000`
`iwpriv wlan0 set ATE=TXFRAME`

echo "11n MCS7 65M  抓取信道：6(bgn)"
`iwpriv wlan0 set ATE=TXSTOP`
`iwpriv wlan0 set ATE=ATESTART`
`iwpriv wlan0 set ATETXANT=1`
`iwpriv wlan0 set ATERXANT=1`
`iwpriv wlan0 set ATETXMODE=2`
`iwpriv wlan0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan0 set ATETXMCS=7`
`iwpriv wlan0 set ATETXBW=0`
`iwpriv wlan0 set ATECHANNEL=6`
`iwpriv wlan0 set ATETXGI=0`
`iwpriv wlan0 set ATETXCNT=2000`
`iwpriv wlan0 set ATETXLEN=1000`
`iwpriv wlan0 set ATE=TXFRAME`


read -p "Please confirm the packet capture channel: 11(bgn)!! Press Enter To Continue!"
echo "11b  11M  CH11   抓取信道：11(bgn)"
`iwpriv wlan0 set ATE=TXSTOP`
`iwpriv wlan0 set ATE=ATESTART`
`iwpriv wlan0 set ATETXANT=1`
`iwpriv wlan0 set ATERXANT=1`
`iwpriv wlan0 set ATETXMODE=0`
`iwpriv wlan0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan0 set ATETXMCS=3`
`iwpriv wlan0 set ATETXBW=0`
`iwpriv wlan0 set ATECHANNEL=11`
`iwpriv wlan0 set ATETXGI=0`
`iwpriv wlan0 set ATETXCNT=2000`
`iwpriv wlan0 set ATETXLEN=1000`
`iwpriv wlan0 set ATE=TXFRAME`


echo "11g  54M  CH11   抓取信道：11(bgn)"
`iwpriv wlan0 set ATE=TXSTOP`
`iwpriv wlan0 set ATE=ATESTART`
`iwpriv wlan0 set ATETXANT=1`
`iwpriv wlan0 set ATERXANT=1`
`iwpriv wlan0 set ATETXMODE=1`
`iwpriv wlan0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan0 set ATETXMCS=7`
`iwpriv wlan0 set ATETXBW=0`
`iwpriv wlan0 set ATECHANNEL=11`
`iwpriv wlan0 set ATETXGI=0`
`iwpriv wlan0 set ATETXCNT=2000`
`iwpriv wlan0 set ATETXLEN=1000`
`iwpriv wlan0 set ATE=TXFRAME`


echo "11n MCS7 65M  抓取信道：11(bgn)"
`iwpriv wlan0 set ATE=TXSTOP`
`iwpriv wlan0 set ATE=ATESTART`
`iwpriv wlan0 set ATETXANT=1`
`iwpriv wlan0 set ATERXANT=1`
`iwpriv wlan0 set ATETXMODE=2`
`iwpriv wlan0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan0 set ATETXMCS=7`
`iwpriv wlan0 set ATETXBW=0`
`iwpriv wlan0 set ATECHANNEL=11`
`iwpriv wlan0 set ATETXGI=0`
`iwpriv wlan0 set ATETXCNT=2000`
`iwpriv wlan0 set ATETXLEN=1000`
`iwpriv wlan0 set ATE=TXFRAME`


read -p "Please confirm the packet capture channel: 1(n40h)!! Press Enter To Continue!"
echo "11n MCS7 135M  抓取信道：1(n40h)"
`iwpriv wlan0 set ATE=TXSTOP`
`iwpriv wlan0 set ATE=ATESTART`
`iwpriv wlan0 set ATETXANT=1`
`iwpriv wlan0 set ATERXANT=1`
`iwpriv wlan0 set ATETXMODE=2`
`iwpriv wlan0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan0 set ATETXMCS=7`
`iwpriv wlan0 set ATETXBW=1`
`iwpriv wlan0 set ATECHANNEL=3`
`iwpriv wlan0 set ATETXGI=0`
`iwpriv wlan0 set ATETXCNT=2000`
`iwpriv wlan0 set ATETXLEN=1000`
`iwpriv wlan0 set ATE=TXFRAME`


read -p "Please confirm the packet capture channel: 4(n40h)!! Press Enter To Continue!"
echo "11n MCS7 135M  抓取信道：4(n40h)"
`iwpriv wlan0 set ATE=TXSTOP`
`iwpriv wlan0 set ATE=ATESTART`
`iwpriv wlan0 set ATETXANT=1`
`iwpriv wlan0 set ATERXANT=1`
`iwpriv wlan0 set ATETXMODE=2`
`iwpriv wlan0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan0 set ATETXMCS=7`
`iwpriv wlan0 set ATETXBW=1`
`iwpriv wlan0 set ATECHANNEL=6`
`iwpriv wlan0 set ATETXGI=0`
`iwpriv wlan0 set ATETXCNT=2000`
`iwpriv wlan0 set ATETXLEN=1000`
`iwpriv wlan0 set ATE=TXFRAME`

read -p "Please confirm the packet capture channel: 7(n40h)!! Press Enter To Continue!"
echo "11n MCS7 135M  抓取信道：7(n40h)"
`iwpriv wlan0 set ATE=TXSTOP`
`iwpriv wlan0 set ATE=ATESTART`
`iwpriv wlan0 set ATETXANT=1`
`iwpriv wlan0 set ATERXANT=1`
`iwpriv wlan0 set ATETXMODE=2`
`iwpriv wlan0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan0 set ATETXMCS=7`
`iwpriv wlan0 set ATETXBW=1`
`iwpriv wlan0 set ATECHANNEL=9`
`iwpriv wlan0 set ATETXGI=0`
`iwpriv wlan0 set ATETXCNT=2000`
`iwpriv wlan0 set ATETXLEN=1000`
`iwpriv wlan0 set ATE=TXFRAME`



