#!/bin/sh

read -p "-----MT7615 5G ATED Test---BEGIN----Press Enter To Continue!"
read -p "Please confirm the packet capture channel: 36(an)!! Press Enter To Continue!"
echo "11a 6M   抓取信道：36(an)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXANT=4`
`iwpriv wlan5g0 set ATETXMODE=1`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=0`
`iwpriv wlan5g0 set ATETXBW=0`
`iwpriv wlan5g0 set ATECHANNEL=36`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`

echo "11n 6.5M   抓取信道：36(an)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXANT=4`
`iwpriv wlan5g0 set ATETXMODE=2`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=0`
`iwpriv wlan5g0 set ATETXBW=0`
`iwpriv wlan5g0 set ATECHANNEL=36`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`

echo "11n 65M   抓取信道：36(an)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXANT=4`
`iwpriv wlan5g0 set ATETXMODE=2`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=7`
`iwpriv wlan5g0 set ATETXBW=0`
`iwpriv wlan5g0 set ATECHANNEL=36`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`



read -p "Please confirm the packet capture channel: 64(an)!! Press Enter To Continue!"
echo "11a 6M   抓取信道：64(an)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXANT=4`
`iwpriv wlan5g0 set ATETXMODE=1`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=0`
`iwpriv wlan5g0 set ATETXBW=0`
`iwpriv wlan5g0 set ATECHANNEL=64`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`


echo "11n 6.5M   抓取信道：64(an)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXANT=4`
`iwpriv wlan5g0 set ATETXMODE=2`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=0`
`iwpriv wlan5g0 set ATETXBW=0`
`iwpriv wlan5g0 set ATECHANNEL=64`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`

echo "5G 64信道 11n 65M   抓取信道：64(an)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXANT=4`
`iwpriv wlan5g0 set ATETXMODE=2`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=7`
`iwpriv wlan5g0 set ATETXBW=0`
`iwpriv wlan5g0 set ATECHANNEL=64`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`



read -p "Please confirm the packet capture channel: 100(an)!! Press Enter To Continue!"
echo "5G 100信道 11a 6M   抓取信道：100(an)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXANT=4`
`iwpriv wlan5g0 set ATETXMODE=1`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=0`
`iwpriv wlan5g0 set ATETXBW=0`
`iwpriv wlan5g0 set ATECHANNEL=100`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`


echo "5G 100信道 11n 6.5M   抓取信道：100(an)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXANT=4`
`iwpriv wlan5g0 set ATETXMODE=2`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=0`
`iwpriv wlan5g0 set ATETXBW=0`
`iwpriv wlan5g0 set ATECHANNEL=100`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`


echo "5G 100信道 11n 65M   抓取信道：100(an)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXANT=4`
`iwpriv wlan5g0 set ATETXMODE=2`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=7`
`iwpriv wlan5g0 set ATETXBW=0`
`iwpriv wlan5g0 set ATECHANNEL=100`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`



read -p "Please confirm the packet capture channel: 149(an)!! Press Enter To Continue!"
echo "5G 149信道 11a 6M   抓取信道：149(an)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXANT=4`
`iwpriv wlan5g0 set ATETXMODE=1`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=0`
`iwpriv wlan5g0 set ATETXBW=0`
`iwpriv wlan5g0 set ATECHANNEL=149`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`


echo "5G 149信道 11n 6.5M   抓取信道：149(an)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXANT=4`
`iwpriv wlan5g0 set ATETXMODE=2`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=0`
`iwpriv wlan5g0 set ATETXBW=0`
`iwpriv wlan5g0 set ATECHANNEL=149`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`


echo "5G 149信道 11n 65M   抓取信道：149(an)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXANT=4`
`iwpriv wlan5g0 set ATETXMODE=2`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=7`
`iwpriv wlan5g0 set ATETXBW=0`
`iwpriv wlan5g0 set ATECHANNEL=149`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`






read -p "Please confirm the packet capture channel: 36(n40h)!! Press Enter To Continue!"
echo "5G 36信道 11n 135M   抓取信道：36(n40h)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXANT=4`
`iwpriv wlan5g0 set ATETXMODE=2`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=7`
`iwpriv wlan5g0 set ATETXBW=1`
`iwpriv wlan5g0 set ATECHANNEL=38`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`





read -p "Please confirm the packet capture channel: 60(n40h)!! Press Enter To Continue!"
echo "5G 36信道 11n 135M   抓取信道：60(n40h)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXANT=4`
`iwpriv wlan5g0 set ATETXMODE=2`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=7`
`iwpriv wlan5g0 set ATETXBW=1`
`iwpriv wlan5g0 set ATECHANNEL=62`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`




read -p "Please confirm the packet capture channel: 100(n40h)!! Press Enter To Continue!"
echo "5G 36信道 11n 135M   抓取信道：100(n40h)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXANT=4`
`iwpriv wlan5g0 set ATETXMODE=2`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=7`
`iwpriv wlan5g0 set ATETXBW=1`
`iwpriv wlan5g0 set ATECHANNEL=102`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`




read -p "Please confirm the packet capture channel: 149(n40h)!! Press Enter To Continue!"
echo "5G 36信道 11n 135M   抓取信道：149(n40h)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXANT=4`
`iwpriv wlan5g0 set ATETXMODE=2`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=7`
`iwpriv wlan5g0 set ATETXBW=1`
`iwpriv wlan5g0 set ATECHANNEL=151`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`





read -p "Please confirm the packet capture channel: 36(ac)!! Press Enter To Continue!"
echo "5G 36信道 11ac 390M   抓取信道：36(ac)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXMODE=4`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=9`
`iwpriv wlan5g0 set ATETXBW=2`
`iwpriv wlan5g0 set ATECHANNEL=42`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`



read -p "Please confirm the packet capture channel: 64(ac)!! Press Enter To Continue!"
echo "5G 36信道 11ac 390M   抓取信道：64(ac)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXMODE=4`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=9`
`iwpriv wlan5g0 set ATETXBW=2`
`iwpriv wlan5g0 set ATECHANNEL=58`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`



read -p "Please confirm the packet capture channel: 100(ac)!! Press Enter To Continue!"
echo "5G 36信道 11ac 390M   抓取信道：100(ac)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXMODE=4`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=9`
`iwpriv wlan5g0 set ATETXBW=2`
`iwpriv wlan5g0 set ATECHANNEL=106`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`



read -p "Please confirm the packet capture channel: 36(ac)!! Press Enter To Continue!"
echo "5G 36信道 11ac 390M   抓取信道：149(ac)"
`iwpriv wlan5g0 set ATE=TXSTOP`
`iwpriv wlan5g0 set ATE=ATESTART`
`iwpriv wlan5g0 set ATETXMODE=4`
`iwpriv wlan5g0 set ATEDA=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATESA=00:aa:bb:cc:dd:ee`
`iwpriv wlan5g0 set ATEBSSID=00:11:22:33:44:55`
`iwpriv wlan5g0 set ATETXMCS=9`
`iwpriv wlan5g0 set ATETXBW=2`
`iwpriv wlan5g0 set ATECHANNEL=155`
`iwpriv wlan5g0 set ATETXGI=0`
`iwpriv wlan5g0 set ATETXCNT=2000`
`iwpriv wlan5g0 set ATETXLEN=1000`
`iwpriv wlan5g0 set ATE=TXFRAME`
