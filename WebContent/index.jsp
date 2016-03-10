<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0041)http://www.xingguangerwai01.com/index.jsp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>服装商城</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>

<LINK rel=stylesheet 
type=text/css href="/fzsalessys/fzsalessys_files/css.css">

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
          <TD width=710 height="276" vAlign=top>
            <TABLE width="100%" height="274" border=0 cellPadding=0 cellSpacing=0>
              <TBODY>
              <TR>
                <TD height=27 background=fzsalessys_files/title_bg.jpg>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
                    <TBODY>
                    <TR>
                      <TD width=20 height="28">
                        <DIV align=center><IMG src="fzsalessys_files/icon01.jpg" 
                        width=9 height=26></DIV></TD>
                      <TD class=green_title01>商城资讯</TD>
                      <TD width=50>
                      <DIV align=center><A 
                        href="nmore.jsp"><IMG 
                        border=0 src="fzsalessys_files/more.jpg" width=46 
                        height=26></A></DIV></TD></TR></TBODY></TABLE></TD></TR>
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
                            <TD bgColor=#ffffff>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="100%">
                                <TBODY>
                                <TR>
                                <TD width=300>
                                <TABLE border=0 cellSpacing=5 cellPadding=0 
                                width=300>
                                <TBODY>
                                <TR>
                                <TD id=infoarea height=198 vAlign="middle" align="center">
                                
                                <%=new CommDAO().DynamicImage("",6,285,197) %>
                                
                                </TD></TR></TBODY></TABLE></TD>
                                <TD vAlign=top>
                                <TABLE border=0 cellSpacing=5 cellPadding=0 
                                width="100%">
                                <TBODY> 
                                <TR>
                                <TD vAlign=top>
                                <TABLE id=standard border=0 cellSpacing=0 
                                cellPadding=0 width="100%">
                                <TBODY>
                              
                              
                              
                              <%
                              List<HashMap> newslist = new CommDAO().select("select * from news where infotype='新闻' order by id desc",1,8);
                             int i=0;
                              for(HashMap m:newslist){
                              i++;
                               %>
                                <TR>
                                <TD height=25 vAlign=center width="3%" 
                                align=left><IMG src="fzsalessys_files/icon02.jpg" 
                                width=4 height=7></TD>
                                <TD vAlign=center width="68%" align=left>
                                <A href="nxiang.jsp?id=<%=m.get("id") %>">
                                <%=Info.subStr(m.get("title").toString(),21)  %></A> </TD>
                                <TD vAlign=center width="29%" 
                                align=left><%=m.get("savetime") %></TD></TR>
                             
                                <TR align=left>
                                <TD height=1 
                                background=fzsalessys_files/xjnews_11.gif 
                                colSpan=3></TD></TR> 
                                
                                <% }%>
                                
                                
                                
                                
                                 </TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
          <TD width=5></TD>
          <TD vAlign=top width=275>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
              <TBODY>
              <TR>
                <TD height=28>
                  <TABLE border=0 cellSpacing=1 cellPadding=0 width="100%" 
                  bgColor=#dddddd>
                    <TBODY>
                    <TR>
                      <TD bgColor=#ffffff height=26 
                      background=fzsalessys_files/title_01_bg.jpg>
                        <TABLE border=0 cellSpacing=0 cellPadding=0 
