<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0041)http://www.xingguangerwai01.com/index.jsp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>服装商城</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>


<%
 if(Info.getUser(request)!=null){
HashMap ext = new HashMap();
ext.put("savetime",Info.getDateStr());
ext.put("saver",Info.getUser(request).get("uname"));
new CommDAO().insert(request,response,"messages",ext,true,false);
}
 %>



<LINK rel=stylesheet 
type=text/css href="/fzsalessys/fzsalessys_files/css.css">

<META name=GENERATOR content="MSHTML 8.00.6001.19258"></HEAD>
<BODY>
 
 <jsp:include page="top.jsp"></jsp:include>
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
                      <TD class=green_title01>健康检测</TD>
                      <TD width=50>
                      <DIV align=center><A 
                        href="pmore.jsp"><br></A></DIV></TD></TR></TBODY></TABLE>
          
          
          
          
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
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                      
                    <%
                    
                   CommDAO dao = new CommDAO();
   String key = request.getParameter("key")==null?"":request.getParameter("key");
  
  String url = "cjjl.jsp?1=1";
  String sql = "select * from jktms  where  1=1 ";
   
  sql+=" order by id desc";
  System.out.println(sql);
  PageManager pageManager = PageManager.getPage(url, 35, request);
  pageManager.doList(sql);
  PageManager bean = (PageManager) request.getAttribute("page");
  ArrayList<HashMap> nlist = (ArrayList) bean.getCollection();
  int j = 0;
                    for(HashMap mmm:nlist)
                    {
                   j++;
                     %>
                    <TBODY>
                    <TR>  
                     
                    
                    
                      <TD vAlign=top width= >
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
                               
                                <TD width="89%" height="26" 
                                align=left vAlign=center bgColor=#ffffff>
                                
                                &nbsp;
                                
                                <%=j %> . <%=mmm.get("tname") %> 
                                 
                                
                                </TD>
                                </TR>
                                <TR>
                                <TD height="26" 
                                align=left vAlign=center bgColor=#ffffff style="color: gray"> 
                                &nbsp;
                             <%
                             for(int jj=1;jj<=5;jj++){
                             if(mmm.get("xx"+jj).equals(""))continue;
                              %>
                              <label>  <input type=radio value="<%=mmm.get("fen"+jj) %>" name="tm<%=mmm.get("tname")%>" />&nbsp;&nbsp;<%=mmm.get("xx"+jj) %>&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <%} %>
                                </TD>
                                </TR>
                                
                                </TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
                      </TR>
                      
                      
                      
                      <tr>
                      <td align="center" colspan="6" height="5" valign="middle"></td>
                      </tr>
                      </TBODY>
                    
                    <%}%>
                    
                    
                    <tr style="display: none" id="jg">
                      <td align="center" colspan="6" height="3" valign="middle">
                      <%
                       HashMap map = new CommDAO().getmap("18","news");
                       %>
                                                         您的检测得分为 : <font color=red id="jgfen"></font>
                       
                      <%=map.get("content") %>
                      
                      </td>
                      </tr>
                    
                    
                     <tr>
                      <td align="center" colspan="6" height="3" valign="middle">
                      
                      <input type=button onclick="showjg();" value="查看检测结果" />
                      <script type="text/javascript">
                      function showjg()
                      {
                      document.getElementById("jg").style.display="";
                      var jgfen = document.getElementById("jgfen");
                      var total = 0;
                      var radios = document.getElementsByTagName("input");
                      for(var i=0;i<radios.length;i++)
                      { 
                      if(radios[i].type=="radio")
                      {
                      if(radios[i].checked)
                      {
                      total+=Number(radios[i].value);
                      }
                      }
                      }
                      jgfen.innerHTML = total;
                      }
                      </script>
                      </td>
                      </tr>
                      
                      <tr>
                      <td align="center" colspan="6" height="6" valign="middle"  > </td>
                      </tr>
                    
                    
                    
                    
                      
                      
                      
                      
                    </TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
 <jsp:include page="foot.jsp"></jsp:include>
      
      
</BODY></HTML>

