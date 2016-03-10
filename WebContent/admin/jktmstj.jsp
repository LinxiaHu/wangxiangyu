<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
String tglparentid=request.getParameter("tglparentid")==null?"":request.getParameter("tglparentid"); 
ext.put("tglparentid",tglparentid); 
new CommDAO().insert(request,response,"jktms",ext,true,true); 
%>
<body>
  <form name="f1" method="post"  action="jktmstj.jsp?f=f&tglparentid=<%=tglparentid%>"   onsubmit="return checkform()"  >
  	<!-- cellspacing 是单元格之间的距离、cesspadding 是单元格中内容与边框的距离 -->
  	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytab" id="table1">
        <tr align="center" style="display: ">
          <td colspan="2"  background="/fzsalessys/admin/commfiles/images/bg.gif"
				bgcolor="#FFFFFF" class="STYLE3">添加测试题目</td>
        </tr>
        
         <tr align="center">
          <td width="23%" align="center"> 题目名称</td>
          <td width="77%" align="left"> 
            <input type=text  class='' id='tname' name='tname' size=35 /><label id='clabeltname' />           </td>
        </tr>
<tr align="center">
          <td width="23%" align="center"> 选项一</td>
          <td width="77%" align="left"> 
            <input type=text  class='' id='xx1' name='xx1' size=35 /><label id='clabelxx1' />            分值
            <input type=text size='8' class=''  id='fen1'  name='fen1'  onKeyUp='clearNoNum(this);' onBlur='clearNoNum(this);' onMouseUp='clearNoNum(this);'    /></td>
        </tr>
<tr align="center">
          <td width="23%" align="center">选项二</td>
  <td width="77%" align="left"><label id='clabelfen1' />           <input type=text  class='' id='xx2' name='xx2' size=35 />
    分值
    <input type=text size='8' class=''  id='fen2'  name='fen2'  onKeyUp='clearNoNum(this);' onBlur='clearNoNum(this);' onMouseUp='clearNoNum(this);'    /></td>
        </tr>
<tr align="center">
          <td width="23%" align="center">选项三</td>
          <td width="77%" align="left"><label id='clabelxx2' />           <input type=text  class='' id='xx3' name='xx3' size=35 />
          分值
          <input type=text size='8' class=''  id='fen3'  name='fen3'  onKeyUp='clearNoNum(this);' onBlur='clearNoNum(this);' onMouseUp='clearNoNum(this);'    /></td>
        </tr>
<tr align="center">
          <td width="23%" align="center">选项四</td>
          <td width="77%" align="left"><label id='clabelfen2' />           <input type=text  class='' id='xx4' name='xx4' size=35 />
          分值
          <input type=text size='8' class=''  id='fen4'  name='fen4'  onKeyUp='clearNoNum(this);' onBlur='clearNoNum(this);' onMouseUp='clearNoNum(this);'    /></td>
        </tr>
<tr align="center">
          <td width="23%" align="center">选项五</td>
          <td width="77%" align="left"><label id='clabelxx3' />           <input type=text  class='' id='xx5' name='xx5' size=35 />
          分值
          <input type=text size='8' class=''  id='fen5'  name='fen5'  onKeyUp='clearNoNum(this);' onBlur='clearNoNum(this);' onMouseUp='clearNoNum(this);'    /></td>
        </tr>

       
        <tr align="center">
          <td colspan="2" align="center" height="28">
            <label>
              <input type="submit" name="button" id="button" value="提交信息">
            </label> &nbsp;&nbsp;
           <input type=button value='返回上页' onclick='popclose();' />               </td>
        </tr>
      </table>
</form> 
</body>
</html>
 
<script language=javascript src='/fzsalessys/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/fzsalessys/js/popup.js'></script>
<script language=javascript src='/fzsalessys/js/ajax.js'></script>
<%@page import="util.Info"%>
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
<script language=javascript >  
 
 function checkform(){  
var tnameobj = document.getElementById("tname");  
if(tnameobj.value==""){  
document.getElementById("clabeltname").innerHTML="&nbsp;&nbsp;<font color=red>请输入题目名称</font>";  
return false;  
}else{
document.getElementById("clabeltname").innerHTML="  ";  
}  
  
var tnameobj = document.getElementById("tname");  
if(tnameobj.value!=""){  
var ajax = new AJAX();
ajax.post("/fzsalessys/factory/checkno.jsp?table=jktms&col=tname&value="+tnameobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>") 
var msg = ajax.getValue();
if(msg.indexOf('Y')>-1){
document.getElementById("clabeltname").innerHTML="&nbsp;&nbsp;<font color=red>题目名称已存在</font>";  
return false;
}else{document.getElementById("clabeltname").innerHTML="  ";  
}  
}  
return true;   
}   
</script>  
