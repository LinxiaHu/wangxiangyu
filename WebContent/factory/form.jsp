<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.PageManager"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.Reader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.Writer"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.FileOutputStream"%>
 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="common.css" /> 
	<link rel="stylesheet" type="text/css" href="style.css" /> 
    <style type="text/css">
<!--
.STYLE5 {color: orange}
-->
    </style>
</head>
  <%
 
 String tablename = request.getParameter("optable")==null?"":request.getParameter("optable");
 String rootpath = request.getContextPath();
String path = request.getParameter("rpath")+"\\WebRoot\\";
String xls = request.getRealPath("/")+"/upfile/a.xls";
String showpath = request.getParameter("rpath")==null?"":request.getParameter("rpath");
String showtextcss = request.getParameter("textcss")==null?"":request.getParameter("textcss");
String showbuttoncss = request.getParameter("buttoncss")==null?"":request.getParameter("buttoncss");
String showtextareacss = request.getParameter("textareacss")==null?"":request.getParameter("textareacss");
  String excel = request.getParameter("excel")==null?"":request.getParameter("excel");
  
  //自动生成的页面名称
String cxpagename = tablename+"cx.jsp";
String tjpagename = tablename+"tj.jsp";
String xgpagename = tablename+"xg.jsp";

//真实的页面名称
String realpagecxname = request.getParameter("pagecxname");
String realpagetjname = request.getParameter("pagetjname");
String realpagexgname = request.getParameter("pagexgname");
 

