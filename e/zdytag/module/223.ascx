<% @ Control  Language="C#" Inherits="PageAdmin.patag"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%Start();%>
<div class="sy_xxk">
<dl id="tabhead"  class="tabheadstyle">
<dd>中心资讯-News</dd>
<dd>学术-Acadimecs</dd>
<dd>学科-Subjects</dd>
</dl>
<dl id="tabcontent"  class="tabcontentstyle">
<dd><% @ Register TagPrefix="ascx" TagName="M_0" src="/e/zdymodel/article/module/138.ascx"%><ascx:M_0 runat="server" TagSiteId=1 SiteId=1 ZdyTag=1 ModuleId="223_0" TagTable="article" TagSortId=680 SqlOrder="order by " SqlCondition="" ShowNum=12 TagZtId=0 TitleNum=50 TitlePicWidth=150 TitlePicHeight=150 TheTarget="_self"/></dd>
<dd><% @ Register TagPrefix="ascx" TagName="M_1" src="/e/zdymodel/article/module/138.ascx"%><ascx:M_1 runat="server" TagSiteId=1 SiteId=1 ZdyTag=1 ModuleId="223_1" TagTable="article" TagSortId=682 SqlOrder="order by " SqlCondition="" ShowNum=12 TagZtId=0 TitleNum=50 TitlePicWidth=150 TitlePicHeight=150 TheTarget="_self"/></dd>
<dd>
<div class="xk_jj">
<div class="tit">微电子学介绍</div>
<div class="xk_com">&nbsp;&nbsp;&nbsp;&nbsp;微电子学专业是以集成电路设计、制造与应用为代表的学科，是现代发展最迅速的高科技应用性学科之一。该专业主要是培养掌握集成电路、微电子系统的设计、制造工艺和设计软件系统，能在微电子及相关领域从事科研、教学、工程技术及技术管理等工作的高级专门人才。</div>
</div>

<ul class="xueke">
<li><a href="javascript:;">高数</a><a href="javascript:;">集成电路EDA设计技术</a><a href="javascript:;">单片机原理及应用</a><a href="javascript:;">半导体物理</a><a href="javascript:;">模拟电子技术</a><a href="javascript:;">数字电子技术</a><a href="javascript:;">嵌入式操作系统原理与设计</a></li>
</ul>
</dd>
</dl>
</div>
<script type="text/javascript">
tabs("tabhead","tabcontent","onmouseover");
</script>
<%End();%>