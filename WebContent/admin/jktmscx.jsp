<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.PageManager"%>
<%@page import="dao.CommDAO"%>
 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="/fzsalessys/admin/commfiles/css/common.css" /> 
	<link rel="stylesheet" type="text/css" href="/fzsalessys/admin/commfiles/css/style.css" /> 
	<script type="text/javascript" src="/fzsalessys/js/popup.js"></script>
  </head>
  
  <body>
  	<!-- cellspacing 是单元格之间的距离、cesspadding 是单元格中内容与边框的距离 -->
  	<form name="f1" method="post"  action="jktmscx.jsp"      >
  	<table id="mainbody" border="0" width="100%" cellspacing="1"
					class="tableform">
			<tr>
     				 <td colspan=5 height="31" align="left" style="font-size: 12px">&nbsp;&nbsp;&nbsp; 
<% 
String ptname = request.getParameter("tname")==null?"":request.getParameter("tname"); 
String starttname = request.getParameter("starttname")==null?"":request.getParameter("starttname"); 
String endtname = request.getParameter("endtname")==null?"":request.getParameter("endtname"); 
   %>

<%
 HashMap mmm = new HashMap();%> 
题目名称 &nbsp;:&nbsp; <input type=text class=''  size=20 name='tname' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;<input type=submit class='btn3_mouseup' value='查询信息' /> &nbsp;&nbsp;<input type=button   class='btn3_mouseup'  value='添加信息' onclick="add();" /> &nbsp;&nbsp;</td>
	    </tr>
			</table>
  	
  	
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytab" id="table1">
<tr align="center">
          <td  background="/fzsalessys/admin/commfiles/images/bg.gif"
				bgcolor="#FFFFFF" class="STYLE3" colspan="10">信息列表</td>
        </tr>
        <tr align="center">
          <td  class="itemtitle" >题目名称</td>
<td  class="itemtitle" >选项一</td>
<td  class="itemtitle" >选项二</td>
<td  class="itemtitle" >选项三</td>
<td  class="itemtitle" >选项四</td>
<td  class="itemtitle" >选项五</td>
<td  class="itemtitle" >操作</td>
    </tr>
        
     
        <% 
new CommDAO().delete(request,"jktms"); 
if(request.getParameter("tnameid1")!=null){ 
 new CommDAO().commOper("update jktms set tname ='' where id="+request.getParameter("tnameid1"));  
} 
if(request.getParameter("tnameid2")!=null){ 
 new CommDAO().commOper("update jktms set tname ='' where id="+request.getParameter("tnameid2"));  
} 
String sql = "select * from jktms where 1=1 " ;
 if(!ptname.equals("")){ 
 sql+= " and tname like'%"+ptname+"%' " ;
 }  
 if(!starttname.equals("")){  
 mmm.put("starttname",starttname) ;
 sql+= " and tname >'"+starttname+"' " ;
 }  
 if(!endtname.equals("")){  
 mmm.put("endtname",endtname) ;
 sql+= " and tname <'"+Info.getDay(endtname,1)+"' " ;
 }  
  sql +=" order by id desc ";
String url = "jktmscx.jsp?1=1&tname="+ptname+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr align="center">

          <td align="center"><%=map.get("tname")%></td>
          <td align="center"><%=map.get("xx1").equals("")?"&nbsp;":map.get("xx1") %></td>
          <td align="center"><%=map.get("xx2").equals("")?"&nbsp;":map.get("xx2") %></td>
          <td align="center"><%=map.get("xx3").equals("")?"&nbsp;":map.get("xx3") %></td>
          <td align="center"><%=map.get("xx4").equals("")?"&nbsp;":map.get("xx4") %></td>
          <td align="center"><%=map.get("xx5").equals("")?"&nbsp;":map.get("xx5") %></td>
          <td align="center"><a href="javascript:update('<%=map.get("id")%>')">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="return confirm('确定要删除这条记录吗?')"  href="jktmscx.jsp?scid=<%=map.get("id")%>">删除</a></td>
</tr>
<%}%>
        
        
        <tr align="center">
          <td colspan=7 align="right" colspan="5">${page.info}</td>
        </tr>
      </table>
  </form>
</body>
</html>
 <script language=javascript src='/fzsalessys/js/ajax.js'></script>
<% 
mmm.put("tname",ptname); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/fzsalessys/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/fzsalessys/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('jktmsxg.jsp?id='+no,'信息修改',550,220) 
}
</script> 
<script language=javascript> 
function add(){ 
pop('jktmstj.jsp','信息添加',550,220) 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
