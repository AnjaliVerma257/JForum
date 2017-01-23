<%-- 
    Document   : forum.jsp
    Created on : May 3, 2014, 5:48:33 PM
    Author     : COLLEGE PROJECT
--%>

<%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<%
    
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    java.sql.Time time=new java.sql.Time(System.currentTimeMillis());
    java.sql.Date date=new java.sql.Date(System.currentTimeMillis());
     String s=session.getAttribute("uid").toString();
       int uid=(int)Integer.parseInt(s);
       String mail=request.getParameter("mail");
       String content=request.getParameter("content");
       
       int r_id=0;
       ResultSet rs=stmt.executeQuery("select userid from userdetails where mailid='"+mail+"'");
       while(rs.next())
       {
           r_id=rs.getInt(1);
       }
       Statement s1=conn.createStatement();
       int n=s1.executeUpdate("insert into messages(msg_date,sender_id,reciever_id,status,content,msg_time) values('"+date+"','"+uid+"','"+r_id+"','unread','"+content+"','"+time+"')");
       if(n>0)
           response.sendRedirect("dashboard.jsp");
    
%>