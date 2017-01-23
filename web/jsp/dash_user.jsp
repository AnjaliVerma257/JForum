<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/dashboard.css" media="all" type="text/css">
<%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>
   Dashboard
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
                <div class="small_div">
                    <%
                        String s=session.getAttribute("uid").toString();
       int uid=(int)Integer.parseInt(s);
                         Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system"); 
    Statement stmt3=conn.createStatement();
    ResultSet rs3=stmt3.executeQuery("select forum_id from forum_followers where foll_id="+uid+"");
    Statement stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery("select * from forum order by f_date desc,f_time desc limit 0,6");
                       out.println("<a href='viewallforum.jsp' style='font-family:monotype corsiva; font-size:xx-large; margin-left:200px; color:black; text-decoration:none;'>Latest Forums</a>");
                        out.println("<ul>");
                        String fdesc=null;
                        int id=0;
     while(rs.next())
                        {
                            
     fdesc=rs.getString("f_desc");
     id=rs.getInt("forum_id");
     
     out.println("<li style='font-family:monotype corsiva; font-size:xx-large; margin-left:20px; color:black; text-decoration:none;'><a href='disp_forum1.jsp?id="+id+"' style='text-decoration:none;'>"+""+fdesc+""+"</li></a>");
    
    
    }
                        out.println("</ul>");
                        conn.close();
                    %>
                    </div>
                <div class="small_div">
                    <%
                         Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt1=conn1.createStatement();
    ResultSet rs1=stmt1.executeQuery("select * from groupdetails order by g_date desc,g_time desc limit 0,6");
                       out.println("<a href='viewallgroup.jsp' style='font-family:monotype corsiva; font-size:xx-large; margin-left:200px; color:black; text-decoration:none;'> Latest Groups </a>");
                        out.println("<ul>");
                        String gdesc=null;
                        int id1=0;
    while(rs1.next())
    {
     gdesc=rs1.getString("group_name");
     id1=rs1.getInt("groupid");
     out.println("<li style='font-family:monotype corsiva; font-size:xx-large; margin-left:20px; color:black; text-decoration:none;'><a href='newjsp1.jsp?id="+id1+"' style='text-decoration:none;'>"+""+gdesc+""+"</li></a>");
    }                        
                        out.println("</ul>");
                    %>
                </div>
            </div>
        
    </div>
</body>
</html>