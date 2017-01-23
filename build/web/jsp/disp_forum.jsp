<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/dashboard.css" media="all" type="text/css">
<%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>
   Forum
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
    try
    { String sy=session.getAttribute("uid").toString();
       int uid=(int)Integer.parseInt(sy);
          Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
   String s=(String)request.getParameter("id");
   int id=(int)Integer.parseInt(s);
   //out.println(id);
   String username=null;
   ResultSet rs8=null;
 java.sql.Date date=null;
 java.sql.Time time=null;
 Statement s1=conn.createStatement();
 Statement s2=conn.createStatement();
 ResultSet rs2=s2.executeQuery("select * from forum where forum_id="+id+"");
   Statement smt=conn.createStatement();
       ResultSet rs3=smt.executeQuery("select * from forum_followers where forum_id="+id+" and foll_id="+uid+"");
 java.sql.Time t1=null;
 java.sql.Date d1=null;
 int modrtr=0;
 String desc=null;
 String username1=null;
 ResultSet rsn=null;
 Statement stm=conn.createStatement();
  while(rs2.next())
       {
      
       id=rs2.getInt("forum_id");
       d1=rs2.getDate("f_date");
       t1=rs2.getTime("f_time");
       modrtr=(rs2.getInt("modrtr"));
       desc=(rs2.getString("f_desc"));     
       DateFormat df = new SimpleDateFormat("dd MMM,yyyy");  
       String forum_date = df.format(d1);     
       SimpleDateFormat sdf = new SimpleDateFormat("hh:mm a");
       String forum_time=sdf.format(t1);   
       rsn=stm.executeQuery("select name from userdetails where userid="+modrtr+"");
       while(rsn.next())
           username1=rsn.getString(1);
       out.print("<pre style='font-family:monotype corsiva; font-size:xx-large; color:black; margin-left:200px'>"+desc+""+"</pre>");
       out.println("<pre style='margin-left:200px;'>"+"Created By: "+username1+""+"      On: "+forum_date+""+"  "+forum_time+""+"</pre><br>");
         if(rs3.next())
       {
           out.print("<a href='leaveforum.jsp?mese="+id+"' style='margin-left:800px; color:green;'> Leave Forum</a>");
       }
       
       else
       {
           out.print("<a href='joinforum.jsp?mese="+id+"' style='margin-left:800px; color:green;'> Join Forum</a>");
       }
            
            
       }
out.println("<hr style='color:black; width:700px;'><br>");
 
  ResultSet rs=stmt.executeQuery("select * from forumcomments where forum_id="+id+" order by post_date desc,post_time desc");
  while(rs.next())
  {      
       rs8=s1.executeQuery("select name from userdetails where userid="+rs.getInt("poster_id")+"");
            while(rs8.next())
       {
          username=rs8.getString("name");
          //out.println(username);
         
       }
       date=rs.getDate("post_date");
       time=rs.getTime("post_time");
       DateFormat df = new SimpleDateFormat("dd MMM,yyyy");  
       String post_date = df.format(date);     
       SimpleDateFormat sdf = new SimpleDateFormat("hh:mm a");
       String post_time=sdf.format(time);
         
       
     
     out.println("<b style='font-style:italic; margin-left:270px;' >Posted By:  "+username+""+"&nbsp;&nbsp;&nbsp;&nbsp;On: " + post_date +"  "+ post_time+"</b>");
     out.println("<br><textarea style='max-height:150px; max-width:400px; background-color:white; min-height:150px; min-width:600px; margin-left:270px; magin-top:25px; z-index:10001;' readonly='readonly''>");
     out.println("\n"+rs.getString("content"));
     out.println("</textarea><br><br>");
     
  }
  out.println("<form method='post' action='postcomment.jsp?id="+id+"'>");
  out.println("<br><textarea style='max-height:150px; max-width:400px; background-color:white; min-height:150px; min-width:600px; margin-left:270px; magin-top:25px; z-index:10001;' id='ip' name='ip'>");
  out.println("</textarea>");
  out.println("<br><input type='submit' name='b1' value='Post Comment' id='b1' style='margin-left:300px;'>");
  out.println("</form>");
    }
    
catch(Exception e)    
{
}

     %>
                     </div>
            </div>        
  </body>
</html>