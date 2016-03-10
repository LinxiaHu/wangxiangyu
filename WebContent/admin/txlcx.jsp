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
  
  <body>
  	<!-- cellspacing 是单元格之间的距离、cesspadding 是单元格中内容与边框的距离 -->
  	<form name="f1" method="post"  action="txlcx.jsp"  >
  	<table id="mainbody" border="0" width="100%" cellspacing="1"
					class="tableform">
			<tr>
     				 <td colspan=6 height="31" align="left" style="font-size: 12px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%
 HashMap mmm = new HashMap();%> 
&nbsp;&nbsp;姓名 &nbsp;:&nbsp; <input type=text class=''  size=15 name='xingming' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;保存时间 &nbsp;:&nbsp; <input type=text class=''  size=12 name='startsavetime' onclick='WdatePicker();' />&nbsp;&nbsp;至&nbsp;&nbsp;<input type=text class=''  size=12 name='endsavetime' onclick='WdatePicker();' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit class='btn3_mouseup' value='查询信息' /> &nbsp;&nbsp;<input type=button   class='btn3_mouseup'  value='添加信息' onclick="add();" /> &nbsp;&nbsp;</td>
	    </tr>
			</table>
  	
  	
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytab" id="table1">
<tr align="center">
          <td  backgroundfzsalessysket/admin/commfiles/images/bg.gif"
				bgcolor="#FFFFFF" class="STYLE3" colspan="10">信息列表</td>
        </tr>
        <tr align="center">
          <td  class="itemtitle" >姓名</td>
<td  class="itemtitle" >联系方式</td>
<td  class="itemtitle" >地址</td>
<td  class="itemtitle" >公司</td>
<td  class="itemtitle" >保存时间</td>
<td  class="itemtitle" >操作</td>
    </tr>
        
     
        <% 
String pxingming = request.getParameter("xingming")==null?"":request.getParameter("xingming"); 
String startxingming = request.getParameter("startxingming")==null?"":request.getParameter("startxingming"); 
String endxingming = request.getParameter("endxingming")==null?"":request.getParameter("endxingming"); 
String psavetime = request.getParameter("savetime")==null?"":request.getParameter("savetime"); 
String startsavetime = request.getParameter("startsavetime")==null?"":request.getParameter("startsavetime"); 
String endsavetime = request.getParameter("endsavetime")==null?"":request.getParameter("endsavetime"); 
new CommDAO().delete(request,"txl"); 
if(request.getParameter("xingmingid1")!=null){ 
 new CommDAO().commOper("update txl set xingming ='' where id="+request.getParameter("xingmingid1"));  
} 
if(request.getParameter("xingmingid2")!=null){ 
 new CommDAO().commOper("update txl set xingming ='' where id="+request.getParameter("xingmingid2"));  
} 
String sql = "select * from txl where 1=1 " ;
 if(!pxingming.equals("")){ 
 sql+= " and xingming like'%"+pxingming+"%' " ;
 }  
 if(!startxingming.equals("")){  
 mmm.put("startxingming",startxingming) ;
 sql+= " and xingming >'"+startxingming+"' " ;
 }  
 if(!endxingming.equals("")){  
 mmm.put("endxingming",endxingming) ;
 sql+= " and xingming <'"+Info.getDay(endxingming,1)+"' " ;
 }  
 if(!psavetime.equals("")){ 
 sql+= " and savetime like'%"+psavetime+"%' " ;
 }  
 if(!startsavetime.equals("")){  
 mmm.put("startsavetime",startsavetime) ;
 sql+= " and savetime >'"+startsavetime+"' " ;
 }  
 if(!endsavetime.equals("")){  
 mmm.put("endsavetime",endsavetime) ;
 sql+= " and savetime <'"+Info.getDay(endsavetime,1)+"' " ;
 }  
  sql +=" order by id desc ";
String url = "txlcx.jsp?1=1&xingming="+pxingming+"&savetime="+psavetime+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr align="center">

          <td align="center"><%=map.get("xingming")%></td>
          <td align="center"><%=map.get("lianxifangshi")%></td>
          <td align="center"><%=map.get("dizhi")%></td>
          <td align="center"><%=map.get("gongsi")%></td>
          <td align="center"><%=map.get("savetime")%></td>
          <td align="center"><a href="javascript:update('<%=map.get("id")%>')">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="txlcx.jsp?scid=<%=map.get("id")%>">删除</a></td>
</tr>
<%}%>
        
        
        <tr align="center">
          <td colspan=6 align="right" colspan="5">${page.info}</td>
        </tr>
      </table>
  </form>
</body>
</html>
 <% 
mmm.put("xingming",pxingming); 
mmm.put("savetime",psavetime); 
%>
fzsalessys.tform(mmm)%> 
<script language=javascript src='/emarket/js/My97DatePicker/Wdafzsalessysr.js'></script>
<script language=javascript src='/emarket/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('txlxg.jsp?id='+no,'信息修改',500,280) 
}
</script> 
<script language=javascript> 
function add(){ 
pop('txltj.jsp','信息添加',500,280) 
}
</script> 
<%@page import="util.Info"%> 