String[] scpages = request.getParameterValues("scpages");//要生成的界面
String scpagesstr = "";
if(scpages!=null){
for(String str :scpages)
{
scpagesstr+=str+"-";
}
scpagesstr = scpagesstr.substring(0,scpagesstr.length()-1);
}




 CommDAO dao = new CommDAO();
 String tempcx = "";//查询模板
 String temptj = "";//添加模板
  String tempxg = "";//修改模板
 String cxtj = "";//查询条件
 String zdnames = request.getParameter("zdnames");//全部字段
 String ttype = request.getParameter("ttype");//全部字段
 String textcss = request.getParameter("textcss"); 
 String textareacss = request.getParameter("textareacss"); 
 String[] cxzd = request.getParameterValues("cxzd");//查询用的字段
 String[] xszd = request.getParameterValues("xszd");//显示用的字段
 String[] whzd = request.getParameterValues("whzd");//维护用的字段
 String xszdstr = "";
 
 if(xszd!=null){
 for(String str:xszd )
 {
 xszdstr+=str+"-"+request.getParameter("mc-"+str)+"@";
 }
 if(xszdstr.length()>0)xszdstr = xszdstr.substring(0,xszdstr.length()-1);
 }
 
 
 
 String sub = request.getParameter("sub")==null?"":request.getParameter("sub");
 if(!sub.equals(""))
 {
 
 //生成查询界面
 
 try{
 Reader r = new BufferedReader(new InputStreamReader(new FileInputStream("d:\\tform\\cx.jsp"),"utf-8" ));
 int temp =0;
 while((temp=r.read())!=-1)
 {
 tempcx += (char)temp;
 }
 r.close();
 
 
 String zdyname1 = request.getParameter("zdyname1")==null?"":request.getParameter("zdyname1");
 String zdyzd1 = request.getParameter("zdyzd1")==null?"":request.getParameter("zdyzd1");
 String zdyvalue1 = request.getParameter("zdyvalue1")==null?"":request.getParameter("zdyvalue1");
 String zdyname2 = request.getParameter("zdyname2")==null?"":request.getParameter("zdyname2");
 String zdyzd2 = request.getParameter("zdyzd2")==null?"":request.getParameter("zdyzd2");
 String zdyvalue2 = request.getParameter("zdyvalue2")==null?"":request.getParameter("zdyvalue2");
 
 
  String[] tempcxarr = tempcx.split("action=\"");
  tempcx = tempcxarr[0]+" action=\""+realpagecxname+"\" "+tempcxarr[1].substring(tempcxarr[1].indexOf("\"")+1);
  
  tempcxarr = tempcx.split("查询条件");
  
  String cxtjtd = tempcxarr[0].substring( tempcxarr[0].toLowerCase().lastIndexOf("<td"))+tempcxarr[1].substring(0,tempcxarr[1].toLowerCase().indexOf("</td>")+5);
  cxtjtd = cxtjtd.replaceAll("<td","<td colspan="+(xszd.length+1));
  tempcx = tempcxarr[0].substring(0,tempcxarr[0].toLowerCase().lastIndexOf("<td"))+     (cxtjtd.substring(0,cxtjtd.length()-5)+"查询条件</td>")       +tempcxarr[1].substring(tempcxarr[1].toLowerCase().indexOf("</td>")+5);
 
 String[] tempcxarrpage = tempcx.split("page.info"); 
   String cxtjtdpage = tempcxarrpage[0].substring( tempcxarrpage[0].toLowerCase().lastIndexOf("<td"))+tempcxarrpage[1].substring(0,tempcxarrpage[1].toLowerCase().indexOf("</td>")+5);
 
  cxtjtdpage = cxtjtdpage.replaceAll("<td","<td colspan="+(xszd.length+1));
  cxtjtdpage = cxtjtdpage.replaceAll("<TD","<TD colspan="+(xszd.length+1));
  tempcx = tempcxarrpage[0].substring(0,tempcxarrpage[0].toLowerCase().lastIndexOf("<td"))+     (cxtjtdpage.substring(0,cxtjtdpage.length()-6)+"page.info}</td>")       +tempcxarrpage[1].substring(tempcxarrpage[1].toLowerCase().indexOf("</td>")+5);
 
 
   
  String cxhtml = "&nbsp;&nbsp;&nbsp;";
  cxhtml+="\n<%\n HashMap mmm = new HashMap();%"+"> \n";
  for(String str:cxzd)
  {
  String xsname = request.getParameter("mc-"+str);
   String cxtype =  request.getParameter("cxtype-"+str);
  String cxshuju =  request.getParameter("cxshuju-"+str);
  String cxglb =  request.getParameter("cxglb-"+str);
  String cxglzd =  request.getParameter("cxglzd-"+str);
  
  if(cxtype.equals("输入框")){
  cxhtml+="&nbsp;&nbsp;"+xsname+" &nbsp;:&nbsp; "+"<input type=text class='"+textcss+"'  size=15 name='"+str+"' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
  }
  
  if(cxtype.equals("日期框")){
  cxhtml+="&nbsp;&nbsp;"+xsname+" &nbsp;:&nbsp; ";
  cxhtml+="<input type=text class='"+textcss+"'  size=12 name='start"+str+"' onclick='WdatePicker();' />&nbsp;&nbsp;至&nbsp;&nbsp;";
  cxhtml+="<input type=text class='"+textcss+"'  size=12 name='end"+str+"' onclick='WdatePicker();' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
  }
  
  if(cxtype.equals("下拉框"))
	{
	String kjstr = "&nbsp;&nbsp;";
	if(!cxshuju.equals(""))
	{
	 kjstr = "<select name='"+str+"'>\n";
	 kjstr += "<option value=\"\">不限</option>\n";
	for(String shujux:cxshuju.split("-"))
	{
	kjstr+="<option value='"+shujux+"'>"+shujux+"</option> \n";
	}
	kjstr+="</select>\n";
	}
	if(cxshuju.equals("")&&!cxglb.equals("不关联"))
	{
	kjstr = "<%=Info.getselect(\""+str+"\",\""+cxglb+"\",\""+cxglzd+"\",\"\")%"+">"; 
	}
	cxhtml+=xsname+" &nbsp;:&nbsp; "+   kjstr+  "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
  
	}
  
  }
  cxhtml+="&nbsp;&nbsp;&nbsp;<input type=submit class='"+showbuttoncss+"' value='查询信息' /> &nbsp;&nbsp;";
  
  if(scpagesstr.indexOf("pagetj")>-1){
  if(ttype.equals("跳"))
  cxhtml+="<input type=button   class='"+showbuttoncss+"' value='添加信息' onclick=\"window.location.replace('"+realpagetjname+"')\" /> &nbsp;&nbsp;";
  else
  cxhtml+="<input type=button   class='"+showbuttoncss+"'  value='添加信息' onclick=\"add();\" /> &nbsp;&nbsp;";
  }
    
    if(excel.equals("导出excel"))
	{
	cxhtml+="<input type=button value='导出excel' class='"+showbuttoncss+"'   onclick=\"window.location.replace('"+realpagecxname+"?excel=excel');\" /> &nbsp;&nbsp;\n";
	cxhtml+="<%if(request.getParameter(\"excel\")!=null){%"+"> \n";
	cxhtml+="<%List<List> excellist = new CommDAO().selectforlist(\"select * from "+tablename+" order by id desc \");%"+"> \n";
	cxhtml+="<%  Info.writeExcel(\""+tablename+"\",\""+xszdstr+"\",excellist, request,  response); %"+"> \n";
	cxhtml+="<%}%"+"> \n";
	}
    
  tempcx = tempcx.replaceAll("查询条件",cxhtml);
  
 
  
  tempcxarr = tempcx.split("信息标题");
  String bttd = tempcxarr[0].substring( tempcxarr[0].toLowerCase().lastIndexOf("<td"))+tempcxarr[1].substring(0,tempcxarr[1].toLowerCase().indexOf("</td>")+5);
  
  String tdinfo = "";
  for(String str:xszd)
  {
  //String dtd = bttd.substring(0,bttd.indexOf(">")+1)+"<%=map.get(\""+str+"\")%" +bttd.substring(bttd.indexOf(">"));
  String dtd = bttd.substring(0,bttd.indexOf(">")+1)+request.getParameter("mc-"+str) +bttd.substring(bttd.indexOf(">")+1);
  
  tdinfo+=dtd+"\n";
  }
  tdinfo+=bttd.substring(0,bttd.indexOf(">")+1)+"操作" +bttd.substring(bttd.indexOf(">")+1);;
  tempcx = tempcx.split("信息标题")[0].substring(0,tempcx.split("信息标题")[0].toLowerCase().lastIndexOf("<td"))+tdinfo+tempcx.split("信息标题")[1].substring(tempcx.split("信息标题")[1].toLowerCase().indexOf("</td>")+5);
  
   
  
  tempcxarr = tempcx.split("信息内容");
  
  String cxsqlinfo = "<% \n";
  
  for(String str:cxzd)
  {
  cxsqlinfo +="String p"+str+" = request.getParameter(\""+str+"\")==null?\"\":request.getParameter(\""+str+"\"); \n";
  cxsqlinfo +="String start"+str+" = request.getParameter(\"start"+str+"\")==null?\"\":request.getParameter(\"start"+str+"\"); \n";
  cxsqlinfo +="String end"+str+" = request.getParameter(\"end"+str+"\")==null?\"\":request.getParameter(\"end"+str+"\"); \n";
  }
  cxsqlinfo +="new CommDAO().delete(request,\""+tablename+"\"); \n";
  
  cxsqlinfo +="if(request.getParameter(\""+zdyzd1+"id1\")!=null){ \n";
  cxsqlinfo +=" new CommDAO().commOper(\"update "+tablename+" set "+zdyzd1+" ='"+zdyvalue1+"' where id=\"+request.getParameter(\""+zdyzd1+"id1\"));  \n";
  cxsqlinfo +="} \n";
  
  cxsqlinfo +="if(request.getParameter(\""+zdyzd2+"id2\")!=null){ \n";
  cxsqlinfo +=" new CommDAO().commOper(\"update "+tablename+" set "+zdyzd2+" ='"+zdyvalue2+"' where id=\"+request.getParameter(\""+zdyzd2+"id2\"));  \n";
  cxsqlinfo +="} \n";
  
  
  cxsqlinfo +="String sql = \"select * from "+tablename+" where 1=1 \" ;\n";
   for(String str:cxzd)
  {
  cxsqlinfo +=" if(!p"+str+".equals(\"\")){ \n";
  cxsqlinfo +=" sql+= \" and "+str+" like'%\"+p"+str+"+\"%' \" ;\n";
  cxsqlinfo +=" }  \n";
  
  cxsqlinfo +=" if(!start"+str+".equals(\"\")){  \n";
  cxsqlinfo +=" mmm.put(\"start"+str+"\",start"+str+") ;\n";
  cxsqlinfo +=" sql+= \" and "+str+" >'\"+start"+str+"+\"' \" ;\n";
  cxsqlinfo +=" }  \n";
  
  cxsqlinfo +=" if(!end"+str+".equals(\"\")){  \n";
  cxsqlinfo +=" mmm.put(\"end"+str+"\",end"+str+") ;\n";
  cxsqlinfo +=" sql+= \" and "+str+" <'\"+Info.getDay(end"+str+",1)+\"' \" ;\n";
  cxsqlinfo +=" }  \n";
  
  }
  
  for(String str:zdnames.split("-"))
  {
  if(str.equals("docname")||str.equals("filename")||str.equals("content"))continue;
  String ycx = request.getParameter("ycx-"+str)==null?"":request.getParameter("ycx-"+str);
  if(!ycx.equals(""))
  {
  cxsqlinfo +=" and (1!=1 ";
  for(String col:ycx.split("-"))
  {
  cxsqlinfo +=" or  "+str+" like'%"+col+"%' ";
  }
  cxsqlinfo +=" ) ";
  }
  }
  
  cxsqlinfo += "  sql +=\" order by id desc \";\n";
  cxsqlinfo +="String url = \""+realpagecxname+"?1=1";
  for(String str:cxzd)
  {
  cxsqlinfo +="&"+str+"=\"+p"+str+"+\"";
  }
  cxsqlinfo += "\"; \n";
  cxsqlinfo += "ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); \n";
  cxsqlinfo += "for(HashMap map:list){ %"+""+">\n";
  
  String bttr = tempcxarr[0].substring( tempcxarr[0].toLowerCase().lastIndexOf("<tr"))+tempcxarr[1].substring(0,tempcxarr[1].toLowerCase().indexOf("</tr>")+5);
  cxsqlinfo += bttr.substring(0,bttr.indexOf(">")+1)+"\n";
   
   int jj = 0;
  for(String str:xszd)
  {
  jj++;
  cxsqlinfo += bttr.substring(bttr.indexOf(">")).substring(0,bttr.substring(bttr.indexOf(">")).indexOf(">"));
  String totd = bttr.substring(bttr.indexOf(">")+1);
  totd = totd.substring(0,totd.indexOf(">")+1);
 if(!str.equals("filename")&&!str.equals("docname"))
  totd+="<%=map.get(\""+str+"\")%"+""+">";
 if(str.equals("filename"))
  totd+="<img src=\""+rootpath+"/upfile/<%=map.get(\""+str+"\")%"+""+">\" height=65 />";
  if(str.equals("docname"))
  totd+="<a href=\""+rootpath+"/upload?filename=<%=map.get(\""+str+"\")%"+""+">\" title='点击可以下载'><%=map.get(\""+str+"\")%"+""+"></a>";
  totd+="</td>";
  cxsqlinfo+=totd;
  if(jj == xszd.length)
  {
  cxsqlinfo += bttr.substring(bttr.indexOf(">")).substring(0,bttr.substring(bttr.indexOf(">")).indexOf(">"));
  String totdd = bttr.substring(bttr.indexOf(">")+1);
  totdd = totdd.substring(0,totdd.indexOf(">")+1);
  
  if(!zdyname1.equals("")&&!zdyvalue1.equals(""))
  {
  totdd+="<a href=\""+realpagecxname+"?value="+zdyvalue1+"&"+zdyzd1+"id1=<%=map.get(\"id\")%"+">\">"+zdyname1+"</a>&nbsp;&nbsp;|&nbsp;&nbsp;"   ;
  }
  
  if(!zdyname2.equals("")&&!zdyvalue2.equals(""))
  {
  totdd+="<a href=\""+realpagecxname+"?value="+zdyvalue2+"&"+zdyzd2+"id2=<%=map.get(\"id\")%"+">\">"+zdyname2+"</a>&nbsp;&nbsp;|&nbsp;&nbsp;"   ;
  }
  
  
  if(ttype.equals("跳")){
  if(scpagesstr.indexOf("pagexg")>-1){
  totdd+="<a href=\""+realpagexgname+"?id=<%=map.get(\"id\")%"+">\">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;"   ;
  }
  totdd+="<a href=\""+realpagecxname+"?scid=<%=map.get(\"id\")%"+">\">删除</a>"   ;
  }else{
  if(scpagesstr.indexOf("pagexg")>-1){
  totdd+="<a href=\"javascript:update('<%=map.get(\"id\")%"+">')\">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;"   ;
  }
  totdd+="<a href=\""+realpagecxname+"?scid=<%=map.get(\"id\")%"+">\">删除</a>"   ;
  }
  totdd+="</td>";
  cxsqlinfo+=totdd;
  }
  //System.out.println(bttr.substring(bttr.indexOf(">")).substring(0,bttr.substring(bttr.indexOf(">")).indexOf(">")));
  }
  cxsqlinfo+="\n</tr>\n<%}%"+""+">";
  
  String abc = tempcxarr[0].substring(0,tempcxarr[0].toLowerCase().lastIndexOf("<tr"));
   
  tempcx = abc +cxsqlinfo;
 
  abc = tempcxarr[1].substring(tempcxarr[1].toLowerCase().indexOf("</tr>")+5);
  tempcx = tempcx+abc;
  
  tempcx+="<% \n";
  for(String str:cxzd)
  {
  tempcx+="mmm.put(\""+str+"\",p"+str+"); \n";
  }
  tempcx+="%"+""+">\n<%=Info.tform(mmm)%"+""+"> \n";
  tempcx+="<script language=javascript src='"+rootpath+"/js/My97DatePicker/WdatePicker.js'></script>\n";
  tempcx+="<script language=javascript src='"+rootpath+"/js/popup.js'></script>\n";
  tempcx+="<script language=javascript> \n";
  tempcx+="function update(no){ \n";
  tempcx+="pop('"+realpagexgname+"?id='+no,'信息修改',500,280) \n";
  tempcx+="}\n";
  tempcx+="</script> \n";
  
  tempcx+="<script language=javascript> \n";
  tempcx+="function add(){ \n";
  tempcx+="pop('"+realpagetjname+"','信息添加',500,280) \n";
  tempcx+="}\n";
  tempcx+="</script> \n";
  
   tempcx+="<%@page import=\"util.Info\"%"+"> \n";
   tempcx+="<%@page import=\"java.util.ArrayList\"%"+"> \n";
   tempcx+="<%@page import=\"java.util.HashMap\"%"+"> \n";
   tempcx+="<%@page import=\"util.PageManager\"%"+"> \n";
   tempcx+="<%@page import=\"dao.CommDAO\"%"+"> \n";
  

  
 // System.out.println(tempcx);
  if(tablename!=null&&!"".equals(tablename)){
 
 if(scpagesstr.indexOf("pagecx")>-1){ 
   Writer w = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path+realpagecxname),"utf-8" ));
  w.write(tempcx);
 w.close();
 }
 
 }
 }catch(Exception e)
 {
 e.printStackTrace();
 }
 
 
 try{
  
  //生成添加界面
 
 try{
 Reader r = new BufferedReader(new InputStreamReader(new FileInputStream("d:\\tform\\tj.jsp"),"utf-8" ));
 int temp =0;
 while((temp=r.read())!=-1)
 {
 temptj += (char)temp;
 }
 r.close();
   
 }catch(Exception e)
 {
 e.printStackTrace();
 }
 
  String[] temptjarr = temptj.split("action=\"");
  temptj = temptjarr[0]+" action=\""+realpagetjname+"?f=f\" "+temptjarr[1].substring(temptjarr[1].indexOf("\"")+1);
  
 
 int zdd = temptj.indexOf("字段名");
 temptj = temptj.substring(0,zdd)+"就放在这里吧"+ temptj.substring(zdd);
 temptjarr = temptj.split("字段名");
 String tjtr = temptjarr[0].substring(temptjarr[0].toLowerCase().lastIndexOf("<tr"))+temptjarr[1].substring(0,temptjarr[1].toLowerCase().indexOf("</tr>")+5);
String tjtrs = "";



for(String str:whzd)
{
String tjtrcopy = tjtr;
String pstr = request.getParameter("mc-"+str);
String shuju = request.getParameter("shuju-"+str)==null?"":request.getParameter("shuju-"+str);
String glb = request.getParameter("glb-"+str)==null?"":request.getParameter("glb-"+str);
String glzd = request.getParameter("glzd-"+str)==null?"":request.getParameter("glzd-"+str);
tjtrcopy = tjtrcopy.replaceAll("就放在这里吧",pstr);

String optype = request.getParameter("optype-"+str)==null?"":request.getParameter("optype-"+str);



if(optype.equals("输入框"))
{
tjtrcopy = tjtrcopy.replaceAll("控件","<input type=text  class='"+textcss+"'  name='"+str+"' size=25 />");
}

if(optype.equals("下拉框"))
{
String kjstr = "";
if(!shuju.equals(""))
{
 kjstr = "<select name='"+str+"'>\n";
for(String shujux:shuju.split("-"))
{
kjstr+="<option value='"+shujux+"'>"+shujux+"</option> \n";
}
kjstr+="</select>\n";
}
if(shuju.equals("")&&!glb.equals("不关联"))
{
kjstr = "<%=Info.getselect(\""+str+"\",\""+glb+"\",\""+glzd+"\",\"\")%"+">"; 
}
tjtrcopy = tjtrcopy.replaceAll("控件",kjstr);
}




if(optype.equals("单选"))
{
String kjstr = "";
if(!shuju.equals(""))
{
 kjstr = "";
for(String shujux:shuju.split("-"))
{
kjstr+="<label><input type=radio name='"+str+"' value='"+shujux+"' />&nbsp;"+shujux+" </label>\n";
}
}
if(shuju.equals("")&&!glb.equals("不关联"))
{
kjstr = "<%=Info.getradio(\""+str+"\",\""+glb+"\",\""+glzd+"\")%"+">"; 
}
tjtrcopy = tjtrcopy.replaceAll("控件",kjstr);
}

if(optype.equals("多选"))
{
String kjstr = "";
if(!shuju.equals(""))
{
 kjstr = "";
for(String shujux:shuju.split("-"))
{
kjstr+="<label><input type=checkbox name='"+str+"' value='"+shujux+"' />&nbsp;"+shujux+" </label>\n";
}
}
if(shuju.equals("")&&!glb.equals("不关联"))
{
kjstr = "<%=Info.getcheckbox(\""+str+"\",\""+glb+"\",\""+glzd+"\")%"+">"; 
}
tjtrcopy = tjtrcopy.replaceAll("控件",kjstr);
}


if(optype.equals("大输入框"))
{
tjtrcopy = tjtrcopy.replaceAll("控件","<textarea   class='"+textareacss+"'  name='"+str+"'  ></textarea>");
}

if(optype.equals("日期框"))
{
tjtrcopy = tjtrcopy.replaceAll("控件","<input type=text size='12' class='"+textcss+"'   name='"+str+"' onclick='WdatePicker();'  />");
}

if(optype.equals("数字框"))
{
tjtrcopy = tjtrcopy.replaceAll("控件","<input type=text size='8' class='"+textcss+"'   name='"+str+"'  onkeyup='clearNoNum(this);' onblur='clearNoNum(this);' onmouseup='clearNoNum(this);'    />");
}

 


tjtrs+=tjtrcopy;
tjtrs+="\n";
}

if(zdnames.indexOf("filename")>-1)
{
String tjtrcopy = tjtr;
String pstr = request.getParameter("mc-filename");
tjtrcopy = tjtrcopy.replaceAll("就放在这里吧",pstr);
tjtrcopy = tjtrcopy.replaceAll("控件","<%=Info.getImgUpInfo(65)%"+">");
tjtrs+=tjtrcopy;
tjtrs+="\n";
}

if(zdnames.indexOf("docname")>-1)
{
String tjtrcopy = tjtr;
String pstr = request.getParameter("mc-docname");
tjtrcopy = tjtrcopy.replaceAll("就放在这里吧",pstr);
tjtrcopy = tjtrcopy.replaceAll("控件","<%=Info.getFileUpInfo()%"+">");
tjtrs+=tjtrcopy;
tjtrs+="\n";
}

if(zdnames.indexOf("content")>-1)
{
String tjtrcopy = tjtr;
String pstr = request.getParameter("mc-content");
if(pstr!=null){
tjtrcopy = tjtrcopy.replaceAll("就放在这里吧",pstr);
tjtrcopy = tjtrcopy.replaceAll("控件","<%=Info.fck(265,\"\")%"+">");
tjtrs+=tjtrcopy;
tjtrs+="\n";
}
}


temptj = temptj.replaceAll(tjtr.replaceAll("就放在这里吧","就放在这里吧字段名"),tjtrs);
String insertcode = "<% \n";
insertcode += "HashMap ext = new HashMap(); \n";

for(String str:zdnames.split("-"))
{
   if(str.equals("docname")||str.equals("filename")||str.equals("content")||str.equals("savetime"))continue;
   String mrz = request.getParameter("mrz-"+str)==null?"":request.getParameter("mrz-"+str);
   if(!mrz.equals(""))
   {
   insertcode += "ext.put(\""+str+"\",\""+mrz+"\"); \n";
   }
}

if(ttype.equals("跳"))
insertcode += "new CommDAO().insert(request,response,\""+tablename+"\",ext,true,false); \n";
else
insertcode += "new CommDAO().insert(request,response,\""+tablename+"\",ext,true,true); \n";

insertcode += "%"+""+">\n";

if(temptj.indexOf("<body>")>-1)
temptj = temptj.replaceAll("<body>",insertcode+"<body>");
else
temptj = temptj.replaceAll("<BODY>",insertcode+"<BODY>");

if(ttype.equals("跳"))
temptj = temptj.replaceAll("返回按钮","<input type=button value='返回上页' onclick='window.location.replace(\""+realpagecxname+"\")' />");
else
temptj = temptj.replaceAll("返回按钮","<input type=button value='返回上页' onclick='popclose();' />");


//这是放在最后的
temptj+="<script language=javascript src='"+rootpath+"/js/My97DatePicker/WdatePicker.js'></script>";
temptj+="<script language=javascript src='"+rootpath+"/js/popup.js'></script>";
temptj+="<%@page import=\"util.Info\"%"+""+">";
 temptj+="<%@page import=\"util.Info\"%"+"> \n";
   temptj+="<%@page import=\"java.util.ArrayList\"%"+"> \n";
   temptj+="<%@page import=\"java.util.HashMap\"%"+"> \n";
   temptj+="<%@page import=\"util.PageManager\"%"+"> \n";
   temptj+="<%@page import=\"dao.CommDAO\"%"+"> \n";
  
  if(tablename!=null&&!"".equals(tablename)){
   if(scpagesstr.indexOf("pagetj")>-1){ 
   Writer w = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path+realpagetjname),"utf-8" ));
  w.write(temptj);
 w.close();
 }
 }
 
 
 }catch(Exception e)
 {
 e.printStackTrace();
 }
 
 
 
 
 
 
 
 
 
 try{
  
  //生成修改界面
 
 try{
 Reader r = new BufferedReader(new InputStreamReader(new FileInputStream("d:\\tform\\tj.jsp"),"utf-8" ));
 int temp =0;
 while((temp=r.read())!=-1)
 {
 tempxg += (char)temp;
 }
 r.close();
   
 }catch(Exception e)
 {
 e.printStackTrace();
 }
 
  String[] tempxgarr = tempxg.split("action=\"");
  tempxg = tempxgarr[0]+" action=\""+realpagexgname+"?f=f&id=<%=mmm.get(\"id\")%"+""+">\" "+tempxgarr[1].substring(tempxgarr[1].indexOf("\"")+1);
  
 
 int zdd = tempxg.indexOf("字段名");
 tempxg = tempxg.substring(0,zdd)+"就放在这里吧"+ tempxg.substring(zdd);
 tempxgarr = tempxg.split("字段名");
 String tjtr = tempxgarr[0].substring(tempxgarr[0].toLowerCase().lastIndexOf("<tr"))+tempxgarr[1].substring(0,tempxgarr[1].toLowerCase().indexOf("</tr>")+5);
String tjtrs = "";

for(String str:whzd)
{
String tjtrcopy = tjtr;
String pstr = request.getParameter("mc-"+str);
String shuju = request.getParameter("shuju-"+str)==null?"":request.getParameter("shuju-"+str);
String glb = request.getParameter("glb-"+str)==null?"":request.getParameter("glb-"+str);
String glzd = request.getParameter("glzd-"+str)==null?"":request.getParameter("glzd-"+str);
tjtrcopy = tjtrcopy.replaceAll("就放在这里吧",pstr);

String optype = request.getParameter("optype-"+str)==null?"":request.getParameter("optype-"+str);
 
if(optype.equals("输入框"))
{
tjtrcopy = tjtrcopy.replaceAll("控件","<input type=text  class='"+textcss+"'  name='"+str+"' size=25 />");
}

if(optype.equals("下拉框"))
{
String kjstr = "";
if(!shuju.equals(""))
{
 kjstr = "<select name='"+str+"'>\n";
for(String shujux:shuju.split("-"))
{
kjstr+="<option value='"+shujux+"'>"+shujux+"</option> \n";
}
kjstr+="</select>\n";
}
if(shuju.equals("")&&!glb.equals("不关联"))
{
kjstr = "<%=Info.getselect(\""+str+"\",\""+glb+"\",\""+glzd+"\",\"\")%"+">"; 
}
tjtrcopy = tjtrcopy.replaceAll("控件",kjstr);
}




if(optype.equals("单选"))
{
String kjstr = "";
if(!shuju.equals(""))
{
 kjstr = "";
for(String shujux:shuju.split("-"))
{
kjstr+="<label><input type=radio name='"+str+"' value='"+shujux+"' />&nbsp;"+shujux+" </label>\n";
}
}
if(shuju.equals("")&&!glb.equals("不关联"))
{
kjstr = "<%=Info.getradio(\""+str+"\",\""+glb+"\",\""+glzd+"\")%"+">"; 
}
tjtrcopy = tjtrcopy.replaceAll("控件",kjstr);
}

if(optype.equals("多选"))
{
String kjstr = "";
if(!shuju.equals(""))
{
 kjstr = "";
for(String shujux:shuju.split("-"))
{
kjstr+="<label><input type=checkbox name='"+str+"' value='"+shujux+"' />&nbsp;"+shujux+" </label>\n";
}
}
if(shuju.equals("")&&!glb.equals("不关联"))
{
kjstr = "<%=Info.getcheckbox(\""+str+"\",\""+glb+"\",\""+glzd+"\")%"+">"; 
}
tjtrcopy = tjtrcopy.replaceAll("控件",kjstr);
}


if(optype.equals("大输入框"))
{
tjtrcopy = tjtrcopy.replaceAll("控件","<textarea   class='"+textareacss+"'   name='"+str+"'   ></textarea>");
}

if(optype.equals("日期框"))
{
tjtrcopy = tjtrcopy.replaceAll("控件","<input type=text size='12'   class='"+textcss+"'   name='"+str+"' onclick='WdatePicker();'  />");
}

 if(optype.equals("数字框"))
{
tjtrcopy = tjtrcopy.replaceAll("控件","<input type=text size='8' class='"+textcss+"'   name='"+str+"' onkeyup='clearNoNum(this);' onblur='clearNoNum(this);' onmouseup='clearNoNum(this);'  />");
}
 


tjtrs+=tjtrcopy;
tjtrs+="\n";
}

if(zdnames.indexOf("docname")>-1)
{
String tjtrcopy = tjtr;
String pstr = request.getParameter("mc-docname");
tjtrcopy = tjtrcopy.replaceAll("就放在这里吧",pstr);
tjtrcopy = tjtrcopy.replaceAll("控件","<%=Info.getFileUpInfo()%"+">");
tjtrs+=tjtrcopy;
tjtrs+="\n";
}

if(zdnames.indexOf("filename")>-1)
{
String tjtrcopy = tjtr;
String pstr = request.getParameter("mc-filename");
tjtrcopy = tjtrcopy.replaceAll("就放在这里吧",pstr);
tjtrcopy = tjtrcopy.replaceAll("控件","<%=Info.getImgUpInfo(65)%"+">");
tjtrs+=tjtrcopy;
tjtrs+="\n";
}

if(zdnames.indexOf("content")>-1)
{
String tjtrcopy = tjtr;
String pstr = request.getParameter("mc-content");
if(pstr!=null){
tjtrcopy = tjtrcopy.replaceAll("就放在这里吧",pstr);
tjtrcopy = tjtrcopy.replaceAll("控件","<%=Info.fck(265,mmm.get(\"content\").toString())%"+">");
tjtrs+=tjtrcopy;
tjtrs+="\n";
}
}



tempxg = tempxg.replaceAll(tjtr.replaceAll("就放在这里吧","就放在这里吧字段名"),tjtrs);
String insertcode = "<% \n";
insertcode += "String id = request.getParameter(\"id\"); \n";
insertcode += "HashMap mmm = new CommDAO().getmap(id,\""+tablename+"\"); \n";  
insertcode += "HashMap ext = new HashMap(); \n";
if(ttype.equals("跳"))
insertcode += "new CommDAO().update(request,response,\""+tablename+"\",ext,true,false); \n";
else
insertcode += "new CommDAO().update(request,response,\""+tablename+"\",ext,true,true); \n";

insertcode += "%"+""+">\n";
if(tempxg.indexOf("<body>")>-1)
tempxg = tempxg.replaceAll("<body>",insertcode+"<body>");
else
tempxg = tempxg.replaceAll("<BODY>",insertcode+"<BODY>");

if(ttype.equals("跳"))
tempxg = tempxg.replaceAll("返回按钮","<input type=button value='返回上页' onclick='window.location.replace(\""+realpagecxname+"\")' />");
else
tempxg = tempxg.replaceAll("返回按钮","<input type=button value='返回上页' onclick='popclose();' />");


//这是放在最后的
tempxg+="<script language=javascript src='"+rootpath+"/js/My97DatePicker/WdatePicker.js'></script>";
tempxg+="<script language=javascript src='"+rootpath+"/js/popup.js'></script>";
tempxg+="<%@page import=\"util.Info\"%"+""+">";
tempxg+="<%=Info.tform(mmm)%"+">";
 tempxg+="<%@page import=\"util.Info\"%"+"> \n";
   tempxg+="<%@page import=\"java.util.ArrayList\"%"+"> \n";
   tempxg+="<%@page import=\"java.util.HashMap\"%"+"> \n";
   tempxg+="<%@page import=\"util.PageManager\"%"+"> \n";
   tempxg+="<%@page import=\"dao.CommDAO\"%"+"> \n";
  
  if(tablename!=null&&!"".equals(tablename)){
  if(scpagesstr.indexOf("pagexg")>-1){ 
   Writer w = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path+realpagexgname),"utf-8" ));
  w.write(tempxg);
 w.close();
 }
 }
 
 
 }catch(Exception e)
 {
 e.printStackTrace();
 }
 
 
 
 
 
 
 }
   %>
  <body>
  	<!-- cellspacing 是单元格之间的距离、cesspadding 是单元格中内容与边框的距离 -->
  	<form name="f1" method="post" action="/fzsalessys/admin/sysusers.jsp" >
  	  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytab" id="table1">
