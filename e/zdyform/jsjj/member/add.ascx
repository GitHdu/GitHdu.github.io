<% @ Control  Language="C#" Inherits="PageAdmin.paform"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%Start();%>
<tr id='tr_jsjj_title'><td class='tdhead'>标题<span style='color:#ff0000'>*</span></td><td><input type=text name='title' id='title' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("title"));}%>"  maxlength="200"><span id="title_tip"></span></td></tr>
<tr id='tr_jsjj_titlepic'><td class='tdhead'>标题图片</td><td><input ondblclick="if(this.value!='')window.open(this.value)" type=text name='titlepic' id='titlepic'  value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("titlepic"));}%>"  ><%if(Field_ImageUpload=="true"){%><a href="javascript:delete_file('jsjj','titlepic',<%=InforId%>)" id="delete_titlepic" style="padding-left:2px;display:<%=r("titlepic")==""?"none":""%>" title='删除图片'><img src=/e/images/public/del.gif border=0></a><a id='upload_titlepic' href="javascript:open_upload('<%=SiteId%>','','image','jsjj','titlepic','titlepic')" style="display:<%=r("titlepic")==""?"":"none"%>"><img src='/e/images/public/attachimg.gif' border=0  hspace=2 alt='上传图片' align=absbottom></a><%}%><span id="titlepic_tip"></span></td></tr><tr id='tr_jsjj_pa_jj'><td class='tdhead' id='tr_jsjj_pa_jj'>简介</td><td><textarea name='pa_jj' id='pa_jj'  ><%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_jj"));}%></textarea><span id="pa_jj_tip"></span></td></tr>
<tr id='tr_jsjj_thedate'><td class='tdhead'>发布日期<span style='color:#ff0000'>*</span></td><td><input type=text name='thedate' id='thedate' value="<%if(post=="add"){Response.Write(""==""?DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"):"");}else{Response.Write(DateTime.Parse(r("thedate")).ToString("yyyy-MM-dd HH:mm:ss"));}%>"  maxlength="50"><a href="javascript:open_calendar('thedate',1)"><img src=/e/images/icon/date.gif border=0 height=20 hspace=2 align=absbottom></a><span id="thedate_tip"></span></td></tr>
<tr id='tr_jsjj_pa_jys'><td class='tdhead'>教研室</td><td><input type=text name='pa_jys' id='pa_jys' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_jys"));}%>"  maxlength="200"><span id="pa_jys_tip"></span></td></tr>
<tr id='tr_jsjj_pa_zc'><td class='tdhead'>职称</td><td><input type=text name='pa_zc' id='pa_zc' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_zc"));}%>"  maxlength="200"><span id="pa_zc_tip"></span></td></tr>
<tr id='tr_jsjj_content'><td class='tdhead'>详细内容</td><td><textarea name='content' id='content' style="width:100%;height:300px"   ><%if(post=="add"){Response.Write("");}else{Response.Write(r("content"));}%></textarea><script charset="utf-8" src="/e/incs/kindeditor/kindeditor.js" type="text/javascript"></script><script type="text/javascript">var KE_content;KindEditor.ready(function(K) {KE_content= K.create("#content",{uploadJson :kindeditor_uploadJson,fileManagerJson :kindeditor_fileManagerJson,allowImageUpload:<%=Editor_ImageUpload%>,allowFlashUpload:<%=Editor_FlashUpload%>,allowMediaUpload:<%=Editor_FlashUpload%>,allowFileUpload:<%=Editor_AttachmentUpload%>,allowFileManager :false,items :kindeditor_NormalItems,filterMode :false,extraFileUploadParams:{siteid:"<%=SiteId%>"}});});</script><span id="content_tip"></span></td></tr>

<input type='hidden' name='mustname' value='标题,发布日期,'><input type='hidden' name='mustfield' value='title,thedate,'><input type='hidden' name='musttype' value='text,text,'>
<script  type='text/javascript'>
function jsjj_zdycheck(){
KE_content.sync();
return true;
}
</script>
<%End();%>






