$(document).ready(function(){                                            /*首页显现卡*/
  $("#linktabtitle dd").each(function(i){
     $(this).click(function(){
       $("#linktabtitle dd").eq(i).addClass("current").siblings().removeClass("current");
	   $("#linktabcon dd").eq(i).show().siblings().hide();
     });
   });
});

    
$(document).ready(function(){   
    var ieie7=(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE7.0");
    if(ieie7){return}
	var $left_position=$(".main_box_inner_left");
	if($left_position.size()==0){return};
	var $Top_position=$left_position.offset().top;
	var $right_height=$(".main_box_inner_right").height();
	var $left_height=$left_position.height();
	if($left_height>$right_height){return};
	var $window_height=$(window).height();
    $(window).bind("scroll",function(){
		startscroll();
	 });
	 $(window).bind("resize",function(){
		$window_height=$(window).height();
		startscroll();
	 });
	 function startscroll()
	   {
	   if($left_height>$window_height){$left_position.css({"position":"static"});return};
	   var sTop=$(window).scrollTop();
	   var sTop= parseInt(sTop);
	   if(sTop > $Top_position){
		  $left_position.css({"position":"fixed","top":"0px","z-index":"1"});
		}else if(sTop<=$Top_position){
		  $left_position.css({"position":"static"});
	    }
	   }
});