<tr align="center">
          <td colspan="2"  background="<%=rootpath %>/factory/commfiles/images/bg.gif"
				bgcolor="#FFFFFF" class="STYLE3">通用界面配置</td>
        </tr>
        <tr align="center">
          <td colspan="2"  class="itemtitle"  style="display:none; height:0px"> </td>
        </tr>
        
        
        <tr align="center">
          <td width="13%" align="center">请选择您要操作的表</td>
          <td width="87%" align="left">
          
          
          
          <%
          List<HashMap> list = new CommDAO().select("show tables");
		int tablei = 0;
		for(HashMap m:list)
		{
		String table = m.toString().substring(1,m.toString().length()-1);
		table = table.split("=")[1]; 
           %>
          <label>
            <input type="radio"  onClick="f1.target='_self';f1.action='form.jsp?qc=qc';f1.submit();"  name="optable" <%if(tablei==0)out.print("checked=checked"); %>  value="<%=table %>">
            <%=table %>          </label>
          <%
          tablei++;
          }
           %>
          
           <input type="button" name="button" id="button"  onClick="f1.action='form.jsp?sub=sub&qc=qc';f1.target='mytar';f1.submit();"  value=" GO !!! "  style="height:21px">
          
          <label>
&nbsp;&nbsp;&nbsp;          </label></td>
        </tr>
        
        
        <%
        String cols = "";
        String qc = request.getParameter("qc");
        
          
        if(qc!=null&&!tablename.equals(""))
        {
         cols = new CommDAO().getCols(tablename);
        }
         %>
         
         <%
         String tabcols = "";
         if(!tablename.equals("")){
         for(HashMap m:list)
		{
		String table = m.toString().substring(1,m.toString().length()-1);
		table = table.split("=")[1]; 
		tabcols+=table+"-";
		
		String mcols =  new CommDAO().getCols(table)+"@";
		tabcols+=mcols;
		}
		tabcols = tabcols.substring(0,tabcols.length()-1);
		}
          %>
          
          <script language=javascript>
          var tabcols = '<%=tabcols%>';
          
          </script>
        
        
        <tr align="center">
          <td width="13%" align="center">工程地址</td>
          <td width="87%" align="left"> 
          <input type="text" name="rpath"  value="<%=showpath %>" size="59"> 
          <span class="STYLE5">(记住这个东西一定要填写，别掉了)           </span></td> 
        </tr>
        
        
        
        <%
        if(!tablename.equals("")){
         %>
        <tr align="center">
          <td width="13%" align="center">生成文件</td>
          <td width="87%" align="left"><label>
            <input name="scpages" type="checkbox"  value="pagecx" checked > 
            查询
            <input name="pagecxname" type="text" value="<%=cxpagename %>" id="textfield2" size="28">
            <input name="scpages" type="checkbox"  value="pagetj" checked  > 
            添加
            <input name="pagetjname" type="text" value="<%=tjpagename %>"  id="textfield3" size="28">
          <input name="scpages" type="checkbox"  value="pagexg" checked  > 
            修改
            <input name="pagexgname" type="text" value="<%=xgpagename %>"  id="textfield4" size="28">
          </label></td> 
        </tr>
        
        
        
        
         <tr align="center">
          <td width="13%" align="center">配置字段名称</td>
          <td width="87%" align="left">
          
         <%
         String zdnamess = "";
         int colsii = 0;
         for(String col:cols.split(",")){
         zdnamess += col+"-";
         colsii++;
          %> 
          <label style="width: 95px;display: inline;text-align: center">
          <%=col %> :          </label>
          <input type="text" name="mc-<%=col %>"   size="15">
          
           <%
           if(colsii%4==0)out.print("<br />");
           
           } 
           zdnamess = zdnamess.substring(0,zdnamess.length()-1);
           
           %>           
           
           <input type="hidden" name="zdnames" value="<%=zdnamess%>" />           </td> 
        </tr>
        
         <tr align="center">
          <td width="13%" align="center">配置查询字段
            <br />
            <label>
            <input type="radio"    name="excel" checked="checked"  value="不导excel">
不导excel</label><br />
<label>
<input type="radio"    name="excel"  value="导出excel">
导出excel</label></td>
          <td width="87%" align="left">
          
          
          
          
          <% 
           int jjj = 0;
         for(String col:cols.split(",")){
          if(col.equals("filename"))continue;
          %> 
          &nbsp;
           <label  style="height:30px; background-color: " onmouseover="this.style.color='red';" onmouseout="this.style.color='gray';">
          
          
          <input type="checkbox" name="cxzd" <%if(jjj==0)out.print("checked=checked"); %> value="<%=col %>"  size="15" />
         <label style=" width: 90px">
          <%=col %>         
          </label>
           <label style=" width: 85px">
          <select name="cxtype-<%=col%>">
          <option value="输入框">输入框</option>
          <option value="下拉框">下拉框</option>
          <option value="日期框">日期框</option>
          </select>
           
          
           </label>
           
           
           <label  style=" width: 256px">
          数据 : 
          <input type=text size="35" name="cxshuju-<%=col%>">
          </label>
           
             <label  style=" width: 156px">
          关联表 : 
          <select id="cxglb-<%=col%>" onChange="cxselectthis(this);" name="cxglb-<%=col%>">
          <option value="">不关联</option>
           <%
            for(HashMap m:list)
			{
			String table = m.toString().substring(1,m.toString().length()-1);
			table = table.split("=")[1]; 
           %>
          <option value='<%=table%>'><%=table %></option>
           <%} %>
          </select>
          </label>
          
           <label  style=" width: 155px">
          关联字段 : 
          <select id="cxglzd-<%=col%>" name="cxglzd-<%=col%>">
          <option>不关联</option>
          </select>
          </label>
          
           
           
           </label>  <br />
           <% jjj++;} %>     
           
           
         
         </td>
        </tr>
        
        
        <tr align="center">
          <td width="13%" align="center">配置硬查询条件</td>
          <td width="87%" align="left"><% 
          int yii = 0;
         for(String col:cols.split(",")){
         yii++;
         if(col.equals("filename")||col.equals("content"))continue;
          %>
            <label style="width: 95px;display: inline;text-align: center"> <%=col %> : </label>
            <input type="text" name="ycx-<%=col %>"   size="25">
            
            <% if(yii%4==0)out.print("<br />");} %>                  </td>
        </tr>
        
        
         <tr align="center">
          <td width="13%" align="center">配置显示字段</td>
          <td width="87%" align="left">&nbsp;
          
          
           <% 
         for(String col:cols.split(",")){
          String check = "checked";
          if(col.equals("filename")||col.equals("content"))
          {
          check = "";
          }
          %> 
          <label >
          <input type="checkbox" name="xszd" value="<%=col %>" <%=check %> size="15" />
          <%=col %>          </label>
           <% } %>          </td>
        </tr>
        
        
         <tr align="center">
          <td width="13%" align="center">配置维护字段
          
           
          
            <br />
          
            <font color="orange">* 1.如果是关联字段的话，控件必须用下拉框或单选或多选<br />* 2.默认值是指字段不参与维护时的固定值 </font>   <br />    
          
          
           <label>
            <input name="ttype" type="radio"   value="弹" checked> 弹            </label>
           
            <label>
            <input type="radio" name="ttype"   value="跳">  跳            </label>           </td>
          <td width="87%" align="left"> 
          
          
           <% 
         for(String col:cols.split(",")){
          String dis = "";
          String bei = "";
          if(col.equals("savetime")||col.equals("filename")||col.equals("content")||col.equals("docname"))
          {
          dis = "disabled=disabled";
          bei=" (系统自己帮你维护的，你不用管)";
          }
          %> 
         &nbsp; <label  style="height:30px; background-color: " onmouseover="this.style.color='red';" onmouseout="this.style.color='gray';">
        
         <label  style=" width: 115px;display: inline">
          <input type="checkbox" onClick="choosethis(this);" <%=dis %> name="whzd" value="<%=col %>" checked="checked" id="whzd-<%=col %>" size="15">
          <%=col %>          </label>
          <%=bei %>    
          
          <%if(!col.equals("savetime")&&!col.equals("filename")&&!col.equals("content")&&!col.equals("docname")){ %>
          
           <label  style=" width: 138px;display: inline">
          控件 : 
          <select name="optype-<%=col%>">
          <option value="输入框">输入框</option>
          <option value="日期框">日期框</option>
          <option value="数字框">数字框</option>
          <option value="大输入框">大输入框</option>
          <option value="下拉框">下拉框</option>
          <option value="单选">单选</option>
          <option value="多选">多选</option>
          </select>
          </label>
          
          <label  style=" width: 256px">
          数据 : 
          <input type=text size="35" name="shuju-<%=col%>">
          </label>
          
          <label  style=" width: 156px">
          关联表 : 
          <select id="glb-<%=col%>" onChange="selectthis(this);" name="glb-<%=col%>">
          <option value="">不关联</option>
           <%
            for(HashMap m:list)
			{
			String table = m.toString().substring(1,m.toString().length()-1);
			table = table.split("=")[1]; 
           %>
          <option value='<%=table%>'><%=table %></option>
           <%} %>
          </select>
          </label>
          
           <label  style=" width: 155px">
          关联字段 : 
          <select id="glzd-<%=col%>" name="glzd-<%=col%>">
          <option>不关联</option>
          </select>
          </label>
          
          
           <label  style=" width: 185px">
          默认值 : 
          <input type="text" id="mrz-<%=col%>" name="mrz-<%=col%>"  size="15" disabled>
          </label>
          
          
          
          
          <%} %>
          
          
          </label>
          <br />
          
          
           
           <% } %>          </td>
        </tr>
       
       
       
        <tr align="center">
          <td width="13%" align="center">自定义功能一<br></td>
          <td width="87%" align="left">
          
         
         &nbsp;
          功能名称
         
     <input type="text" name="zdyname1"   size="15"> 
                   &nbsp;&nbsp;功能字段
                 <select name="zdyzd1">
                    <%
                  for(String col:cols.split(",")){
                    %>
                     <option value="<%=col%>"><%=col%></option>
                     <%} %>
                   </select>
                   &nbsp;&nbsp;值
              <input type="text" name="zdyvalue1"   size="15">
                   </td> 
              </tr>
        
        
        <tr align="center">
          <td width="13%" align="center">自定义功能二</td>
          <td width="87%" align="left">
          
         
         &nbsp;
          功能名称
         
     <input type="text" name="zdyname2"   size="15"> 
                   &nbsp;&nbsp;功能字段
                 <select name="zdyzd2">
                    <%
                  for(String col:cols.split(",")){
                    %>
                     <option value="<%=col%>"><%=col%></option>
                     <%} %>
                   </select>
                   &nbsp;&nbsp;值
              <input type="text" name="zdyvalue2"   size="15">
                   </td> 
              </tr>
        
       
       
        
         <tr align="center">
          <td width="13%" align="center">控件样式<br></td>
          <td width="87%" align="left">
          
         
         &nbsp;
         文本框样式 :
         <input type="text" name="textcss"   value="<%=showtextcss %>"   size="15" />
         &nbsp;&nbsp;&nbsp;
          大文本框样式 :
         <input type="text" name="textareacss" value="<%=showtextareacss %>"  size="15" /> 
         &nbsp;&nbsp;&nbsp;
          按钮样式 :
         <input type="text" name="buttoncss" value="<%=showbuttoncss %>"  size="15" /> 
         
                   </td> 
        </tr>
        
         <%} %>
         <tr align="center">
          <td colspan="2" align="center">注 :模板文件在D盘tform文件夹下，根据实际情况修改，生成的界面都是根据模板来的，一个项目只要一个模板</td>
        </tr>
       
        
        <tr align="center">
          <td height="37" colspan="6" align="center"><label>
            <input type="button" name="button" id="button"   onClick="f1.action='form.jsp?sub=sub&qc=qc';f1.target='mytar';f1.submit();"   value="  GO !!!  "  style="height:21px">
          
          
          <iframe style="display: none" name="mytar"></iframe>
          
          </label></td>
        </tr>
      </table>
  </form>
