<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/dashboard.css" media="all" type="text/css">
<%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>
   Take Test
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
        <h1 class="title">Take Test</h1>
            <div id="main_partition">
                
<%
  

    try
    {
        int testid=(int)Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery("select * from test where test_id="+testid+"");
    String tdesc=null;
    while (rs.next())
    {
        tdesc=rs.getString("description");        
    }
    out.print("<pre style='font-family:monotype corsiva; font-size:xx-large; color:black; margin-left:150px'>"+tdesc+""+"</pre><hr>");
     Statement stmt1=conn.createStatement();
     ResultSet rs1=stmt.executeQuery("select * from test_questions where testid="+testid+"");
     int g=1;
     out.println("<form name='f1' method='post' action='checkResult.jsp?mese="+testid+"'>");
     while(rs1.next())
     {
out.println("Que."+g+""+")&nbsp;&nbsp;&nbsp;"+""+rs1.getString("question")+""+"<br><br>");
out.println("<input type='radio' name='"+rs1.getString("que_id")+"' value='a' checked=true>"+""+rs1.getString("opt_a")+""+"</input><br>");
out.println("<input type='radio' name='"+rs1.getString("que_id")+"' value='b'>"+""+rs1.getString("opt_b")+""+"</input><br>");
out.println("<input type='radio' name='"+rs1.getString("que_id")+"' value='c'>"+""+rs1.getString("opt_c")+""+"</input><br>");
out.println("<input type='radio' name='"+rs1.getString("que_id")+"' value='d'>"+""+rs1.getString("opt_d")+""+"</input><br>");
out.println("<input type='radio' name='"+rs1.getString("que_id")+"' value='e'>"+""+rs1.getString("opt_e")+""+"</input><br>");
out.println("<br><hr><br>");
g=g+1;
     }
     out.println("<input type='submit' bame='b1' value='Get Result' onclick='bResult();'>");
     out.println("</form>");
            }
    catch(Exception e)
    {}
    %>
    
    </div>
            </div>
            </body>
            </html>