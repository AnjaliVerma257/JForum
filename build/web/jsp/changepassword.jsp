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
    String pass=(String)request.getParameter("npass");
    
    String rpass=(String)request.getParameter("rpass");
    
 int n=0;
    
    if(rpass.equalsIgnoreCase(pass))
    {
        n=stmt.executeUpdate("update userdetails set password='"+rpass+"' where userid="+id+"");
        
   
    }
    if(n>0)
        response.sendRedirect("dashboard.jsp");
    else
        response.sendRedirect("../index.html?sq");
    
    }
    catch(Exception e)
    {response.sendRedirect("../index.html?se");}
    %>
