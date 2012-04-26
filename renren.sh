#!/bin/bash 

for i in $(seq 1000); do 
	rm home* 

	wget --header="Cookie:_r01_=1; mop_uniq_ckid=127.0.0.1_1328239655_1437844104; _de=DA1307199A949EED060571BA34DEDCB5; anonymid=h0y5rgrfkur79t; __utma=151146938.619555353.1334952316.1334952316.1334952316.1; __utmz=151146938.1334952316.1.1.utmcsr=lover.renren.com|utmccn=(referral)|utmcmd=referral|utmcct=/600486217; depovince=GW; jebecookies=01e0d277-4474-4797-914f-c756b0fce474|||||; XNESSESSIONID=abdbd9258e43; at=1; p=e3b174bd49c5760b7279bed5a9b0f5b86; ap=237725526; t=a24c0da24ab5d50b7235f6183f8b81ee6; societyguester=a24c0da24ab5d50b7235f6183f8b81ee6; id=237725526; xnsid=1023b207; vip=1; loginfrom=null" http://www.renren.com/home 

	cat home | grep namecard > 1.txt 

	cat 1.txt | while read line 
	do 
		line=`echo ${line#*href=\"}` 
		line=`echo ${line%namecard*}` 
		line=`echo ${line%\"*}` 
		line=`echo ${line%\"\>\<*}` 
		echo $line 
		wget --spider --header="Cookie:_r01_=1; mop_uniq_ckid=127.0.0.1_1328239655_1437844104; _de=DA1307199A949EED060571BA34DEDCB5; anonymid=h0y5rgrfkur79t; __utma=151146938.619555353.1334952316.1334952316.1334952316.1; __utmz=151146938.1334952316.1.1.utmcsr=lover.renren.com|utmccn=(referral)|utmcmd=referral|utmcct=/600486217; depovince=GW; jebecookies=01e0d277-4474-4797-914f-c756b0fce474|||||; XNESSESSIONID=abdbd9258e43; at=1; p=e3b174bd49c5760b7279bed5a9b0f5b86; ap=237725526; t=a24c0da24ab5d50b7235f6183f8b81ee6; societyguester=a24c0da24ab5d50b7235f6183f8b81ee6; id=237725526; xnsid=1023b207; vip=1; loginfrom=null" $line 

	done 
	echo $i 
	sleep 3600 

done 
