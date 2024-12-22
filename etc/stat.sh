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
#echo "������ID"
echo "ppid      : $(echo $stat | awk '{print $4}')"
#echo "�߳����"
echo "pgid      : $(echo $stat | awk '{print $5}')"
echo "sid       : $(echo $stat | awk '{print $6}')"
#echo "�������tty�ն˵��豸��"
echo "tty_nr    : $(echo $stat | awk '{print $7}')"
#echo "�ն˵Ľ�����ţ���ǰ�����ڸ����������ն˵�ǰ̨����(����shell Ӧ�ó���)��PID"
echo "tty_ggrp  : $(echo $stat | awk '{print $8}')"
#echo "���̱�־λ���鿴�����������"
taskflag=$(printf 0x%X $(echo $stat | awk '{print $9}'))
echo "taskflag  : $taskflag"
#echo "��������Ҫ��Ӳ�̿����ݶ�������ȱҳ����ȱҳ���Ĵ���"
echo "minflt    : $(echo $stat | awk '{print $10}')"
#echo "�ۼƵĸ���������е�waited-for�������������Ĵ�ȱҳ�Ĵ���Ŀ"
echo "cminflt   : $(echo $stat | awk '{print $11}')"
#echo "��������Ҫ��Ӳ�̿����ݶ�������ȱҳ����ȱҳ���Ĵ���"
echo "majflt    : $(echo $stat | awk '{print $12}')"
#echo "�ۼƵĸ���������е�waited-for����������������ȱҳ�Ĵ���Ŀ"
echo "cmajflt   : $(echo $stat | awk '{print $13}')"
#echo "���������û�̬���е�ʱ�䣬��λΪjiffies"
echo "utime     : $(echo $stat | awk '{print $14}')"
#echo "�������ں���̬���е�ʱ�䣬��λΪjiffies"
echo "stime     : $(echo $stat | awk '{print $15}')"
#echo "�ۼƵĸ���������е�waited-for�����������û�̬���е�ʱ�䣬��λΪjiffies"
echo "cutime    : $(echo $stat | awk '{print $16}')"
#echo "�ۼƵĸ���������е�waited-for���������ں���̬���е�ʱ�䣬��λΪjiffies"
echo "cstime    : $(echo $stat | awk '{print $17}')"
#echo "����Ķ�̬���ȼ�"
echo "priority  : $(echo $stat | awk '{print $18}')"
#echo "����ľ�̬���ȼ�"
echo "nice      : $(echo $stat | awk '{print $19}')"
#echo "���������ڵ��߳������̵߳ĸ���"
echo "numthreads: $(echo $stat | awk '{print $20}')"
#echo "xxxx		: $(echo $stat | awk '{print $21}')"
#echo "������������ʱ�䣬��λΪjiffies"
echo "starttime : $(echo $stat | awk '{print $22}')"
echo "vsize     : $(echo $stat | awk '{print $23}')"
#echo "������ǰפ�������ַ�ռ�Ĵ�С"
echo "rss(page) : $(echo $stat | awk '{print $24}')"
#echo "��������פ�������ַ�ռ�����ֵ"
rsslim=$(printf 0x%X $(echo $stat | awk '{print $25}'))
echo "rsslim    : $rsslim"
#echo "�������������ַ�ռ�Ĵ���ε���ʼ��ַ"
echo "startcode : $(echo $stat | awk '{print $26}')"
echo "endcode   : $(echo $stat | awk '{print $27}')"
#echo "�������������ַ�ռ��ջ�Ľ�����ַ"
startstack=$(printf 0x%X $(echo $stat | awk '{print $28}'))
echo "startstack: $startstack"
#echo "esp(32 λ��ջָ��) �ĵ�ǰֵ, ���ڽ��̵��ں˶�ջҳ�õ���һ��"
esp=$(printf %X $(echo $stat | awk '{print $29}'))
echo "ESP       : 0x$esp"
#echo "ָ��Ҫִ�е�ָ���ָ��, EIP(32 λָ��ָ��)�ĵ�ǰֵ. PC"
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
#echo "�������źŵ�λͼ����¼���͸����̵���ͨ�ź�"
echo "pendingsig: $(echo $stat | awk '{print $31}')"
#echo "�����źŵ�λͼ"
echo "blocksig  : $(echo $stat | awk '{print $32}')"
#echo "���Ե��źŵ�λͼ"
echo "sigign    : $(echo $stat | awk '{print $33}')"
#echo "��������źŵ�λͼ"
echo "sigcatch  : $(echo $stat | awk '{print $34}')"
#echo "����ý�����˯��״̬����ֵ�������ȵĵ��õ�"
echo "wchan     : $(echo $stat | awk '{print $35}')"
#echo "�ý��̽���ʱ���򸸽��������͵��ź�"
echo "exitsig   : $(echo $stat | awk '{print $38}')"
echo "oncpu     : $(echo $stat | awk '{print $39}')"
#echo "ʵʱ���̵�������ȼ���"
echo "rtpriority: $(echo $stat | awk '{print $40}')"
#echo "���̵ĵ��Ȳ��ԣ�0=��ʵʱ���̣�1=FIFOʵʱ���̣�2=RRʵʱ����"
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


