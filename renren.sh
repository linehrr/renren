#!/bin/bash 

for i in $(seq 1000); do 
	rm home* 

	wget --header="Cookie:_r01_=1; mop_uniq_ckid=127.0.0.1_1328239655_1437844104; anonymid=h0y5rgrfkur79t; _de=DA1307199A949EED060571BA34DEDCB5; __utma=10481322.350472199.1335541232.1335541232.1335545492.2; __utmz=10481322.1335545492.2.2.utmcsr=renren.com|utmccn=(referral)|utmcmd=referral|utmcct=/237725526; depovince=GW; at=1; jebecookies=43af11f8-982d-4ff1-a5e4-7ad7f8493729|||||; p=85be9a082d81ccf152230aa5e06905176; ap=237725526; t=40849ae241b52d797065ae45fe0d57bc6; societyguester=40849ae241b52d797065ae45fe0d57bc6; id=237725526; xnsid=5e77e40; wpsid=13497917510200; vip=1; XNESSESSIONID=2496655a64ff; loginfrom=null" http://www.renren.com/home 

	cat home | grep namecard > 1.txt 

	cat 1.txt | while read line 
	do 
		line=`echo ${line#*href=\"}` 
		line=`echo ${line%namecard*}` 
		line=`echo ${line%\"*}` 
		line=`echo ${line%\"\>\<*}` 
		echo $line 
		wget --spider --header="Cookie:_r01_=1; mop_uniq_ckid=127.0.0.1_1328239655_1437844104; anonymid=h0y5rgrfkur79t; _de=DA1307199A949EED060571BA34DEDCB5; __utma=10481322.350472199.1335541232.1335541232.1335545492.2; __utmz=10481322.1335545492.2.2.utmcsr=renren.com|utmccn=(referral)|utmcmd=referral|utmcct=/237725526; depovince=GW; at=1; jebecookies=43af11f8-982d-4ff1-a5e4-7ad7f8493729|||||; p=85be9a082d81ccf152230aa5e06905176; ap=237725526; t=40849ae241b52d797065ae45fe0d57bc6; societyguester=40849ae241b52d797065ae45fe0d57bc6; id=237725526; xnsid=5e77e40; wpsid=13497917510200; vip=1; XNESSESSIONID=2496655a64ff; loginfrom=null" $line 

	done 
	echo $i 
	sleep 3600 

done 
