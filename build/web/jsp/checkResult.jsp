<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/dashboard.css" media="all" type="text/css">
<%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>
   Result
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
        <h1 class="title">Result</h1>
            <div id="main_partition">
                
<%
    try
    {
        int uid=(int)Integer.parseInt(session.getAttribute("uid").toString());
        int testid=(int)Integer.parseInt(request.getParameter("mese"));
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    String tdesc=null;
    ResultSet rs=stmt.executeQuery("select * from test where test_id="+testid+"");
    String qid[]=new String[20];
    int marks=0;
    if(rs.next())
        tdesc=rs.getString("description");
    out.print("<pre style='font-family:monotype corsiva; font-size:xx-large; color:black; margin-left:350px'>Result For: "+tdesc+""+"</pre><hr>");
    
    
    Statement s1=conn.createStatement();
    ResultSet rs1=s1.executeQuery("select * from test_questions where testid="+testid+"");
        int i=0;
    String que=null;
    while(rs1.next())
    {
      
      qid[i]=request.getParameter(Integer.toString(rs1.getInt("que_id")));
      que=rs1.getString("ans");
      out.println("<pre>Question ID:           "+    ""+(i+1)+""  +"      Selected Answer:    "  +""+qid[i]+""      + "         Correct Answer:         " + que);
      
       
       if(qid[i].equalsIgnoreCase(rs1.getString("ans")))
           marks=marks+1;
       else
       {}
                
      i=i+1;  
    }
    out.println("<hr><br><br><pre style='font-family:monotype corsiva; font-size:xx-large; color:black; margin-left:350px'>MARKS:     "+marks+"/20</pre>");
    Statement s3=conn.createStatement();
    java.sql.Time time=new java.sql.Time(System.currentTimeMillis());
    java.sql.Date date=new java.sql.Date(System.currentTimeMillis());
    int n=s3.executeUpdate("insert into test_scores values("+testid+","+uid+",'"+time+"','"+date+"',"+marks+")");
    }
    catch(Exception e)
    {}
    %>
    
    </div>
            </div>
            </body>
            </html>