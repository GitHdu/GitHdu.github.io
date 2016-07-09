    var bar = document.getElementById('MY_slidebar');
    var isIE=!!window.ActiveXObject;
    if( isIE ){
        bar.attachEvent("onmouseover", move);
        bar.attachEvent("onmouseout", outPlay);
    }else{
        bar.addEventListener("mouseover", move, false);
        bar.addEventListener("mouseout", outPlay, false);
    }
    var useOpacity =
        (typeof document.createElement("div").style.opacity != 'undefined');
    var useFilter = !useOpacity
        && (typeof document.createElement("div").style.filter != 'undefined');

    function setOpacity(el, value) {
        // let el be either an element object or an id string
        if (typeof el == 'string')
            el = document.getElementById(el);

        // ensure value is in [0-1] range
        value = Math.min(1, Math.max(value, 0));

        // set opacity or filter alpha depending on what's supported
        if (useOpacity)
            el.style.opacity = value;
        else if (useFilter)
            el.style.filter = "alpha(opacity=" + (value * 100) + ")";
    }
    var spans = bar.getElementsByTagName('span');
    spans[0].id = 'MY_current';
    var slidebox = document.getElementById('MY_slidebox');
    slidebox.getElementsByTagName('a')[0].id = 'show';
    var interval1 = null;
    var interval2 = null;
    var aImg = document.getElementById('MY_slidebox').getElementsByTagName('a');
    var theOpacity = 1;
    var autoIndex = 2;
    var autoInterval = null;
    var autoPlayTime = 4500;//鑷姩鎾斁闂撮殧鏃堕棿
    autoInterval = setInterval(autoPlay, autoPlayTime);
    function outPlay(){
        autoInterval = setInterval(autoPlay, autoPlayTime);
    }
    function autoPlay(){
        opacitySlideBox(autoIndex);
        var currentSpan = document.getElementById('MY_current');
        currentSpan.id = '';
        var temp = autoIndex - 1;
        spans[temp].id = 'MY_current';
        if(autoIndex == spans.length) {
            autoIndex = 1;
        }else{
            autoIndex++;
        }
    }
    function move(event){
        clearInterval(autoInterval);
        var targ;
        if( !event){
            var event = window.event;
        }
        if( event.target ){
            targ = event.target;
        }else{
            if( event.srcElement){
                targ = event.srcElement;
            }
        }
        if(targ.tagName == 'SPAN'){
            if(targ.id == '' ){
                var currentSpan = document.getElementById('MY_current');
                currentSpan.id = '';
                targ.id = 'MY_current';
                var Index = targ.getAttribute("alt");
                opacitySlideBox(Index);
            }
        }
    }

    /*function hasClass(targ, theClassName){
        for(i in targ.classList){
            if( targ.classList[i] == theClassName){
                return true;
            }
        }
    }*/
    function opacitySlideBox(index){
        index = parseInt(index) -1;
        clearInterval(interval1);
        clearInterval(interval2);
        var time = 20;
        var opacityInterval = 0.1;
        var current = document.getElementById('show');
        theOpacity1 = 1;
        theOpacity2 = 0;
        interval1 = setInterval(function(){
            if( theOpacity1 > 0 ){
                theOpacity1 -= opacityInterval;
                //current.style.opacity = theOpacity1;
                setOpacity(current, theOpacity1);
            }else{
                current.id = '';
                clearInterval(interval1);
                //theOpacity = 0;
                /*interval = setInterval(function(){
                    if(theOpacity < 1){
                        theOpacity += opacityInterval;
                        aImg[index].style.opacity = theOpacity;
                    }else{
                        clearInterval(interval);
                    }
                }, time);
                aImg[index].id = 'show';*/
            }
        }, time);
        interval2 = setInterval(function(){
            if( theOpacity2 < 1){
                theOpacity2 += opacityInterval;
                //aImg[index].style.opacity = theOpacity2;
                setOpacity(aImg[index], theOpacity2);
            }else{
                aImg[index].id = 'show';
                clearInterval(interval2);
            }
        },time);
    }
    /*function moveSlideBox(index){
        clearInterval(interval);
        var Time = 1;
        var px = 10;
        var slidebox_left = parseInt(slidebox.style.left);
        if( !slidebox_left){
            slidebox_left = 0;
        }
        var target_left = -((parseInt(index) - 1) * 966);
        if( target_left > slidebox_left){
            interval = setInterval(function(){
                if(slidebox_left <= target_left){
                    if( (target_left - slidebox_left) <= px ){
                        slidebox.style.left = target_left + 'px';
                    }else{
                        slidebox_left += px;
                        slidebox.style.left = slidebox_left+ 'px';
                    }
                }else{
                    clearInterval(interval);
                }
            }, Time);
        }else{
            interval = setInterval(function(){
                if(slidebox_left >= target_left){
                    if( (slidebox_left - target_left) <= px ){
                        slidebox.style.left = target_left + 'px';
                    }else{
                        slidebox_left -= px;
                        slidebox.style.left = slidebox_left + 'px';
                    }
                }else{
                    clearInterval(interval);
                }
            }, Time);
        }
    }*/
