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
                      <TD class=green_title01>成交记录</TD>
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
  String sql = "select * from prosorder  where   (status='已确认收货'  ) ";
   
  sql+=" order by id desc";
  System.out.println(sql);
  PageManager pageManager = PageManager.getPage(url, 5, request);
  pageManager.doList(sql);
  PageManager bean = (PageManager) request.getAttribute("page");
  ArrayList<HashMap> nlist = (ArrayList) bean.getCollection();
                    for(HashMap mmm:nlist)
                    {
                   String proinfo = "";
  int total=0;
  for(String str:mmm.get("prosinfo").toString().split(","))
  {
  proinfo+=str.split("-")[0]+"&nbsp;&nbsp;单价"+str.split("-")[1]+"&nbsp;&nbsp;"+(str.split("-")[2].equals("")?"不打折":str.split("-")[2]+"折&nbsp;&nbsp;")+"&nbsp;数量 "+str.split("-")[4]+"&nbsp;&nbsp;"+"<br />";
  
  int ft = 0;
  ft=Integer.parseInt(str.split("-")[1])*Integer.parseInt(str.split("-")[4]);
  if(!str.split("-")[2].equals(""))
  {
  ft = (Integer.parseInt(str.split("-")[2])*ft)/10;
  }
   total+=ft;
  }
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
                                
                                买家 : <%=mmm.get("uname") %> 
                                
                                &nbsp;
                                
                                卖家 : <%=mmm.get("toshop") %> 
                                
                                 &nbsp;
                                
                               交易金额 : <%=total %>  
                                
                                &nbsp;
                                
                               成交时间 : <%=mmm.get("savetime") %>  
                                
                                
                                </TD>
                                </TR>
                                <TR>
                                <TD height="26" 
                                align=left vAlign=center bgColor=#ffffff style="color: gray"> 
                                &nbsp;
                                相关商品 : <%=proinfo %> 
                                
                                </TD>
                                </TR>
                                
                                </TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
                      </TR>
                      
                      
                      
                      <tr>
                      <td align="center" colspan="6" height="5" valign="middle"></td>
                      </tr>
                      </TBODY>
                    
                    <%}%>
                    
                    
                     <tr>
                      <td align="center" colspan="6" height="3" valign="middle">${page.info }</td>
                      </tr>
                      
                      <tr>
                      <td align="center" colspan="6" height="6" valign="middle"  > </td>
                      </tr>
                    
                    
                    
                    
                      
                      
                      
                      
                    </TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
 <jsp:include page="foot.jsp"></jsp:include>
      
      
</BODY></HTML>

