<%@ Control Language="C#"%>
<!---通知公告选项卡-->
<div class="tab1" style="height:160px">
<dl class="tabheader" id="tabheader1">
<dd><a href=/index.aspx?lanmuid=63&sublanmuid=548>通知公告</a></dd>
<dd><a href=/index.aspx?lanmuid=68&sublanmuid=634>解读高考</a></dd>
</dl>
<dl class="tabcontent" id="tabcontent1">
<dd><% @ Register TagPrefix="ascx" TagName="M_0" src="/e/zdymodel/article/module/133.ascx"%><ascx:M_0 runat="server" SiteId=1 ZdyTag=1 ModuleId="197_0"  TagTable="article" TagSortId=601 SqlOrder="order by " SqlCondition="" ShowNum=4 TitleNum=40 TitlePicWidth=150 TitlePicHeight=150 TheTarget="_self"/></dd>
<dd><% @ Register TagPrefix="ascx" TagName="M_1" src="/e/zdymodel/article/module/133.ascx"%><ascx:M_1 runat="server" SiteId=1 ZdyTag=1 ModuleId="197_1"  TagTable="article" TagSortId=623 SqlOrder="order by " SqlCondition="" ShowNum=4 TitleNum=50 TitlePicWidth=150 TitlePicHeight=150 TheTarget="_self"/></dd>
</dl>
</div>
<script type="text/javascript">
tabs("tabheader1","tabcontent1","onmouseover")
</script>
<div class="clear"></div>