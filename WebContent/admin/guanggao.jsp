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
   String key = request.getParameter("key")==null?"":request.getParameter("key");
  String did = request.getParameter("did")==null?"":request.getParameter("did");
  
  if(!did.equals(""))
  {
  dao.commOper("update news set filename=null where id="+did);
  }
  
  String url = "news.jsp?1=1";
  String sql = "select * from news  where  infotype='广告'  ";
  
  sql+=" order by id ";
  System.out.println(sql);
  PageManager pageManager = PageManager.getPage(url, 10, request);
  pageManager.doList(sql);
  PageManager bean = (PageManager) request.getAttribute("page");
  ArrayList<HashMap> nlist = (ArrayList) bean.getCollection();
   %>
  <body>
  	<!-- cellspacing 是单元格之间的距离、cesspadding 是单元格中内容与边框的距离 -->
  	<form name="f1" method="post" action="/fzsalessys/admin/news.jsp" >
  	  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytab" id="table1">
<tr align="center">
          <td colspan="7"  background="/fzsalessys/admin/commfiles/images/bg.gif"
				bgcolor="#FFFFFF" class="STYLE3">信息列表</td>
        </tr>
        <tr align="center">
          <td  class="itemtitle" >&nbsp;</td>
          <td class="itemtitle"> 图片</td>
          
          <td class="itemtitle" width="15%">操作</td>
  </tr>
        
         <%
  int i=0;
  for(HashMap map:nlist)
  {
  i++;
    %>
        <tr align="center">
          <td align="center" width="12%"> <%="广告"+i %> </td>
          <td align="center"> 
          
          <%
          if(!map.get("filename").equals("")){
           %>
           <img src="../upfile/<%=map.get("filename") %>" height="120" width="550"   />
          <%}else{ %>
          &nbsp;
          <%} %>
          </td>
          
          <td align="center">
          
          <a href="javascript:update('<%=map.get("id")%>')">修改</a>
          <script type="text/javascript">
          
          
          function update(no)
          {
          pop('/fzsalessys/admin/updategg.jsp?id='+no,'修改信息',600,169);
          }
          </script>
          &nbsp;|&nbsp;
          <a href="/fzsalessys/admin/guanggao.jsp?did=<%=map.get("id")%>">删除</a>
          
          
          
          </td>
  </tr>
        <%} %>
        
        
      </table>
      </form>
</body>
</html>

<script type="text/javascript">
<!--

          function add()
          {
          pop('/fzsalessys/admin/addnews.jsp','添加信息',600,387);
          }
//-->
</script>

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