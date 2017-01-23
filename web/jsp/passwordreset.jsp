<%-- 
    Document   : resetpassword
    Created on : Apr 27, 2014, 2:14:08 PM
    Author     : COLLEGE PROJECT
--%>

<%@page import="java.util.*" import="java.sql.*" language="java"%>
<%
   

try
{
    String email=request.getParameter("email");
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver").newInstance();

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");  
    
    Statement s=conn.createStatement();
    ResultSet rs1=s.executeQuery("select userid from userdetails where mailid='"+email+"'");
    int uid=0;
   while(rs1.next())
uid=(int)(rs1.getInt("userid"));
  
        PreparedStatement stmt= conn.prepareStatement("update userdetails set password=? where userid=?");
      stmt.setString(1,password);
      stmt.setInt(2,uid);
  int rs=stmt.executeUpdate();
    if(rs>0)
    {
        response.sendRedirect("../index.html?id=ps");
    }
     else
   {
       response.sendRedirect("../html/passwordreset.html");
        }
       }catch(Exception e)
         { }
    
    
%>