 <%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
 
 <%
      int uid=(int)Integer.parseInt(session.getAttribute("uid").toString());
      int rid=(int)Integer.parseInt(request.getParameter("mese").toString());
      
            
            
             Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    Statement stmt1=conn.createStatement();
    java.sql.Date date=new java.sql.Date(System.currentTimeMillis());
    java.sql.Time time=new java.sql.Time(System.currentTimeMillis());
    int rs=stmt.executeUpdate("delete from forum_followers where foll_id="+uid+" and forum_id="+rid+"");
 if(rs>0)
     response.sendRedirect("dashboard.jsp");
    
     %>