width="100%">
                          <TBODY>
                          <TR>
                            <TD width=20>
                              <DIV align=center><IMG 
                              src="fzsalessys_files/icon01.jpg" width=9 
                              height=26></DIV></TD>
                            <TD class=green_title01>商城公告</TD>
                            <TD width=50>&nbsp;</TD>
                          </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
                    <TBODY>
                    <TR>
                      <TD height=5></TD></TR>
                    <TR>
                      <TD>
                        <TABLE width="100%" height="237" border=0 cellPadding=0 cellSpacing=1 
                        bgColor=#dddddd>
                          <TBODY>
                          <TR>
                            <TD bgColor=#ffffff height=230 vAlign=top>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="100%">
                                <TBODY>
                                <TR>
                                <TD>
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width="100%">
                                <TBODY>
                                <TR>
                                <TD vAlign=top>
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width="96%" align=center>
                                <TBODY>
                                <TR style="heiht: 0px">
                                <TD width="100%"></TD></TR>
                                <TR>
                                <TD>
                                <TABLE id=product border=0 cellSpacing=0 
                                cellPadding=0 width="100%">
                                <TBODY>
                                <TR>
                                <TD><A 
                                href="http://www.xingguangerwai01.com/news_info.jsp?id=624" 
                                target=_self ?><IMG title=2012暑假班课程安排 border=0 
                                src="fzsalessys_files/xingguangerwai01_com.htm" 
                                width=1 height=1></A></TD></TR>
                                <TR>
                                <TD>
                                
                                
                                <%=new CommDAO().getmap("4","news").get("content") %>
                                
                                
                                </TD>
                                </TR>
                              
                              
                              
                              
                              </TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
                                 </TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=990 align=center>
  <TBODY>
  <TR>
    <TD vAlign=top>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
        <TR >
          <TD  background=fzsalessys_files/all.jpg>
          
          
          
          
           <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
                    <TBODY>
                    <TR>
                      <TD width=20 height="28" >
                      <DIV align=center><IMG src="fzsalessys_files/icon01.jpg" 
                        width=9 height=26></DIV></TD>
                      <TD class=green_title01>最新商品</TD>
                      <TD width=50>
                      <DIV align=center><A 
                        href="pmore.jsp"><IMG 
                        border=0 src="fzsalessys_files/more.jpg" width=46 
                        height=26></A></DIV></TD></TR></TBODY></TABLE>
          
          
          
          
          </TD></TR>
        <TR>
          <TD vAlign=top>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
              <TBODY>
              <TR>
                <TD height=5></TD></TR>
              <TR>
                <TD vAlign=top>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
                    <TBODY>
                    <TR>  
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    <%
                    int j=0;
                    for(HashMap m:new CommDAO().select("select * from pros where status='上架' order by id desc",1,9))
                    {
                    j++;
                     %>
                      <TD vAlign=top width=33%>
                        <TABLE border=0 cellSpacing=0 cellPadding=0 
width="100%">
                          <TBODY>
                          <TR>
                            <TD vAlign=top>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="100%">
                                <TBODY>
                                <TR>
                                <TD vAlign=top>
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width="100%">
                                <TBODY>
                               
                                <TR>
                                <TD vAlign=top  >
                                <TABLE id=standard border=0 cellSpacing=1 
                                cellPadding=0 width="100%" bgColor=#dddddd>
                                <TBODY>
                                <TR>
                                <TD height=24 colspan="2" 
                                align=left vAlign=center bgColor=#f7f7f7>
                                <DIV align=center style=" color:orange"><strong>
                                
                                <a href="pxiang.jsp?id=<%=m.get("id") %>"><font color="orange"><%=m.get("proname") %></font></a>
                                
                                </strong></DIV>
                                <DIV align=center></DIV></TD>
                                </TR>
                                <TR>
                                <TD 
                                width="33%" rowspan="4" align=center vAlign=center bgColor=#ffffff>
                                
                                <img src="upfile/<%=m.get("filename") %>" width="93" height="93" />                                </TD>
                                <TD width="67%" height="26" 
                                align=left vAlign=center bgColor=#ffffff>&nbsp;价格 : <%=m.get("price") %></TD>
                                </TR>
                                <TR>
                                <TD width="67%" height="26" 
                                align=left vAlign=center bgColor=#ffffff>&nbsp;折扣 : <%=m.get("discount").equals("")?"不打折":(m.get("discount")+" 折" )%></TD>
                                </TR>
                                <TR>
                                <TD width="67%" height="26" 
                                align=left vAlign=center bgColor=#ffffff>&nbsp;所属商铺 : <%=m.get("proshop") %></TD>
                                </TR>
                                <TR>
                                <TD width="67%" height="26" 
                                align=left vAlign=center bgColor=#ffffff>&nbsp;上架时间 : <%=m.get("savetime") %></TD>
                                </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
                      
                      <%
                      if(j%3!=0){
                       %>
                      <TD width=10></TD>
                      <%}else{ %>
                      
                      </tr>
                      
                      <tr><td height="3"></td></tr>
                      
                      <tr>
                      
                      <%} %>
                      
                       <%} %>
                      
                      
                      
                       
                      
                      
                      
                      
                      
                      
                      </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=990 align=center>
  <TBODY>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=990 align=center>
  <TBODY>
    <TR>
      <TD vAlign=top><TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
          <TR >
            <TD  background=fzsalessys_files/all.jpg><TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
              <TBODY>
                <TR>
                  <TD width=20 height="28" ><DIV align=center><IMG src="fzsalessys_files/icon01.jpg" 
                        width=9 height=26></DIV></TD>
                  <TD class=green_title01>最新加盟商铺</TD>
                  <TD width=50><DIV align=center><A 
                        href="smore.jsp"><IMG 
                        border=0 src="fzsalessys_files/more.jpg" width=46 
                        height=26></A></DIV></TD>
                </TR>
              </TBODY>
            </TABLE></TD>
          </TR>
          <TR>
            <TD vAlign=top><TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
              <TBODY>
                <TR>
                  <TD height=5></TD>
                </TR>
                <TR>
                  <TD vAlign=top><TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
                    <TBODY>
                      <TR>
                        <% 
                    int jj=0;
                    for(HashMap m:new CommDAO().select("select * from sysuser where utype='卖家' order by id desc",1,6))
                    {
                    jj++;
                     %>
                        <TD vAlign=top width=33%><TABLE border=0 cellSpacing=0 cellPadding=0 
width="100%">
                          <TBODY>
                            <TR>
                              <TD vAlign=top><TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="100%">
                                <TBODY>
                                  <TR>
                                    <TD vAlign=top><TABLE border=0 cellSpacing=0 cellPadding=0 
                                width="100%">
                                      <TBODY>
                                        <TR>
                                          <TD vAlign=top  ><TABLE id=standard2 border=0 cellSpacing=1 
                                cellPadding=0 width="100%" bgColor=#dddddd>
                                            <TBODY>
                                              <TR>
                                                <TD height=24 colspan="2" 
                                align=left vAlign=center bgColor=#f7f7f7><DIV align=center style=" color:orange"><strong>
                                
                                <a href="sindex.jsp?id=<%=m.get("id") %>"><font color="orange"><%=m.get("tname") %></font></a>
                                
                                </strong></DIV>
                                                                  <DIV align=center></DIV></TD>
                                              </TR>
                                              <TR>
                                                <TD 
                                width="33%" rowspan="3" align=center vAlign=center bgColor=#ffffff><img src="upfile/<%=m.get("filename") %>" width="93" height="93" /> </TD>
                                                <TD width="67%" height="26" 
                                align=left vAlign=center bgColor=#ffffff>&nbsp;店主 : <%=m.get("uname") %> </TD>
                                              </TR>
                                              <TR>
                                                <TD width="67%" height="52" style="padding:2px" 
                                align=left vAlign=top bgColor=#ffffff>&nbsp; <%=Info.subStr(m.get("bei").toString(),52)  %>&nbsp;</TD>
                                              </TR>
                                              
                                              <TR>
                                                <TD width="67%" height="26" 
                                align=left vAlign=center bgColor=#ffffff>&nbsp;加盟时间 : <%=m.get("savetime") %></TD>
                                              </TR>
                                            </TBODY>
                                          </TABLE></TD>
                                        </TR>
                                      </TBODY>
                                    </TABLE></TD>
                                  </TR>
                                </TBODY>
                              </TABLE></TD>
                            </TR>
                          </TBODY>
                        </TABLE></TD>
                        <%
                      if(jj%3!=0){
                       %>
                        <TD width=10></TD>
                        <%}else{ %>
                      </tr>
                      <tr>
                        <td height="3"></td>
                      </tr>
                      <tr>
                        <%} %>
                        <%} %>
                      </TR>
                    </TBODY>
                  </TABLE></TD>
                </TR>
              </TBODY>
            </TABLE></TD>
          </TR>
        </TBODY>
      </TABLE>
      </TD>
    </TR>
  </TBODY>
</TABLE>
<jsp:include page="foot.jsp"></jsp:include>
      
      
</BODY></HTML>

