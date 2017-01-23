 <%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
 <%
      try
         {
  int uid=(int)Integer.parseInt(session.getAttribute("uid").toString());
     
     String mail=request.getParameter("email");

    
                 Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    int n=stmt.executeUpdate("update userdetails set mailid='"+mail+"' where userid="+uid+"");
   
    if(n>0)
    {
        response.sendRedirect("../html/account_settings.html?err=ms");
    }
    else
    {
        response.sendRedirect("../html/account_settings.html?err=mu");
    }
     }catch(Exception e){
     }
     
   
     %>