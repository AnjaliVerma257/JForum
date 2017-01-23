<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/dashboard.css" media="all" type="text/css">
<%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>
   User Details
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
<h1 class="title">User Details</h1>
<div id="main_partition">
<ul style="text-align:left; font-style:normal; font-family:Calibri; font-size:medium;">
<%
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
Statement stmt=conn.createStatement();
String s=session.getAttribute("uid").toString();
int id=(int)Integer.parseInt(s);
ResultSet rs=stmt.executeQuery("select * from userdetails where userid="+id+"");
while(rs.next())
{
out.println("<li><b>User Identification Number:         </b>"+rs.getInt("userid")+"</li><br><br>");
out.println("<li><b>Registered Email Address:          </b>\t"+rs.getString("mailid")+"</li><br><br>");
out.println("<li><b>Name:                              </b>\t"+rs.getString("name")+"</li><br><br>");
out.println("<li><b>Gender:                            </b>\t"+rs.getString("gender")+"</li><br><br>");
java.sql.Date dob=rs.getDate("dob");
DateFormat df = new SimpleDateFormat("dd MMM,yyyy");  
String birth_date = df.format(dob);  
out.println("<li><b>Date Of Birth:                     </b>\t"+birth_date+"</li><br><br>");
String rdate = df.format(rs.getDate("u_date")); 
SimpleDateFormat sdf = new SimpleDateFormat("hh:mm a");
String forum_time=sdf.format(rs.getTime("u_time"));      
out.println("<li><b>Hirarichal role:                   </b>\t"+rs.getString("role")+"</li><br><br>");       
String que=rs.getString("secu_que");
out.print("<li><b>Security Question:                 </b>\t");
if(que.equalsIgnoreCase("pets_name"))
out.print("What is your first pet's name?</li><br><br>");
else if(que.equalsIgnoreCase("mothers_maiden_name"))
out.print("What is your mother's maiden name?</li><br><br>");
else if(que.equalsIgnoreCase("first_school"))
out.print("What is the name of your first school?</li><br><br>");
else if(que.equalsIgnoreCase("favorite_place"))
out.print("What is your favorite place?</li><br><br>");        
out.println("<li><b>Security Question's Answer:        </b>\t"+rs.getString("security_ans")+"</li><br><br>");
}
}
catch(Exception e)
{}
%>
</ul>
</div>
</div>
</body>
</html>