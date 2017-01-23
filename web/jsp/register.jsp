<%--
    Document   : register
    Created on : Apr 26, 2014, 2:08:22 AM
    Author     : COLLEGE PROJECT
--%>


<%@page import="java.sql.*" import="java.text.*" import=" java.util.*"  import="JForum.*" import="JForum.GetNumber" language="java"%>
<%
   
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String mname=request.getParameter("mname");
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    String dob=request.getParameter("dob");
    String ans=request.getParameter("security_ans");
    
    String gender=request.getParameter("Gender");
    String que=request.getParameter("Security");
    que=que.toString();
    String name=null;
      
    
    
    if(mname==null)
        name=fname+" "+lname;
    else
        name=fname+" "+mname+" "+lname;
    try
    {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date parsed = format.parse(dob);
        java.sql.Date dt = new java.sql.Date(parsed.getTime());
    
        
   String role="user";
   
            Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
        Statement stmt= conn.createStatement();
        java.sql.Time ti=new java.sql.Time(System.currentTimeMillis());
        java.sql.Date date=new java.sql.Date(System.currentTimeMillis());
    
    int i=stmt.executeUpdate("insert into userdetails(mailid, password, name, role, dob, security_ans, gender, secu_que,u_time,u_date) values('"+email+"','"+password+"','"+name+"','"+role+"','"+dt+"','"+ans+"','"+gender+"','"+que+"','"+ti+"','"+date+"')");
   if(i>0)
    {
   response.sendRedirect("../index.html?id=su");
        }
   else
       response.sendRedirect("../html/register.html");   
       } 
    catch(NumberFormatException n)
    {
    n.printStackTrace();
    }
    
    catch(Exception e)
    {      
        response.sendRedirect("../index.html?id=se");
    }
    
           
         
       
    
%>
