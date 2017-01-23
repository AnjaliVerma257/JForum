<%-- 
    Document   : disp_forum
    Created on : May 7, 2014, 11:25:58 AM
    Author     : COLLEGE PROJECT
--%>
<%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<%
    try
    {
      

       String fname=request.getParameter("fname");
      String s=(String)session.getAttribute("uid").toString();
       int id=(int)Integer.parseInt(s);
      java.sql.Time time=new java.sql.Time(System.currentTimeMillis());
      java.sql.Date date=new java.sql.Date(System.currentTimeMillis());
      int fid=0;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    int n=stmt.executeUpdate("insert into forum(f_date,f_desc,modrtr,f_time) values('"+date+"','"+fname+"',"+id+",'"+time+"')");
    ResultSet rs=stmt.executeQuery("select * from forum where modrtr="+id+" and f_desc='"+fname+"'");
    if(n>0)
    {
   while(rs.next())
   {
       fid=rs.getInt("forum_id");
   
   }
   Statement s1=conn.createStatement();
   int x=stmt.executeUpdate("insert into forum_followers values("+fid+","+id+",'"+date+"','"+time+"')");
   if(x>0)
   {
    response.sendRedirect("forum.jsp");
   }
      }}
    catch(Exception e)
    {
     
    }
    %>