<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="/fzsalessys/admin/commfiles/css/common.css" /> 
	<link rel="stylesheet" type="text/css" href="/fzsalessys/admin/commfiles/css/style.css" /> 
	
  </head>
  
  <% 
HashMap ext = new HashMap(); 
new CommDAO().insert(request,response,"txl",ext,true,true); 
%>
<body>
  <form name="f1" method="post"  action="txltj.jsp?f=f"   >
  	<!-- cellspacing 是单元格之间的距离、cesspadding 是单元格中内容与边框的距离 -->
  	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytab" id="table1">
        <tr align="center" style="display: ">
          <td colspan="2"  backgrounfzsalessysrket/admin/commfiles/images/bg.gif"
				bgcolor="#FFFFFF" class="STYLE3">添加信息</td>
        </tr>
        
         <tr align="center">
          <td width="23%" align="center"> 姓名</td>
          <td width="77%" align="left"> 
            <input type=text  class=''  name='xingming' size=25 />           </td>
        </tr>
<tr align="center">
          <td width="23%" align="center"> 联系方式</td>
          <td width="77%" align="left"> 
            <input type=text  class=''  name='lianxifangshi' size=25 />           </td>
        </tr>
<tr align="center">
          <td width="23%" align="center"> 地址</td>
          <td width="77%" align="left"> 
            <input type=text  class=''  name='dizhi' size=25 />           </td>
        </tr>
<tr align="center">
          <td width="23%" align="center"> 公司</td>
          <td width="77%" align="left"> 
            <label><input type=checkbox name='gongsi' value='微软' />&nbsp;微软 </label>
<label><input type=checkbox name='gongsi' value='IBM' />&nbsp;IBM </label>
<label><input type=checkbox name='gongsi' value='方正' />&nbsp;方正 </label>
<label><input type=checkbox name='gongsi' value='华为' />&nbsp;华为 </label>
           </td>
        </tr>
<tr align="center">
          <td width="23%" align="center"> 相片</td>
          <td width="77%" align="left"> 
            <%=Info.getImgUpInfo(65)%>           </td>
        </tr>

       
        <tr align="center">
          <td colspan="2" align="center">
            <label>
              <input type="submit" name="button" id="button" value="提交信息">
            </label> &nbsp;&nbsp;
           <input type=button value='返回上页' onclick='popclose();' />               </td>
        </tr>
      </table>
  </form> 
</body>
</html>
 
<script language=javafzsalessyssrc='/emarket/js/My97DatePicker/WdatePicker.js'></script><script language=javafzsalessyssrc='/emarket/js/popup.js'></script><%@page import="util.Info"%>