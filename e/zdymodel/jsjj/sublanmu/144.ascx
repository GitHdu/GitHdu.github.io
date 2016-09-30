<% @ Control Language="C#" Inherits="PageAdmin.sublanmu_zdymodel"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%=Zdy_Location%>
<div class="sublanmu_box sublanmu_box_<%=Sublanmu_Id%>">
<div class="sublanmu_content sublanmu_content_<%=Query_Table%>"><%=TheContent%><asp:PlaceHolder id="P_Search" Runat="server"/>
<%if(IsSearch==0){conn.Open();%><div class="jsxxjs">
<dl id="tabheadasd"  class="tabheadstylesa">
<dd>按职称排序</dd>
<dd>按教研室排序</dd>
</dl>
<dl id="tabcontentasd"  class="tabcontentstylesa">
<dd>
<ul class="zhichengbiao">
<%
string zc="教授,副教授,讲师";
string[] zclist=zc.Split(',');
for(int j=0;j<zclist.Length;j++){
%>

<li class="zhicheng"><%=zclist[j]%></li>
<li class="ry">
<% 
DataTable dt=Get_Data();
DataRow dr;
for(int i=0;i<dt.Rows.Count;i++)
 {
  dr=dt.Rows[i]; //说明：给dr赋值
    if(dr["pa_zc"].ToString()==zclist[j]){
%>


<a href="<%=Detail_Url(dr)%>"><%=dr["title"].ToString()%></a>


<%
    }
  }
%>
</li>
<%
 }
%>

</ul>
</dd>
<dd>
<ul class="jiaoyanshibiao">
<%
string zca="文艺理论教研室,古典学教研室,中国古代文学、中国古典文献学教研室,中国现当代文学教研室,创作性写作教研室,外国文学教研室";
string[] zclistq=zca.Split(',');
for(int z=0;z<zclistq.Length;z++){
%>

<li class="jiaoyanshi"><%=zclistq[z]%></li>
<li class="jysry"><span>教师</span>：
<% 
DataTable dt=Get_Data();
DataRow dr;
for(int i=0;i<dt.Rows.Count;i++)
 {
  dr=dt.Rows[i]; //说明：给dr赋值
   if(dr["pa_jys"].ToString()==zclistq[z]){
%>

<a href="<%=Detail_Url(dr)%>"><%=dr["title"].ToString()%></a>

<%
   }
  }
%>
</li>
<%
 }
%>
</ul></dd>
</dl>
</div>
<script type="text/javascript">
tabs("tabheadasd","tabcontentasd","onmouseover");
</script>



<%conn.Close();}
if(PageCount>1)
{
string PageHtml="<div class=\"sublanmu_page\">";
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
</div>
</div>