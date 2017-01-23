<%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>

        <%
      int id=(int)Integer.parseInt(request.getParameter("mese"));

             Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    int n=stmt.executeUpdate("delete from grouprequests where request_id="+id+"");
    if(n>0)
        response.sendRedirect("invitations.jsp");
   %>