#!/bin/sh

if [ $# -ne 1 ];then 
	echo "param is ne 1[$#]"
	exit 0
fi

stat=$(cat /proc/$1/stat)
echo "pid       : $(echo $stat | awk '{print $1}')"
echo "name      : $(echo $stat | awk '{print $2}')"
#echo "R:runnign, S:sleeping (TASK_INTERRUPTIBLE), D:disk sleep (TASK_UNINTERRUPTIBLE), T: stopped, T:tracing stop,Z:zombie, X:dead"
echo "state     : $(echo $stat | awk '{print $3}')"
#echo "父进程ID"
echo "ppid      : $(echo $stat | awk '{print $4}')"
#echo "线程组号"
echo "pgid      : $(echo $stat | awk '{print $5}')"
echo "sid       : $(echo $stat | awk '{print $6}')"
#echo "该任务的tty终端的设备号"
echo "tty_nr    : $(echo $stat | awk '{print $7}')"
#echo "终端的进程组号，当前运行在该任务所在终端的前台任务(包括shell 应用程序)的PID"
echo "tty_ggrp  : $(echo $stat | awk '{print $8}')"
#echo "进程标志位，查看该任务的特性"
taskflag=$(printf 0x%X $(echo $stat | awk '{print $9}'))
echo "taskflag  : $taskflag"
#echo "该任务不需要从硬盘拷数据而发生的缺页（次缺页）的次数"
echo "minflt    : $(echo $stat | awk '{print $10}')"
#echo "累计的该任务的所有的waited-for进程曾经发生的次缺页的次数目"
echo "cminflt   : $(echo $stat | awk '{print $11}')"
#echo "该任务需要从硬盘拷数据而发生的缺页（主缺页）的次数"
echo "majflt    : $(echo $stat | awk '{print $12}')"
#echo "累计的该任务的所有的waited-for进程曾经发生的主缺页的次数目"
echo "cmajflt   : $(echo $stat | awk '{print $13}')"
#echo "该任务在用户态运行的时间，单位为jiffies"
echo "utime     : $(echo $stat | awk '{print $14}')"
#echo "该任务在核心态运行的时间，单位为jiffies"
echo "stime     : $(echo $stat | awk '{print $15}')"
#echo "累计的该任务的所有的waited-for进程曾经在用户态运行的时间，单位为jiffies"
echo "cutime    : $(echo $stat | awk '{print $16}')"
#echo "累计的该任务的所有的waited-for进程曾经在核心态运行的时间，单位为jiffies"
echo "cstime    : $(echo $stat | awk '{print $17}')"
#echo "任务的动态优先级"
echo "priority  : $(echo $stat | awk '{print $18}')"
#echo "任务的静态优先级"
echo "nice      : $(echo $stat | awk '{print $19}')"
#echo "该任务所在的线程组里线程的个数"
echo "numthreads: $(echo $stat | awk '{print $20}')"
#echo "xxxx		: $(echo $stat | awk '{print $21}')"
#echo "该任务启动的时间，单位为jiffies"
echo "starttime : $(echo $stat | awk '{print $22}')"
echo "vsize     : $(echo $stat | awk '{print $23}')"
#echo "该任务当前驻留物理地址空间的大小"
echo "rss(page) : $(echo $stat | awk '{print $24}')"
#echo "该任务能驻留物理地址空间的最大值"
rsslim=$(printf 0x%X $(echo $stat | awk '{print $25}'))
echo "rsslim    : $rsslim"
#echo "该任务在虚拟地址空间的代码段的起始地址"
echo "startcode : $(echo $stat | awk '{print $26}')"
echo "endcode   : $(echo $stat | awk '{print $27}')"
#echo "该任务在虚拟地址空间的栈的结束地址"
startstack=$(printf 0x%X $(echo $stat | awk '{print $28}'))
echo "startstack: $startstack"
#echo "esp(32 位堆栈指针) 的当前值, 与在进程的内核堆栈页得到的一致"
esp=$(printf %X $(echo $stat | awk '{print $29}'))
echo "ESP       : 0x$esp"
#echo "指向将要执行的指令的指针, EIP(32 位指令指针)的当前值. PC"
eip=$(printf 0x%X $(echo $stat | awk '{print $30}'))
arch32=$(cat /proc/$1/maps | awk 'NR == 1' | cut -c 9)
arch64=$(cat /proc/$1/maps | awk 'NR == 1' | cut -c 17)
if [ $arch32 == '-' ]; then 
	#echo "arm32-$eip"
	while read line
	do
		start=$(echo $line | cut -c 1-8)
		value1=$(printf %d 0x$(echo $start))
		start16=$(printf 0x%X 0x$(echo $start))
		#
		value3=$(printf %d $(echo $eip))

		end=$(echo $line | cut -c 10-18)
		value2=$(printf %d 0x$(echo $end))
		end16=$(printf 0x%X 0x$(echo $end))

		v1=$(echo $value1 | cut -c 1-7)
		v2=$(echo $value2 | cut -c 1-7)
		veip=$(echo $value3 | cut -c 1-7)

		if [ $veip -gt $v1 -a $veip -lt $v2 ];then
			eiplib=$(echo $line | awk '{print $NF}') 
			v4=$[$start16-$end16]
			break;
		fi
	done < /proc/$1/maps

elif [ $arch64 == '-' ]; then
	#echo "arm64" 
	echo "EIP       : $eip"
fi
#printf EIP:0x%X\n $eip
echo "EIP       : $eip:[$eiplib]:$v4"
#echo "待处理信号的位图，记录发送给进程的普通信号"
echo "pendingsig: $(echo $stat | awk '{print $31}')"
#echo "阻塞信号的位图"
echo "blocksig  : $(echo $stat | awk '{print $32}')"
#echo "忽略的信号的位图"
echo "sigign    : $(echo $stat | awk '{print $33}')"
#echo "被俘获的信号的位图"
echo "sigcatch  : $(echo $stat | awk '{print $34}')"
#echo "如果该进程是睡眠状态，该值给出调度的调用点"
echo "wchan     : $(echo $stat | awk '{print $35}')"
#echo "该进程结束时，向父进程所发送的信号"
echo "exitsig   : $(echo $stat | awk '{print $38}')"
echo "oncpu     : $(echo $stat | awk '{print $39}')"
#echo "实时进程的相对优先级别"
echo "rtpriority: $(echo $stat | awk '{print $40}')"
#echo "进程的调度策略，0=非实时进程，1=FIFO实时进程；2=RR实时进程"
echo "policy    : $(echo $stat | awk '{print $41}')"

echo "delayblktk: $(echo $stat | awk '{print $42}')"
echo "gtime     : $(echo $stat | awk '{print $43}')"
echo "cgtime    : $(echo $stat | awk '{print $44}')"

echo "startdata : $(echo $stat | awk '{print $45}')"
echo "enddata   : $(echo $stat | awk '{print $46}')"
echo "startbrk  : $(echo $stat | awk '{print $47}')"
echo "startarg  : $(echo $stat | awk '{print $48}')"
echo "endarg    : $(echo $stat | awk '{print $49}')"
echo "startenv  : $(echo $stat | awk '{print $50}')"
echo "endenv    : $(echo $stat | awk '{print $51}')"
echo "exitcode  : $(echo $stat | awk '{print $52}')"


