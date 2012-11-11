#!/usr/bin/perl -w

foreach (1..100) {
`rm index*`;
`wget --save-cookie cookie -S --header='Connection: keep-alive' --header='Accept:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' --header='Accept-Charset:ISO-8859-1,utf-8;q=0.7,*;q=0.3' --header='Accept-Encoding:gzip,deflate,sdch' --header='Accept-Language:en-US,en;q=0.8,zh;q=0.6' --header='Cache-Control:max-age=0' --header='Host:www.mynvshen.com' --header='User-Agent:Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/536.11 (KHTML, like Gecko) Ubuntu/12.04 Chromium/20.0.1132.47 Chrome/20.0.1132.47 Safari/536.11' www.mynvshen.com`;

open FILE, '<cookie';
@cookie = <FILE>;
@iter = split /\t/,$cookie[4];

$rr_session = $iter[6];
chomp $rr_session;
print $rr_session . "\n";

@iter = split /\t/,$cookie[5];
$token = $iter[6];
chomp $token;
print $token;


$query = "id=28477&rate=10&token=" . $token;

$cookie = 'pgv_pvi=5552842752; pgv_si=s663872512; rr_session=' . $rr_session . '; __utma=234961565.462386985.1352332790.1352346562.1352349642.4; __utmb=234961565.1.10.1352349642; __utmc=234961565; __utmz=234961565.1352332790.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); Hm_lvt_4aaefbe480734e725dd35a22e4d9720b=1352335975339,1352340605574,1352346562467,1352349670984; Hm_lpvt_4aaefbe480734e725dd35a22e4d9720b=1352349670984; XSRF_COOKIE=' . $token . '; jiathis_rdc=%7B%22http%3A//www.mynvshen.com/15003/top%22%3A%22180%7C1352349673158%22%7D';



$response = `echo -n "$query" | POST -H 'Connection: keep-alive' -H 'Host: www.mynvshen.com' -H 'Origin: http://www.mynvshen.com' -H 'X-Requested-With: XMLHttpRequest' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/536.11 (KHTML, like Gecko) Ubuntu/12.04 Chromium/20.0.1132.47 Chrome/20.0.1132.47 Safari/536.11' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: http://www.mynvshen.com/15003/top' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Accept-Language: en-US,en;q=0.8,zh;q=0.6' -H 'Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.3' -H 'Cookie: $cookie' www.mynvshen.com/rating`;

print $response . "\n";
sleep int(rand()*50);
}

