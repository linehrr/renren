#!/bin/bash 

for i in $(seq 1000); do 
	rm home* 

	wget --header="Host: www.renren.com" --header="Connection: keep-alive" --header="User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/536.11 (KHTML, like Gecko) Ubuntu/12.04 Chromium/20.0.1132.47 Chrome/20.0.1132.47 Safari/536.11" --header="Accept: text/html" --header="Accept-Language: en-US,en;q=0.8,zh;q=0.6" --header="Cookie: anonymid=h8lbew20ab9vbx; depovince=TW; _r01_=1; _de=DA1307199A949EED060571BA34DEDCB5; l4pager=0; mop_uniq_ckid=127.0.0.1_1350935740_748264733; p=40a702f2fe7bf3421202e845cfc9256f6; ap=237725526; t=b92130b272d518ced025b582bda6972e6; societyguester=b92130b272d518ced025b582bda6972e6; id=237725526; xnsid=6ff6b9a6; JSESSIONID=abcltGbmgcsIXh6CucqQt; _urm_237725526=21; at=1; IL_D=1; loginfrom=null; feedType=237725526_hot; XNESSESSIONID=abcjH1DSgaclE56XvUqQt" -O home http://www.renren.com/237725526 

	cat home | grep namecard > 1.txt 

	cat 1.txt | while read line 
	do 
		line=`echo ${line#*href=\"}` 
		line=`echo ${line%namecard*}` 
		line=`echo ${line%\"*}` 
		line=`echo ${line%\"\>\<*}` 
		echo $line 
		wget --spider --header="Host: www.renren.com" --header="Connection: keep-alive" --header="User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/536.11 (KHTML, like Gecko) Ubuntu/12.04 Chromium/20.0.1132.47 Chrome/20.0.1132.47 Safari/536.11" --header="Accept: text/html" --header="Accept-Language: en-US,en;q=0.8,zh;q=0.6" --header="Cookie: anonymid=h8lbew20ab9vbx; depovince=TW; _r01_=1; _de=DA1307199A949EED060571BA34DEDCB5; l4pager=0; mop_uniq_ckid=127.0.0.1_1350935740_748264733; p=40a702f2fe7bf3421202e845cfc9256f6; ap=237725526; t=b92130b272d518ced025b582bda6972e6; societyguester=b92130b272d518ced025b582bda6972e6; id=237725526; xnsid=6ff6b9a6; JSESSIONID=abcltGbmgcsIXh6CucqQt; _urm_237725526=21; at=1; IL_D=1; loginfrom=null; feedType=237725526_hot; XNESSESSIONID=abcjH1DSgaclE56XvUqQt" $line 

	done 
	echo $i 
	sleep 3600 

done 
