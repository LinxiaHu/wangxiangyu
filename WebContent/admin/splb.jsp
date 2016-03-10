<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
  <%
 CommDAO dao = new CommDAO();
    
  List<HashMap> nlist = dao.select("select * from splb where pid='-1' order by id desc");
   %>
  <body>
  	<!-- cellspacing 是单元格之间的距离、cesspadding 是单元格中内容与边框的距离 -->
  	<form name="f1" method="post" action="/fzsalessys/admin/splb.jsp" >
  	 
  	
  	
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytab" id="table1">
<tr align="center">
          <td colspan="9"  background="/fzsalessys/admin/commfiles/images/bg.gif"
				bgcolor="#FFFFFF" class="STYLE3">信息列表</td>
        </tr>
        <tr align="center">
          <td  class="itemtitle" width="22%" > 大类</td>
          <td class="itemtitle"> 小类</td>
        
  </tr>
        
         <%
 
  for(HashMap map:nlist)
  {
    %>
        <tr align="center">
          <td align="center"> <a href="javascript:update('<%=map.get("id") %>')"><%=map.get("lbname").equals("")?"&nbsp;":map.get("lbname") %></a> </td>
          <td align="center"> 
          
          <%
          for(HashMap m:new CommDAO().select("select * from splb where pid='"+map.get("id")+"'")){
           %>
          <a href="javascript:update('<%=m.get("id") %>')"><%=m.get("lbname").equals("")?"&nbsp;":m.get("lbname") %></a> 
          &nbsp;&nbsp;
          <%} %>
           <a href="javascript:add('<%=map.get("id") %>')">[点击添加小类]</a>
            </td>
          
         
  </tr>
        <%} %>
        
        <tr align="center">
          <td height="30" colspan="13" align="left">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
          <a href="javascript:add('-1')">[点击添加大类]</a>
          
          </td>
    </tr>
      </table>
      </form>
</body>
</html>
<%
if(request.getAttribute("suc")!=null)
{
 %>
 <script type="text/javascript">
<!--
alert("添加成功")
//-->
</script>
<%}%>

 <script type="text/javascript">
          function update(no)
          {
          pop('/fzsalessys/admin/updatesplb.jsp?id='+no,'修改类别',320,84);
          }
          
          function add(no)
          {
          pop('/fzsalessys/admin/addsplb.jsp?id='+no,'添加类别',320,84);
          }
          </script>