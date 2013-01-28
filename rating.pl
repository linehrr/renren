#!/usr/bin/perl -w
no strict;
use LWP::UserAgent;
use utf8;

$loops = shift; 

foreach (1 .. $loops) {
`rm index*`;
`wget --save-cookie cookie -S --header='Connection: keep-alive' --header='Accept:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' --header='Accept-Charset:ISO-8859-1,utf-8;q=0.7,*;q=0.3' --header='Accept-Encoding:gzip,deflate,sdch' --header='Accept-Language:en-US,en;q=0.8,zh;q=0.6' --header='Cache-Control:max-age=0' --header='Host:www.facejoking.com' --header='User-Agent:Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/536.11 (KHTML, like Gecko) Ubuntu/12.04 Chromium/20.0.1132.47 Chrome/20.0.1132.47 Safari/536.11' www.facejoking.com >> log`;
#main page TODO
#need to change HOST in the header too TODO 

open FILE, '<cookie';
@cookie = <FILE>;
@iter = split /\t/,$cookie[4];

$rr_session = $iter[6];
chomp $rr_session;
#print $rr_session . "\n";

@iter = split /\t/,$cookie[5];
$token = $iter[6];
chomp $token;
#print $token;

#rating ID TODO
$query = "pid=485730&score=10&token=" . $token;

$cookie = 'ci_session=' . $rr_session . '; __utma=36522807.1552324098.1354842558.1354842558.1354842558.1; __utmb=36522807.1.10.1354842558; __utmc=36522807; __utmz=36522807.1354842558.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); CNZZDATA4346806=cnzz_eid=52924999-1354842561-&ntime=1354842561&cnzz_a=0&retime=1354842563283&sin=&ltime=1354842563283&rtime=0; CSRF_COOKIE=' . $token;



$response = `echo -n "$query" | POST -H 'Connection: keep-alive' -H 'Host: www.facejoking.com' -H 'Origin: http://www.facejoking.com' -H 'X-Requested-With: XMLHttpRequest' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/536.11 (KHTML, like Gecko) Ubuntu/12.04 Chromium/20.0.1132.47 Chrome/20.0.1132.47 Safari/536.11' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: http://www.facejoking.com/15003/top' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Accept-Language: en-US,en;q=0.8,zh;q=0.6' -H 'Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.3' -H 'Cookie: $cookie' www.facejoking.com/api/rating`;
#rating API TODO 

#$response = utf8::decode($response);
#$response = utf8::upgrade($response);

#binmode STDOUT, ":utf8";
print $response . "\n";
#sleep int(rand()*100);
}

