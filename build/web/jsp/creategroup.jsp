<%-- 
    Document   : creategroup
    Created on : May 8, 2014, 1:17:48 AM
    Author     : COLLEGE PROJECT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
<%
    try
    {
       

   String fname=request.getParameter("gname");
   String descr=request.getParameter("gdesc");
      String s=(String)session.getAttribute("uid").toString();
       int id=(int)Integer.parseInt(s);
      java.sql.Time time=new java.sql.Time(System.currentTimeMillis());
      java.sql.Date date=new java.sql.Date(System.currentTimeMillis());
      int foll=0;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    int l=0;
    int in=0;
    ResultSet rs1;
    int n=stmt.executeUpdate("insert into groupdetails(group_name,member_count,description,g_time,g_date,group_owner) values('"+fname+"',1,'"+descr+"','"+time+"','"+date+"',"+id+")");
    if(n>0)
    {
        ResultSet ts=stmt.executeQuery("select groupid from groupdetails where group_name='"+fname+"' order by g_time desc ,g_date desc");
        if(ts.next())             
         in=ts.getInt("groupid");
        l=stmt.executeUpdate("insert into group_followers values("+in+","+id+",'"+date+"','"+time+"')");
        out.println(l);
        if(l>0)
        response.sendRedirect("../html/addmem.html");
    }
    else
    {}
      
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>
