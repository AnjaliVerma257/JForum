 <%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
 <%
     try
     {
       
         String s=session.getAttribute("uid").toString();
int uid=(int)Integer.parseInt(s);
     String que=request.getParameter("Security");
     String ans=request.getParameter("ans");
            Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    int n=stmt.executeUpdate("update userdetails set security_ans='"+ans+"', secu_que='"+que+"' where userid="+uid+"");
    if(n>0)
    {
        response.sendRedirect("../html/account_settings.html?err=sq");
    }
    else
    {
        response.sendRedirect("../html/account_settings.html?err=sq1");
    }
     }catch(Exception e){
     }
     
   
     %>