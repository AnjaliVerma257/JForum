<%-- 
    Document   : index
    Created on : Apr 25, 2014, 9:59:56 PM
    Author     : COLLEGE PROJECT
--%>
<%@page import="java.sql.*" language="java"%>
<%
    try{
    String name=request.getParameter("username");
    String password=request.getParameter("password");
    if(request.getParameter("username")=="")
    response.sendRedirect("dashboard.jsp");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
        PreparedStatement stmt= conn.prepareStatement("select * from userdetails where mailid=? and password=?");
    stmt.setString(1,name);
    stmt.setString(2,password);
    ResultSet rs=stmt.executeQuery();
    ResultSet rs1;
    HttpSession s;
    s=request.getSession();
    if(rs.next())
    {    
    s.setAttribute("username", name);
    int uid=0;
    rs1=stmt.executeQuery("select userid,role from userdetails where mailid='"+name+"'");
    if(rs1.next())
    {
        uid=rs1.getInt("userid");
    s.setAttribute("uid", uid);
    if(rs1.getString("role").equalsIgnoreCase("admin"))
        response.sendRedirect("dash_admin.jsp");
    else
    response.sendRedirect("dashboard.jsp");
    }
    else
    {
        response.sendRedirect("../index.html?err=nl");
        
    }
    
            
    conn.close();
    }
    }
    catch(Exception e)
    {
        response.sendRedirect("../index.html");
    }
  
%>
    
    
