#!/bin/bash 

for i in $(seq 1000); do 
	rm home* 

	wget --header="_r01_=1; mop_uniq_ckid=127.0.0.1_1328239655_1437844104; _de=DA1307199A949EED060571BA34DEDCB5; anonymid=h0y5rgrfkur79t; jebecookies=2c8a6755-6068-4ead-9fb8-2e6021d786b5|||||; JSESSIONID=abcDOFlQTVmuz6YoTWqBt; p=e3b174bd49c5760b7279bed5a9b0f5b86; ap=237725526; t=ce4fd862fdb56920df75e0012b13f1c26; societyguester=ce4fd862fdb56920df75e0012b13f1c26; id=237725526; xnsid=2f3d2650; vip=1; XNESSESSIONID=11d8f1214f5c; at=1; __utma=151146938.619555353.1334952316.1334952316.1334952316.1; __utmc=151146938; __utmz=151146938.1334952316.1.1.utmcsr=lover.renren.com|utmccn=(referral)|utmcmd=referral|utmcct=/600486217; loginfrom=null; feedType=237725526_hot" http://www.renren.com/home 

	cat home | grep namecard > 1.txt 

	cat 1.txt | while read line 
	do 
		line=`echo ${line#*href=\"}` 
		line=`echo ${line%namecard*}` 
		line=`echo ${line%\"*}` 
		line=`echo ${line%\"\>\<*}` 
		echo $line 
		wget --spider --header="_r01_=1; mop_uniq_ckid=127.0.0.1_1328239655_1437844104; _de=DA1307199A949EED060571BA34DEDCB5; anonymid=h0y5rgrfkur79t; jebecookies=2c8a6755-6068-4ead-9fb8-2e6021d786b5|||||; JSESSIONID=abcDOFlQTVmuz6YoTWqBt; p=e3b174bd49c5760b7279bed5a9b0f5b86; ap=237725526; t=ce4fd862fdb56920df75e0012b13f1c26; societyguester=ce4fd862fdb56920df75e0012b13f1c26; id=237725526; xnsid=2f3d2650; vip=1; XNESSESSIONID=11d8f1214f5c; at=1; __utma=151146938.619555353.1334952316.1334952316.1334952316.1; __utmc=151146938; __utmz=151146938.1334952316.1.1.utmcsr=lover.renren.com|utmccn=(referral)|utmcmd=referral|utmcct=/600486217; loginfrom=null; feedType=237725526_hot" $line 

	done 
	echo $i 
	sleep 3600 

done 
