
<%@page import="java.sql.*" import="java.util.*" import="java.text.*" import="JForum.SecurityQuestion" %>
        <%
   
            String email=request.getParameter("email");
            String dob=request.getParameter("dob");
            String Security=request.getParameter("Security");
            String security_ans=request.getParameter("security_ans");
            email=email.toLowerCase();
            security_ans=security_ans.toLowerCase();
                 try
    {
           SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date parsed = format.parse(dob);
        java.sql.Date dt = new java.sql.Date(parsed.getTime());
             Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
        Statement stmt= conn.createStatement();
    ResultSet rs=stmt.executeQuery("select * from userdetails where dob='"+dt+"' and mailid='"+email+"' and secu_que='"+Security+"' and security_ans='"+security_ans+"'");
   if(rs.next())
    {
   response.sendRedirect("../html/passwordreset.html");
        }
   else
       response.sendRedirect("../html/forgotpassword.html");       
       }
                 catch(Exception e)
         { 
             response.sendRedirect("../index.html?se");       
         }
    
    
        %>
