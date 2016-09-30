<% @ Control  Language="C#" Inherits="PageAdmin.patag"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%Start();%>
<script type="text/javascript" src="/e/js/zdyform.js"></script>
<form name="feedback" method="post" Enctype="multipart/form-data" action="/e/aspx/post.aspx">
<ul  align=center width=95% class="feedback_table"><li class="a2"><span class="a1">分类</span><select name="sort" id="sort"><option value="0">选择分类</option><option value="555">咨询</option>
<option value="556">建议</option>
<option value="557">投诉</option>
<option value="558">其他</option>
</select></li>
<li class="a2"><span class="a1">主题</span><input type=text name="title" id="title" value="" style="width:300px"  maxlength="50" ></li>
<li class="a2"><span class="a1">联系人</span><input type=text name="pa_truename" id="pa_truename" value="" style="width:300px"  maxlength="50" ></li>
<li class="a2"><span class="a1">联系电话</span><input type=text name="pa_tel" id="pa_tel" value="" style="width:300px"  maxlength="50" ></li>
<li class="a2"><span class="a1">邮箱</span><input type=text name="email" id="email" value=""onblur="if(!IsEmail(this.value)){alert('无效的邮件格式');document.letter.fbk_email.value=''}" maxlength="50" style="width:300px;" ></li>
<li class="a3"><span class="a4">内容</span><span class="a5"><textarea name="content" id="content" style="width:100%;height:300px"  ></textarea></span></li><script charset="utf-8" src="/e/incs/kindeditor/kindeditor.js" type="text/javascript"></script>
<script type="text/javascript">
var KE_content;
KindEditor.ready(function(K) {
KE_content= K.create("#content",
{
uploadJson :kindeditor_uploadJson,
fileManagerJson :kindeditor_fileManagerJson,
allowImageUpload:false,
allowFlashUpload:false,
allowMediaUpload:false,
allowFileUpload:false,
allowFileManager :false,
items :kindeditor_SmallItems,
newlineTag:"p",
filterMode :true,
extraFileUploadParams:{siteid:"1"}
}
);
});
</script>
<li class="a2"><span class="a1">验证码</span><input type=text name="vcode" style="width:150px;" id="vcode" maxlength=4 size=4> <img src="/e/aspx/yzm.aspx" onclick=Code_Change("vcode_img") align=absmiddle border=0 id="vcode_img" style="cursor:pointer" alt="点击更换"></li>
<li colspan=2 align=center><input type="hidden" name="checked" value="0"><input type="hidden" name="showcode" value="0"><input type="hidden" name="to" value=""><input type="hidden" name="mailto" value=""><input type="hidden" name="mailreply" value=""><input type="hidden" name="mailsubject" value=""><input type="hidden" name="mailbody" value=""><input type="hidden" name="insertdatabase" value="1"><input type="hidden" name="siteid" value="1"><input type="hidden" name="formtable" value="feedback"><input type="hidden" name="mustname" value="主题,邮箱,内容,"><input type="hidden" name="mustfield" value="title,email,content,"><input type="hidden" name="musttype" value="text,text,editor,"><input type="button" class="bt" value=" 提交 " onclick="return set_feedback()"></li></ul>
</form>
<script type="text/javascript">
function set_feedback()
{
document.forms["feedback"].mailto.value="";
document.forms["feedback"].mailreply.value="";
document.forms["feedback"].mailsubject.value="";
document.forms["feedback"].mailbody.value="";
return Check_ZdyForm("feedback");
}

function feedback_zdycheck(){
KE_content.sync();
return true;
}
</script>
<%End();
if(PageCount>1)
{
string PageHtml="<div id=\"sublanmu_page\" class=\"sublanmu_page\">";
if(CurrentPage==1)
{
if(APage_LinkText[0]!=""){PageHtml+="<span class=\"firstpage\">"+APage_LinkText[0]+"</span>";} //首页
}
else if(CurrentPage>1)
{
 if(APage_LinkText[0]!=""){PageHtml+="<a href=\""+GoPage(1)+"\" class=\"firstpage\">"+APage_LinkText[0]+"</a>";} //首页
 if(APage_LinkText[1]!=""){PageHtml+=" <a href=\""+GoPage(CurrentPage-1)+"\" class=\"prevpage\">"+APage_LinkText[1]+"</a>";} //上一页
}
 int p=8; //表示开始时显示的页码总数
 int M=4; //超过p页后左右两边显示页码数
 int LastPage=1;
 if(CurrentPage<p)
  {
    LastPage=p;
    if(LastPage>PageCount)
     {
       LastPage=PageCount;
     }
    for(int i=1;i<=LastPage;i++)
    {
     if(CurrentPage==i)
      {
        PageHtml+=" <span class=\"c\">"+i.ToString()+"</span>";
      }
    else
      {
       PageHtml+=" <a href=\""+GoPage(i)+"\">"+i.ToString()+"</a>";
      }
    }
  }
 else
  {
    //PageHtml+=" <a href=\""+GoPage(CurrentPage-1)+"\">1...</a>";
    LastPage=CurrentPage+M;
    if(LastPage>PageCount)
     {
       LastPage=PageCount;
     }
    for(int i=(CurrentPage-M);i<=LastPage;i++)
    {
     if(CurrentPage==i)
      {
        PageHtml+=" <span class=\"c\">"+i.ToString()+"</span>";
      }
    else
      {
       PageHtml+=" <a href=\""+GoPage(i)+"\">"+i.ToString()+"</a>";
      }
    }

  }

if(CurrentPage<PageCount)
{
  if(LastPage<PageCount)
   {
     PageHtml+=" <a href=\""+GoPage(LastPage+1)+"\">...</a>";
   }
  if(APage_LinkText[2]!=""){PageHtml+=" <a href=\""+GoPage(CurrentPage+1)+"\" class=\"nextpage\">"+APage_LinkText[2]+"</a>";}  //下一页
  if(APage_LinkText[3]!=""){PageHtml+=" <a href=\""+GoPage(PageCount)+"\" class=\"lastpage\">"+APage_LinkText[3]+"</a>";}     //尾页
}
else if(CurrentPage==PageCount)
{
if(APage_LinkText[3]!=""){PageHtml+=" <span class=\"lastpage\">"+APage_LinkText[3]+"</span>";}     //尾页
}
if(Page_LinkInfo!=""){PageHtml+=" <span class=\"pageinfo\">"+String.Format(Page_LinkInfo,CurrentPage,PageCount,RecordCount)+"</span>";} //记录页次
PageHtml+="</div>";
Response.Write(PageHtml);
}%>