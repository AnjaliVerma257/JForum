<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/dashboard.css" media="all" type="text/css">
<%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>
   Invitations and Requests
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
            int uid=(int)Integer.parseInt(session.getAttribute("uid").toString());           
             Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    Statement stmt1=conn.createStatement();
    Statement stmt2=conn.createStatement();
    ResultSet rs=stmt.executeQuery("select * from grouprequests where recieverid="+uid+"");
    int sid=0;
    int gid=0;
    Statement sn=conn.createStatement();
    ResultSet rsn=null;
    String gname=null,sname=null;
    String uname=null;
    java.sql.Time t=null;
    java.sql.Date d=null;
    ResultSet rs1=null;
    ResultSet rs2=null;
    int rid=0;
    String type;
    int reid=0;
    if(rs.next())
    {
        rs.previous();
    while(rs.next())
    {
        rid=rs.getInt("request_id");
    sid=rs.getInt("senderid");
    reid=rs.getInt("recieverid");
    gid=rs.getInt("groupid");
    t=rs.getTime("rtime");
    d=rs.getDate("rdate");
    
    type=rs.getString("type");
     DateFormat df = new SimpleDateFormat("dd MMM,yyyy");  
       String rd = df.format(d);     
       SimpleDateFormat sdf = new SimpleDateFormat("hh:mm a");
       String rt=sdf.format(t);
    rs1=stmt1.executeQuery("select * from groupdetails where groupid="+gid+"");
    while(rs1.next())
     gname=rs1.getString("group_name");
    
    rs2=stmt2.executeQuery("select * from userdetails where userid="+uid+"");
    while(rs2.next())
    uname=rs2.getString("name");
    if(type.equalsIgnoreCase("invite"))
    {
    out.println("<div style='background-color:#CC6600; width:60%;'><br>");
    out.println("<b style='color:#660033; background-color:#FF5050; font-size:large; padding:5px 5px 5px 5px; '>"+gname+"</b><br><br>");
    out.println("<b style='color:white;'>&nbsp;&nbsp;&nbsp;"+uname.toUpperCase()+"&nbsp;&nbsp; invited you to join the group.<br><br><br>");
    out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='accept.jsp?mese="+rid+"' value='Accept' name='acc' style='text-decoration:none; '>Accept</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='reject.jsp?mese="+rid+"' value='Reject' name='rej' style='text-decoration:none;'>Reject</a></b>");
    out.println("<br><br></div><br><br>");
    }
    else
    {
        
       rsn=sn.executeQuery("select name from userdetails where userid="+reid+"");
       if(rsn.next())
        sname=rsn.getString(1);
        out.println("<div style='background-color:#CC6600; width:60%;'><br>");
    out.println("<b style='color:#660033; background-color:#FF5050; font-size:large; padding:5px 5px 5px 5px; '>"+gname+"</b><br><br>");
    out.println("<b style='color:white;'>&nbsp;&nbsp;&nbsp;"+sname.toUpperCase()+"&nbsp;&nbsp; requested to join the group.<br><br><br>");
    out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='addper.jsp?mese="+rid+"' value='Accept' name='acc' style='text-decoration:none; '>Accept</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='rejper.jsp?mese="+rid+"' value='Reject' name='rej' style='text-decoration:none;'>Reject</a></b>");
    out.println("<br><br></div><br><br>");
    }
    }
    }
    else
        out.println("<b>You do not have any pending invitations.....</b>");
            %>

            </div>
        
    </div>
</body>
</html>