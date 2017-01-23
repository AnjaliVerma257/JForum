<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/dashboard.css" media="all" type="text/css">
<%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>
   Score
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
         int uid=(int)Integer.parseInt(session.getAttribute("uid").toString());           
        
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery("select * from test_scores where takerid="+uid+"");
    
    Statement stmt1=conn.createStatement();
    ResultSet rs1=null;
    int tid=0;
    java.sql.Date d1=null;
    java.sql.Time t1=null;
    String desc=null;
    int score=0;
    while(rs.next())
    {
        tid=rs.getInt("testid");
        score=rs.getInt("score");
        rs1=stmt1.executeQuery("select description from test where test_id="+tid+"");
      
         DateFormat df = new SimpleDateFormat("dd MMM,yyyy");  
        
       String date = df.format(rs.getDate("tdate"));     
       SimpleDateFormat sdf = new SimpleDateFormat("hh:mm a");
      
       String time=sdf.format(rs.getTime("ttime")); 
       
        if(rs1.next())
            desc=rs1.getString("description");
    
     out.println("<div style='background-color:#CC6600; width:60%;'><br>");
    out.println("<b style='color:#660033; background-color:#FF5050; font-size:large; padding:5px 5px 5px 5px; '>"+desc+"</b><br><br>");
    out.println("<b style='color:white;'>Test Taken On:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+""+date+""+"<br><br>");
    out.println("<b style='color:white;'>At:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+""+time+""+"<br><br>");
    out.println("<b style='color:white;'>Score:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+""+score+""+"/20<br><br>");    
    out.println("<br><br></div><br><br>");
            }
    }
    catch(Exception e)
    {}
    %>
    
    </div>
            </div>
            </body>
            </html>