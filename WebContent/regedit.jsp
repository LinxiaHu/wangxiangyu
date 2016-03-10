<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0041)http://www.xingguangerwai01.com/index.jsp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>服装商城</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>

<LINK rel=stylesheet 
type=text/css href="/fzsalessys/fzsalessys_files/css.css">
<%
String id = request.getParameter("id");
HashMap map = new CommDAO().getmap("3","news");
 %>
 
 <%
 if(new CommDAO().select("select * from sysuser where uname='"+request.getParameter("uname")+"'").size()==0)
 {
  HashMap ext = new HashMap();
  ext.put("savetime",Info.getDateStr());
  new CommDAO().insert(request,response,"sysuser",ext,true,false);
  }else{
   %>
   <script type="text/javascript">
   alert("用户名已存在");
   </script>
   <%} %>
 
<META name=GENERATOR content="MSHTML 8.00.6001.19258"></HEAD>
<BODY>
 
 <jsp:include page="top.jsp"></jsp:include>
 
<TABLE border=0 cellSpacing=0 cellPadding=0 width=990 align=center>
  <TBODY>
  <TR>
    <TD vAlign=top>
      <TABLE width="100%" height="276" border=0 cellPadding=0 cellSpacing=0>
        <TBODY>
        <TR>
          <TD width=100% height="276" vAlign=top>
            <TABLE width="100%" height="274" border=0 cellPadding=0 cellSpacing=0>
              <TBODY>
              <TR>
                <TD height=27 background=fzsalessys_files/tn.jpg>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
                    <TBODY>
                    <TR>
                      <TD width=20 height="28">
                        <DIV align=center><IMG src="fzsalessys_files/icon01.jpg" 
                        width=9 height=26></DIV></TD>
                      <TD class=green_title01>会员注册 </TD>
                      <TD width=50>
                      <DIV align=center></DIV></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD height="238" vAlign=top>
                  <TABLE width="100%" height="238" border=0 cellPadding=0 cellSpacing=0>
                    <TBODY>
                    <TR>
                      <TD height=5></TD>
                    </TR>
                    <TR>
                      <TD height="233">
                        <TABLE width="100%" height="237" border=0 cellPadding=0 cellSpacing=1 
                        bgColor=#dddddd>
                          <TBODY>
                          <TR>
                            <TD valign="top" bgColor=#ffffff>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="100%">
                                <TBODY>
                                <TR>
                                <TD vAlign=top>
                                
                                
                                
                                
                                
                                
                                
                                <form action="regedit.jsp?f=f" name="f1" method="post" >
                                <TABLE border=0 cellSpacing=5 cellPadding=0 
                                width="100%">
                                <TBODY>
                                <TR>
                                <TD vAlign=top>
                                <TABLE id=standard border=0 cellSpacing=0 
                                cellPadding=0 width="100%">
                                <TBODY>
                              
                              
                              
                               
                                <TR>
                             
                                <TD width="168" height="30" align=center vAlign=center>类别</TD>
                                <TD width="512" height="30" align=left vAlign=center>
                                &nbsp;
                                <input name="utype" type="radio" id="sex2" value="卖家" checked>
                                &nbsp;
                                卖家 
                                &nbsp;
                                  <input type="radio" name="utype" id="sex3" value="买家">
                                  &nbsp;
                                  买家
                                  
                                  
                                  </TD>
                                <TD width="296" rowspan="8" align=center vAlign=center><%=Info.getImgUpInfo(95) %></TD>
                                </TR>
                                
                                
                                  <TR align=center  >
                                <TD height=1 
                                colSpan=2 
                                background=fzsalessys_files/xjnews_11.gif></TD>
                                <TD width="1" height=1 
                                background=fzsalessys_files/xjnews_11.gif></TD>
                                <TD width="1" height=1 
                                background=fzsalessys_files/xjnews_11.gif></TD>
                                </TR> 
                                
                                
                                
                                <TR>
                                  <TD height="30" align=center vAlign=center>用户名</TD>
                                  <TD height="30" align=left vAlign=center><span class="style1">
                                    <input name="uname" id="uname"  type="text" size="20"  maxlength="20" />
                                  </span></TD>
                                </TR>
                             
                                
                                <TR align=center  >
                                <TD height=1 
                                colSpan=2 
                                background=fzsalessys_files/xjnews_11.gif></TD>
                                <TD width="1" height=1 
                                background=fzsalessys_files/xjnews_11.gif></TD>
                                <TD width="1" height=1 
                                background=fzsalessys_files/xjnews_11.gif></TD>
                                </TR> 
                                
                                
                                
                                <TR>
                             
                                <TD width="168" height="30" align=center vAlign=center>登录密码</TD>
                                <TD height="30" align=left vAlign=center><span class="style1">
                                  <input name="upass" id="upass"  type="text" size="20" maxlength="20"  />
                                </span></TD>
                                </TR>
                             
                                
                                <TR align=center  >
                                <TD height=1 
                                colSpan=2 
                                background=fzsalessys_files/xjnews_11.gif></TD>
                                <TD height=1 
                                background=fzsalessys_files/xjnews_11.gif></TD>
                                <TD height=1 
                                background=fzsalessys_files/xjnews_11.gif></TD>
                                </TR> 
                                
                                
                                <TR>
                             
                                <TD width="168" height="30" align=center vAlign=center>姓名 / 店名</TD>
                                <TD height="30" align=left vAlign=center><span class="style1">
                                  <input name="tname" id="tname"  type="text" size="20" maxlength="20"  />
                                </span></TD>
                                </TR>
                             
                                
                                <TR align=center  >
                                <TD height=1 
                                colSpan=2 
                                background=fzsalessys_files/xjnews_11.gif></TD>
                                <TD height=1 
                                background=fzsalessys_files/xjnews_11.gif></TD>
                                <TD height=1 
                                background=fzsalessys_files/xjnews_11.gif></TD>
                                </TR> 
                                
                                
                                
                                <TR>
                             
                                <TD width="168" height="30" align=center vAlign=center>性别</TD>
                                <TD height="30" align=left colspan="2" vAlign=center><input name="sex" type="radio" id="sex" value="男" checked>
