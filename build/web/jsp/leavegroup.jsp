 <%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
 
 <%
      int uid=(int)Integer.parseInt(session.getAttribute("uid").toString());
      int rid=(int)Integer.parseInt(request.getParameter("mese").toString());
     
            
            
             Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement s2=conn.createStatement();
    ResultSet rs1=s2.executeQuery("select group_owner from groupdetails where groupid="+rid+"");
    Statement stmt=conn.createStatement();
   int rs=stmt.executeUpdate("delete from group_followers where groupid="+rid+" and follid="+uid+"");
 if(rs>0)
     response.sendRedirect("dashboard.jsp");
    
     %>