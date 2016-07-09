<% @ Page language="c#" Inherits="PageAdmin.custom_zdymodel"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%conn.Open();Read_Data(134);%><html>
<head>
<style type="text/css">
div{font:12px/1.7em Verdana,Tahoma,Helvetica,Arial,sans-serif;}
div .hs{color:#ff0000}
</style>
</head>
<body bgColor="transparent">
<div>
○- 文章总数：<span class="hs"><%=Get_Data("co","select count(id) as co from article")%></span><br>
○- 今日文章：<span class="hs"><%=Get_Data("co","select count(id) as co from article where datediff('d',thedate,Now())=0")%></span><br>
○- 会员总数：<span class="hs"><%=Get_Data("co","select count(id) as co from pa_member")%></span><br>
○- 最新会员：<span class="hs"><%=Get_Data("username","select top 1 username from pa_member order by id desc")%></span><br>
○- 访问总数：<span class="hs"><%=Get_Data("co","select count(id) as co  from pa_count")%></span><br>
○- 本月访问：<span class="hs"><%=Get_Data("co","select count(id) as co  from pa_count where datediff('m',thedate,Now())=0")%></span><br>
○- 今日访问：<span class="hs"><%=Get_Data("co","select count(id) as co  from pa_count where datediff('d',thedate,Now())=0")%></span><br>
</div>
</body>
</html><%conn.Close();
if(PageCount>1)
{
 string PageHtml="<div class=\"sublanmu_page custom_zdymodel_page\">";
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