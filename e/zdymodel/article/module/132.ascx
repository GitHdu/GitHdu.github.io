<% @ Control Language="C#" Inherits="PageAdmin.module_zdymodel"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%=Module_StartHtml%><%if(Zdy_Tag==0 && CleanContainer<2){%>
<div id="module_<%=Module_Id%>" <%=Module_box_style%>class="module_box<%=Layout%><%=Module_ClassName%>">
 <div <%=Module_box_inner%>class="module_box_inner">
   <%if(CleanContainer==0){%><div <%=Module_titlebox_style%>class="module_title"><span <%=Module_title_style%>class="module_sign"><%=Module_Title%></span><span <%=Module_more_style%>class="module_more"><%=More_Url%></span></div>
   <%}if(Module_Header!=""){%><%=Module_Header%><%}%><div id="module_content_<%=Module_Id%>" <%=Module_content_style%>class="module_content">
<%}%><%conn.Open();%><div style="position:relative;width:100%;text-align:center;overflow:hidden">
<div style="position:absolute;z-index:1;top:0px;left:0px;padding:60px 0 40px 0;cursor:pointer" onclick="c_direction('left')"><img src="/e/images/diy/btn_left.gif" border=0 width=12></div>
<div id="m_<%=Module_Id%>" style="margin:0 auto 0 auto;width:96%;overflow:hidden">
<table border=0 align=center cellpadding="5" cellspacing="0">
<tr>
<% 
DataTable dt=Get_Data();
DataRow dr;
for(int i=0;i<dt.Rows.Count;i++)
 {
dr=dt.Rows[i];
%>
<td align=center>
<a href="<%=Detail_Url(dr)%>" target="<%=Target%>"><img src="<%=dr["titlepic"]%>" border="0" style="<%=TitlePic_Size%>"></a>
<br>
<a href="<%=Detail_Url(dr)%>" target="<%=Target%>" title="<%=Server.HtmlEncode(dr["title"].ToString())%>"><%=SubStr(dr["title"].ToString(),Title_Num,true)%></a></span>
</td>
<%
 }
%>
</tr>
</table>
</div>
<div style="position:absolute;z-index:1;top:0px;right:0px;padding:60px 0 40px 0;cursor:pointer" onclick="c_direction('right')"><img src="/e/images/diy/btn_right.gif" border=0 width=12></div>
</div>
<script type="text/javascript">
var mrquee_<%=Module_Id%>=new Marquee("m_<%=Module_Id%>","left");
function c_direction(dir)
{
  mrquee_<%=Module_Id%>.Direction=dir;
}
</script><%conn.Close();%>
   <%if(Zdy_Tag==0 && CleanContainer<2){%></div>
   <div class="module_footer"><span class="l"></span><span class="r"></span></div>
 </div>
</div><%}%><%=Module_EndHtml%>