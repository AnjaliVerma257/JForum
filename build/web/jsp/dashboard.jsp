<%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>

                    <%
                        try
                        {
                        String s=session.getAttribute("uid").toString();
       int uid=(int)Integer.parseInt(s);
                         Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system"); 
    Statement stmt3=conn.createStatement();
    ResultSet rs3=stmt3.executeQuery("select role from userdetails where userid="+uid+"");
    if(rs3.next())
    {
       if(rs3.getString("role").equalsIgnoreCase("admin"))
       {
           response.sendRedirect("dash_admin.jsp");
       }
       else
           response.sendRedirect("dash_user.jsp");
    }
                        }
                        catch(Exception e)
                        {
                            response.sendRedirect("../index.html?sq");
                        }
   
                    %>
              