男
  <input type="radio" name="sex" id="sex" value="女">
女 </TD>
                                </TR>
                             
                                
                                <TR align=center  >
                                <TD height=1 
                                colSpan=5 
                                background=fzsalessys_files/xjnews_11.gif></TD></TR> 
                                
                                
                                
                                <TR>
                             
                                <TD width="168" height="30" align=center vAlign=center>年龄</TD>
                                <TD height="30" colspan="2" align=left vAlign=center><span class="style1">
                                  <input name="age" id="age"  type="text" size="10" />
                                </span></TD>
                                </TR>
                             
                                
                                <TR align=center  >
                                <TD height=1 
                                colSpan=5 
                                background=fzsalessys_files/xjnews_11.gif></TD></TR> 
                                
                                
                                
                                <TR>
                             
                                <TD width="168" height="30" align=center vAlign=center>电话</TD>
                                <TD height="30" colspan="2" align=left vAlign=center><span class="style1">
                                  <input name="tel" id="tel"  type="text" size="20" />
                                </span></TD>
                                </TR>
                             
                                
                                <TR align=center  >
                                <TD height=1 
                                colSpan=5 
                                background=fzsalessys_files/xjnews_11.gif></TD></TR> 
                                
                                
                                <TR>
                             
                                <TD width="168" height="30" align=center vAlign=center>联系地址</TD>
                                <TD height="30" colspan="2" align=left vAlign=center><span class="style1">
                                  <input name="addrs" id="addrs"  type="text" size="60" />
                                </span></TD>
                                </TR>
                             
                                
                                <TR align=center  >
                                <TD height=1 
                                colSpan=5 
                                background=fzsalessys_files/xjnews_11.gif></TD></TR> 
                                
                                
                                
                                <TR>
                             
                                <TD width="168" height="30" align=center vAlign=center>QQ</TD>
                                <TD height="30" colspan="2" align=left vAlign=center><span class="style1">
                                  <input name="qq" id="qq"  type="text" size="20" />
                                </span></TD>
                                </TR>
                             
                                
                                <TR align=center  >
                                <TD height=1 
                                colSpan=5 
                                background=fzsalessys_files/xjnews_11.gif></TD></TR> 
                                
                                
                                
                                <TR>
                             
                                <TD width="168" height="30" align=center vAlign=center>
                                 
                                说明                                 </TD>
                                <TD height="44" colspan="2" align=left vAlign=center><span class="style1">
                                  <textarea name="bei" cols="80" rows="2" id="bei"></textarea>
                                </span></TD>
                                </TR>
                             
                                
                                <TR align=left  >
                                <TD height=1 
                                background=fzsalessys_files/xjnews_11.gif 
                                colSpan=5></TD></TR> 
                                
                                
                                
                                <TR>
                             
                                <TD height="40" colspan="3" align=center vAlign=center><label>
                                  <input type="submit" name="button" id="button" value="提交信息"> &nbsp;&nbsp;&nbsp;
                                  <input type="button" name="button2" id="button2" value="重新填写">
                                </label></TD>
                              </TR>
                                 </TBODY></TABLE></TD></TR></TBODY></TABLE>
                                
                                </form>
                                
                                
                                
                                
                                
                                
                                
                                
                                </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
           
      </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<jsp:include page="foot.jsp"></jsp:include>
      
      
</BODY></HTML>

