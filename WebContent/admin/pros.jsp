<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="util.PageManager"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
 
 
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
   
   
   String xid = request.getParameter("xid")==null?"":request.getParameter("xid");
  
  if(!xid.equals(""))
  {
  dao.commOper("update pros set status='下架' where id="+xid);
  }
   
    String sid = request.getParameter("sid")==null?"":request.getParameter("sid");
  
  if(!sid.equals(""))
  {
  dao.commOper("update pros set status='上架' where id="+sid);
  }
   
   
  String did = request.getParameter("did")==null?"":request.getParameter("did");
  
  if(!did.equals(""))
  {
  dao.commOper("delete from pros where id="+did);
  }
  
  String url = "pros.jsp?1=1";
  String sql = "select * from pros  where  1=1 ";
  
  if(!Info.getUser(request).get("utype").equals("管理员"))
  {
  sql+=" and proshop = '"+Info.getUser(request).get("uname")+"' ";
  } 
  
  if(!key.equals(""))
  {
  url+="&key="+key;
  sql+=" and proname like '%"+key+"%' ";
  } 
  
  sql+=" order by id desc";
  System.out.println(sql);
  PageManager pageManager = PageManager.getPage(url, 10, request);
  pageManager.doList(sql);
  PageManager bean = (PageManager) request.getAttribute("page");
  ArrayList<HashMap> nlist = (ArrayList) bean.getCollection();
   %>
  <body>
  	<!-- cellspacing 是单元格之间的距离、cesspadding 是单元格中内容与边框的距离 -->
  	<form name="f1" method="post" action="/fzsalessys/admin/pros.jsp" >
  	<table id="mainbody" border="0" width="100%" cellspacing="1"
					class="tableform">
			<tr>
     				 <td width=5% height="31" align="center" style="font-size: 12px">相关信息&nbsp;:</td>
	    <td width=14% style="font-size: 12px" align="left"><input name="key" size="35" value="<%=key %>" type="text"></td>
				 
					<td width=20% style="font-size: 12px" align="right">
					<input type="submit" class="btn3_mouseup" value="查询"> 
					
					&nbsp;
					
					</td>
			</tr>
			</table>
  	
  	
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytab" id="table1">
<tr align="center">
          <td colspan="7"  background="/fzsalessys/admin/commfiles/images/bg.gif"
				bgcolor="#FFFFFF" class="STYLE3">信息列表</td>
        </tr>
        <tr align="center">
        <%
        if(Info.getUser(request).get("utype").equals("管理员"))
         {
         %>
        <td  class="itemtitle" > 商铺</td>
        <%} %>
          <td  class="itemtitle" > 商品名称</td>
          <td class="itemtitle"> 价格</td>
          <td class="itemtitle"> 发布时间</td>
          <td class="itemtitle"> 上架状态</td>
          <td class="itemtitle">操作</td>
  </tr>
        
         <%
 
  for(HashMap map:nlist)
  {
    %>
        <tr align="center">
         <%
        if(Info.getUser(request).get("utype").equals("管理员"))
         {
         %>
        <td  class=" " > <%=map.get("proshop").equals("")?"&nbsp;":map.get("proshop") %> </td>
        <%} %>
          <td align="center"> <%=map.get("proname").equals("")?"&nbsp;":map.get("proname") %> </td>
          <td align="center"> <%=map.get("price").equals("")?"&nbsp;":map.get("price") %>  </td>
          <td align="center"> <%=map.get("savetime").equals("")?"&nbsp;":map.get("savetime") %>  </td>
          <td align="center"> <%=map.get("status").equals("")?"&nbsp;":map.get("status") %>  </td>
          
          <td align="center">
          
          
          <a href="pros.jsp?sid=<%=map.get("id")%>">上架</a>
           
          &nbsp;|&nbsp;
          
          <a href="pros.jsp?xid=<%=map.get("id")%>">下架</a>
           
          &nbsp;|&nbsp;
          
          
          <a href="updatepros.jsp?id=<%=map.get("id")%>">修改</a>
          <script type="text/javascript">
          
          
          function update(no)
          {
          pop('/fzsalessys/admin/updatepros.jsp?id='+no,'修改商品信息',600,387);
          }
          </script>
          &nbsp;|&nbsp;
          <a href="/fzsalessys/admin/pros.jsp?did=<%=map.get("id")%>">删除</a>
          
          
          
          </td>
  </tr>
        <%} %>
        
        <tr align="center">
          <td align="right" colspan="13"><%=bean.getInfo() %></td>
        </tr>
      </table>
      </form>
</body>
</html>

<script type="text/javascript">
<!--

          function add()
          {
          pop('/fzsalessys/admin/addpros.jsp','添加商品信息',600,387);
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