var Show_Style=1;
var Image_16=new Array();
var Pics="/e/upload/s1/article/image/2015/10/t_08175521.jpg|/e/upload/s1/article/image/2015/10/t_08175542.jpg|/e/upload/s1/article/image/2015/10/t_08175804.jpg";
var Links="/index.aspx?lanmuid=63&sublanmuid=671&id=556|/index.aspx?lanmuid=63&sublanmuid=671&id=553|/index.aspx?lanmuid=63&sublanmuid=671&id=552";
var Titles="武汉一中十年同唱“融合之歌”|向着梦想一点一点努力|学校斥2万改造校舍 为“轮椅...";
var Alts="武汉一中十年同唱“融合之歌”|向着梦想一点一点努力|学校斥2万改造校舍 为“轮椅学霸”订制升降机";
var Apic16=Pics.split('|');
var ALink16=Links.split('|');
var ATitle16=Titles.split('|');
var AAlts16=Alts.split('|');
var Show_Text=1;
for(i=0;i<Apic16.length;i++)
  {
   Image_16.src = Apic16[i]; 
  }



  var FHTML='<div id="js_slide_focus_16" class="slide_focus focus_style1" style="height:225px"><a class="prev"></a><a class="next"></a>';
  FHTML+='<ul class="inner">';
  for(var i=0;i<Apic16.length;i++)
   {
     if(ALink16.length<(i+1) || ALink16[i]=="")
      {
       ALink16[i]="javascript:void(0)";
      }
     if(AAlts16.length<(i+1))
      {
       AAlts16[i]="";
      }
     if(ATitle16.length<(i+1))
      {
       ATitle16[i]="";
      }
    FHTML+='<li><a href="'+ALink16[i]+'" target="_self" title="'+AAlts16[i]+'"><img src="'+Apic16[i]+'">';
    FHTML+='<em>'+ATitle16[i]+'</em>';
    FHTML+='</a></li>';
   }
 FHTML+='</ul>';
 FHTML+='</div>';
 document.write(FHTML);
$(function(){Slide_Focus("js_slide_focus_16",0,5,240,225,false);});