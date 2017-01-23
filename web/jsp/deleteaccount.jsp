<%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<%
    try
    {
     
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    String s=session.getAttribute("uid").toString();
    int id=(int)Integer.parseInt(s);  
   int n=stmt.executeUpdate("delete from userdetails where userid="+id+"");
   if(n>0)  
       response.sendRedirect("../index.html");
    }
    catch(Exception e)
    {}
    %>
