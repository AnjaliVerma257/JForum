<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/dashboard.css" media="all" type="text/css">
<%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>
   Questions
</title>

</head>

<body link="#000000" vlink="#000000" alink="#000000">
<div id="header" >
    <a style='position: absolute; font-size: 55px; margin-left: 50px; margin-top:17px; font-family: algerian'>JForum</a>
    <a href="../jsp/logout.jsp" class="logout_btn">Logout</a>    
    
    <div class="navbar">
    <ul>
        <li><a href="dashboard.jsp">Home</a></li>
              
        <li>
            <a href="../html/account_settings.html">Settings</a>
            <ul>
                <li><a href="../html/changepassword.html" style='width:200px;'>Change Password</a></li>
                <li><a href="userdetails.jsp" style='width:200px;'>Account Details</a></li>
                <li><a href='invitations.jsp' style='width:200px;'>Invitations</a></li>
                <li><a href="../html/changemail.html" style='width:200px;'>Change E-mail-Id</a></li>
                <li><a href="../html/changesq.html" style='width:200px;'>Change Security Question</a></li>
                <li><a href="deleteaccount.jsp" style='width:200px;'>Delete Account</a></li>
            </ul>
        </li>           
        <li><a href="viewTests.jsp">Test</a>
            <ul>
                <li><a href="viewTests.jsp">Take Test</a></li>
                <li><a href="viewScore.jsp">View Score</a></li>
                </ul>
        </li>
    </ul>
    </div>
    
</div>
<div id="sidebar">
    <h3 class="sidebar_title">Messages</h3>
    <ul>
        <li><a href="../html/nmessage.html">Send New Message</a></li>
        <li><a href="smessages.jsp?mese=0" > Sent Messages</a></li>
        <li><a href="rmessages.jsp?mese=0" >Received Messages</a></li>
    </ul>
    <h3 class="sidebar_title">Forum</h3>
    <ul>        
        <li><a href="../html/createforum.html">Create New Forum</a></li>
        <li><a href="forum.jsp" >View Forums</a></li>
    </ul>
    <h3 class="sidebar_title">Group</h3>
    <ul>
        <li><a href="invitations.jsp">Group Invitations</a></li>
        <li><a href="../html/creategroup.html">Create New Group</a></li>
        <li><a href="group.jsp">View Groups</a></li>
    </ul>
</div>
    <div id="page">    
        
            <div id="main_partition"> 
            
        <%
        
   
            Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    String decr=request.getParameter("name");
    if(decr==null)
        response.sendRedirect("../html/createTest.html");
    java.sql.Time time=new java.sql.Time(System.currentTimeMillis());
    java.sql.Date date=new java.sql.Date(System.currentTimeMillis());
    int n=0;
    if(decr!=null)
    n=stmt.executeUpdate("insert into test(description,cdate,ctime) values('"+decr+"','"+date+"','"+time+"')");
    ResultSet rs=stmt.executeQuery("select * from test where description='"+decr+"'");
    int test_id=0;
    while(rs.next())
        test_id=rs.getInt("test_id");
   
    out.println("<label name='x' value='"+test_id+"' visible='false'>");
    out.println("<form action='TestProcess.jsp?test="+test_id+"' method='post'>");
    if(n>0)
    {  
        for(int i=1;i<=20;i++)
        {
            out.println("<hr><br><b>Question: &nbsp;"+""+i+""+"</b><br><br>");
            out.println("<textarea name='que"+i+"'style='min-height:120px; min-width:800px; max-height:100px; max-width:800px;'></textarea>");
            out.println("<ol type='a'style='elevation:level'><br>");
            out.println("<li><textarea name='a"+i+"'style='min-height:80px; min-width:600px; max-height:80px; max-width:600px;'></textarea><br></li>");
            out.println("<li><textarea name='b"+i+"' style='min-height:80px; min-width:600px; max-height:80px; max-width:600px;'></textarea><br></li>");
            out.println("<li><textarea name='c"+i+"' style='min-height:80px; min-width:600px; max-height:80px; max-width:600px;'></textarea><br></li>");
            out.println("<li><textarea name='d"+i+"' style='min-height:80px; min-width:600px; max-height:80px; max-width:600px;'></textarea><br></li>");
            out.println("<li><textarea name='e"+i+"' style='min-height:80px; min-width:600px; max-height:80px; max-width:600px;'></textarea><br><br></li>");
            out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp &nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
            out.println("Correct answer:      &nbsp;&nbsp;&nbsp;&nbsp;<select name='ans"+i+"' style='width:200px;'>");
            out.println("<option name='a'>A</option>");
            out.println("<option name='b'>B</option>");
            out.println("<option name='c'>C</option>");
            out.println("<option name='d'>D</option>");
            out.println("<option name='e'>E</option>");
            out.println("</select>");
            
            if(i!=20)
            out.println("</ol><br><br><hr>");
            else
            out.println("</ol><hr><br>");    
        }
    out.println("<input type='submit' name='b1' value='CREATE TEST' style='width:200px; height:60px;  font:Calibri; background-color:silver; margin-left:400px; font-size:x-large; align:right;' onclick='javascript:crTest();'></form>");
            
    }
    %>
        
        </div>
        
    </div>
</body>
</html>