function ypSlideOutMenu(id,dir,left,top,width,height){if(this.ie=document.all?1:0,this.ns4=document.layers?1:0,this.dom=document.getElementById?1:0,this.css="",this.ie||this.ns4||this.dom){this.id=id,this.dir=dir,this.orientation="left"==dir||"right"==dir?"h":"v",this.dirType="right"==dir||"down"==dir?"-":"+",this.dim="h"==this.orientation?width:height,this.hideTimer=!1,this.aniTimer=!1,this.open=!1,this.over=!1,this.startTime=0,this.gRef="ypSlideOutMenu_"+id,eval(this.gRef+"=this"),ypSlideOutMenu.Registry[id]=this;var d=document,strCSS="";strCSS+="#"+this.id+"Container { visibility:hidden; ",strCSS+="left:"+left+"px; ",strCSS+="top:"+top+"px; ",strCSS+="width:"+width+"px; ",strCSS+="height:"+height+"px; ",strCSS+="overflow:hidden; z-index:10000; }",strCSS+="#"+this.id+"Container, #"+this.id+"Content { position:absolute; ",strCSS+="}",this.css=strCSS,this.load()}}ypSlideOutMenu.Registry=[],ypSlideOutMenu.aniLen=250,ypSlideOutMenu.hideDelay=500,ypSlideOutMenu.minCPUResolution=10,ypSlideOutMenu.writeCSS=function(){document.writeln('<style type="text/css">');for(var i in ypSlideOutMenu.Registry)document.writeln(ypSlideOutMenu.Registry[i].css);document.writeln("</style>")},ypSlideOutMenu.prototype.load=function(){var d=document,lyrId1=this.id+"Container",lyrId2=this.id+"Content",obj1=this.dom?d.getElementById(lyrId1):this.ie?d.all[lyrId1]:d.layers[lyrId1];if(obj1)var obj2=this.ns4?obj1.layers[lyrId2]:this.ie?d.all[lyrId2]:d.getElementById(lyrId2);var temp;obj1&&obj2?(this.container=obj1,this.menu=obj2,this.style=this.ns4?this.menu:this.menu.style,this.homePos=eval("0"+this.dirType+this.dim),this.outPos=0,this.accelConst=(this.outPos-this.homePos)/ypSlideOutMenu.aniLen/ypSlideOutMenu.aniLen,this.ns4&&this.menu.captureEvents(Event.MOUSEOVER|Event.MOUSEOUT),this.menu.onmouseover=new Function("ypSlideOutMenu.showMenu('"+this.id+"')"),this.menu.onmouseout=new Function("ypSlideOutMenu.hideMenu('"+this.id+"')"),this.endSlide()):window.setTimeout(this.gRef+".load()",100)},ypSlideOutMenu.showMenu=function(i){var e=ypSlideOutMenu.Registry,t=ypSlideOutMenu.Registry[i];if(t.container){t.over=!0;for(menu in e)i!=menu&&ypSlideOutMenu.hide(menu);t.hideTimer&&(e[i].hideTimer=window.clearTimeout(e[i].hideTimer)),t.open||t.aniTimer||e[i].startSlide(!0)}},ypSlideOutMenu.hideMenu=function(i){var e=ypSlideOutMenu.Registry[i];e.container&&(e.hideTimer&&window.clearTimeout(e.hideTimer),e.hideTimer=window.setTimeout("ypSlideOutMenu.hide('"+i+"')",ypSlideOutMenu.hideDelay))},ypSlideOutMenu.hideAll=function(){var i=ypSlideOutMenu.Registry;for(menu in i)ypSlideOutMenu.hide(menu),menu.hideTimer&&window.clearTimeout(menu.hideTimer)},ypSlideOutMenu.hide=function(i){var e=ypSlideOutMenu.Registry[i];e.over=!1,e.hideTimer&&window.clearTimeout(e.hideTimer),e.hideTimer=0,e.open&&!e.aniTimer&&e.startSlide(!1)},ypSlideOutMenu.prototype.startSlide=function(i){this[i?"onactivate":"ondeactivate"](),this.open=i,i&&this.setVisibility(!0),this.startTime=(new Date).getTime(),this.aniTimer=window.setInterval(this.gRef+".slide()",ypSlideOutMenu.minCPUResolution)},ypSlideOutMenu.prototype.slide=function(){var i=(new Date).getTime()-this.startTime;if(i>ypSlideOutMenu.aniLen)this.endSlide();else{var e=Math.round(Math.pow(ypSlideOutMenu.aniLen-i,2)*this.accelConst);e=this.open&&"-"==this.dirType?-e:this.open&&"+"==this.dirType?-e:this.open||"-"!=this.dirType?this.dim+e:-this.dim+e,this.moveTo(e)}},ypSlideOutMenu.prototype.endSlide=function(){this.aniTimer=window.clearTimeout(this.aniTimer),this.moveTo(this.open?this.outPos:this.homePos),this.open||this.setVisibility(!1),(this.open&&!this.over||!this.open&&this.over)&&this.startSlide(this.over)},ypSlideOutMenu.prototype.setVisibility=function(i){var e=this.ns4?this.container:this.container.style;e.visibility=i?"visible":"hidden"},ypSlideOutMenu.prototype.moveTo=function(i){this.style["h"==this.orientation?"left":"top"]=this.ns4?i:i+"px"},ypSlideOutMenu.prototype.getPos=function(i){return parseInt(this.style[i])},ypSlideOutMenu.prototype.onactivate=function(){},ypSlideOutMenu.prototype.ondeactivate=function(){},new ypSlideOutMenu("menu1","down",102,0,98,268),new ypSlideOutMenu("menu2","down",203,0,98,268),new ypSlideOutMenu("menu3","down",304,0,98,268),ypSlideOutMenu.writeCSS();