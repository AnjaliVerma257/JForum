 <%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
 <!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/dashboard.css" media="all" type="text/css">
<%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>
  Delete Tests
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
            <a>Delete</a>
            <ul>
                <li><a href="deleteforums.jsp">Forums</a></li>
                <li><a href="deletegroups.jsp">Groups</a></li>
                <li><a href="deleteusers.jsp">Users</a></li>
            </ul>
        </li>      
        
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
        <li><a href="#">Test</a>
            <ul>
                <li><a href="createTest.jsp">Create New Test</a></li>
                <li><a href="deletetests.jsp">Delete Tests Test</a></li>
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
    java.sql.Date date=new java.sql.Date(System.currentTimeMillis());
    java.sql.Time time=new java.sql.Time(System.currentTimeMillis());
    ResultSet rs=stmt.executeQuery("select * from test");
    int forum_id=0;
    String name=null;
    out.println("<form method='post' action='deleteselecttests.jsp'>");
     out.print("<pre style='font-family:monotype corsiva; font-size:xx-large; color:black; margin-left:400px'>DELETE TESTS</pre><hr style='width:700px;'>");
    while(rs.next())
    {
        forum_id=rs.getInt("test_id");
        name=rs.getString("description");        
        out.println("<input type='checkbox' name='forum' value='"+forum_id+"' style='margin-left:400px;'><a style='font-size:24px; color:black; margin-left:4px'>"+name+"</a><br><br>");
        
         
    }
    out.println("<br><br><Input type='submit' name='b1' style='margin-left:400px; height:40px; width:180px;'>");
    out.println("</form>");
    
   
     %>
      </div>
      </div>
</body>
</html>