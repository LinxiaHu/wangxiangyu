<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0041)http://www.xingguangerwai01.com/index.jsp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>服装商城</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>

<LINK rel=stylesheet 
type=text/css href="/fzsalessys/fzsalessys_files/css.css">

<META name=GENERATOR content="MSHTML 8.00.6001.19258"></HEAD>
<BODY>
 

  
<TABLE border=0 cellSpacing=0 cellPadding=0 width=990 align=center>
  <TBODY>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE>
<SCRIPT type=text/javascript src="fzsalessys_files/boot.js" 
loadClass="Time;FormValid"></SCRIPT>
<LINK rel=stylesheet type=text/css href="fzsalessys_files/css.css">
<SCRIPT type=text/javascript 
src="fzsalessys_files/AC_RunActiveContent.js"></SCRIPT>

<TABLE border=0 cellSpacing=0 cellPadding=0 width=990 align=center>
  <TBODY>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=990 align=center>
  <TBODY>
  <TR>
    <TD>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
        <TR>
          <TD><IMG src="fzsalessys_files/link.jpg" width=990 height=28></TD></TR>
        <TR>
          <TD>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
              <TBODY>
              <TR>
                <TD height=5></TD></TR>
              <TR>
                <TD>
                  <TABLE border=0 cellSpacing=1 cellPadding=0 width="100%" 
                  bgColor=#dddddd>
                    <TBODY>
                    <TR>
                      <TD bgColor=#ffffff>
                        <TABLE border=0 cellSpacing=5 cellPadding=0 
width="100%">
                          <TBODY>
                          <TR>
                            <TD>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="100%">
                                <TBODY>
                                <TR>
                                <TD>
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width="100%" align=center>
                                <TBODY>
                                <TR style="HEIGHT: 0px">
                                <TD width="14%"></TD>
                                <TD width="14%"></TD>
                                <TD width="14%"></TD>
                                <TD width="14%"></TD>
                                <TD width="14%"></TD>
                                <TD width="14%"></TD>
                                <TD width="14%"></TD></TR>
                                <TR align="center">
                               
                               
                               
                               
                               
                               
                               
                               
                               <%
                               List<HashMap> list = new CommDAO().select("select * from yqlj order by id desc");
                               for(HashMap m:list){
                                %>
                               
                                <TD  height="40">
                                <A href="<%=m.get("ljurl") %>" target=_blank>
                                <IMG title="" border=0 src="upfile/<%=m.get("filename") %>"  width=103 height=39></A>
                                </TD>
                                
                                   <%} %>
                                
                                </TR>
                                <TR align="center">
                                
                                <%
                              for(HashMap m:list){
                                %>
                                  <TD height="28" valign="middle"><%=m.get("ljname") %></TD>
                               
                                    <%} %>
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                </TR>
                                </TBODY></TABLE></TD></TR>
                                <TR>
                                <TD>
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width="100%" align=center>
                                <TBODY>
                                
                                
                                
                                </TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=990 align=center>
  <TBODY>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=990 align=center height=61>
  <TBODY>
  <TR>
    <TD height="40">
      <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
        <TR>
          <TD width="31%">
            <DIV align=center><A href="http://wuhan.cyberpolice.cn/ga/"><IMG 
            border=0 src="fzsalessys_files/i.jpg" width=53 height=43></A>
             
             <NOSCRIPT><A href="http://www.51.la/?5140112" target=_blank><IMG 
            style="BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; BORDER-TOP: medium none; BORDER-RIGHT: medium none" 
            alt=我要啦免费统计 src="fzsalessys_files/go.htm"></A></NOSCRIPT> </DIV></TD>
          <TD width="69%">Copyright All Rights Reserved. 
            版权所有&nbsp;&nbsp;&nbsp;翻版必究<A href="http://www.baidu.com/" 
            target=_blank></A> </TD>
        </TR></TBODY></TABLE></TD></TR></TBODY></TABLE><!--<script type='text/javascript' src='http://chat.53kf.com/kf.php?arg=xingguangerwai&style=1'></script>-->
</BODY></HTML>