</body>
</html>

<script type="text/javascript">
<!--
function selectthis(obj)
{
var zdselect = document.getElementById("glzd-"+obj.id.split("-")[1]);

var tablename = obj.value;
zdselect.options.length = 0;
var tabcolsarr = tabcols.split("@");
if(tablename!=""){
for(var i=0;i<tabcolsarr.length;i++)
{
var tabcolsarrarr = tabcolsarr[i].split("-");
 
if(tabcolsarrarr[0]==tablename)
{
 
var tabcolsarrarrarr = tabcolsarrarr[1].split(","); 
for(var j=0;j<tabcolsarrarrarr.length;j++)
{

var option = new Option(tabcolsarrarrarr[j],tabcolsarrarrarr[j]);
zdselect.add(option);
}
break;
}
}
}else{
var option = new Option("不关联","");
zdselect.add(option);
}

}



function cxselectthis(obj)
{
var zdselect = document.getElementById("cxglzd-"+obj.id.split("-")[1]);

var tablename = obj.value;
zdselect.options.length = 0;
var tabcolsarr = tabcols.split("@");
if(tablename!=""){
for(var i=0;i<tabcolsarr.length;i++)
{
var tabcolsarrarr = tabcolsarr[i].split("-");
 
if(tabcolsarrarr[0]==tablename)
{
 
var tabcolsarrarrarr = tabcolsarrarr[1].split(","); 
for(var j=0;j<tabcolsarrarrarr.length;j++)
{

var option = new Option(tabcolsarrarrarr[j],tabcolsarrarrarr[j]);
zdselect.add(option);
}
break;
}
}
}else{
var option = new Option("不关联","");
zdselect.add(option);
}

}



function choosethis(obj)
{
var ischecked = obj.checked;
var objid = obj.id.split("-")[1];
var mrzobj = document.getElementById("mrz-"+objid);
if(!ischecked)
{
mrzobj.disabled="";
}else{
mrzobj.value="";
mrzobj.disabled="disabled";
}
}

//-->
</script>

 <%
 HashMap map = new HashMap();
 map.put("optable",tablename);
 %>
 <%=Info.tform(map)%>