 <%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
 
 <%
      int uid=(int)Integer.parseInt(session.getAttribute("uid").toString());           
            
             Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    String a[]=request.getParameterValues("forum");
    int n=0;
    int del=0;
    for(int i=0;i<a.length;i++)
    {
        del=(int)Integer.parseInt(a[i].toString());
        n=n+stmt.executeUpdate("delete from userdetails where userid="+del+"");
    }
    if(n==a.length)
        response.sendRedirect("dash_admin.jsp?err=gd");
   
   
     %>
