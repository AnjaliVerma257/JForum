<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/dashboard.css" media="all" type="text/css">
<%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>
             
                <%
                                    try
                    {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
        Statement stmt= conn.createStatement();
        String s=session.getAttribute("uid").toString();
       int uid=(int)Integer.parseInt(s);
       ResultSet rs=stmt.executeQuery("select count(*) from messages where status='unread' and reciever_id='"+uid+"'");
      
       int n=0;
       while(rs.next())
             n=rs.getInt(1);
       out.print("Recieved Messages[");
            out.print(n);
            out.print("]");
            conn.close();
                    }catch(Exception e){}
                    
                %>
    
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
        <h1 class="title">Recieved Messages</h1>
            <div id="main_partition">
                <div class="rcv_box">
            
            <%
                        try
                    {
           Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
      Statement stmt= conn.createStatement();
    String s=session.getAttribute("uid").toString();
    int uid=(int)Integer.parseInt(s);
    ResultSet rs=stmt.executeQuery("select count(*) from messages where status='unread' and reciever_id='"+uid+"'");
    int n=0;
       while(rs.next())
             n=rs.getInt(1);
       
       
      
           
            int nop=(int)Math.ceil(n/6);
            int i=0;
            
         int start=((6*((int)(Integer.parseInt(request.getParameter("mese")))))-6);
           
         int end=6;
         if((int)(Integer.parseInt(request.getParameter("mese")))==0)
         {
             start=0;
         }
         else if((int)(Integer.parseInt(request.getParameter("mese")))==1)
         {
             start=0;
         }
                 
             
       ResultSet rs1;
       Statement str=conn.createStatement();
       ResultSet rs2;
            
          String ab="select * from messages where reciever_id=? order by msg_id limit ?,?";
       PreparedStatement ps=conn.prepareStatement(ab);   
       String send=null;
       ps.setInt(1,uid);
       ps.setInt(2,start);
       ps.setInt(3,end);
       rs1=ps.executeQuery();
       while(rs1.next())
        {
              DateFormat df = new SimpleDateFormat("dd MMM,yyyy");  
        
       String date = df.format(rs1.getDate("msg_date"));     
       SimpleDateFormat sdf = new SimpleDateFormat("hh:mm a");
      
       String time=sdf.format(rs1.getTime("msg_time")); 
       int ide=rs1.getInt("sender_id");
            rs2=str.executeQuery("select name from userdetails where userid="+ide+""+"");
            while(rs2.next())
                send=rs2.getString(1);
            
      out.println("<b style='font-style:italic; margin-left:270px;' >Sent By:  "+send+""+"&nbsp;&nbsp;&nbsp;&nbsp;On: " +date +"&nbsp;&nbsp  "+ time+"</b>");
     out.println("<br><textarea style='max-height:150px; max-width:400px; background-color:white; min-height:150px; min-width:600px; margin-left:270px; magin-top:25px; z-index:10001;' readonly='readonly''>");
     out.println("\n"+rs1.getString("content"));
     out.println("</textarea><br><br>");
        //out.print("<input type='text' readonly='readonly' value='");
       
        }
          
       out.print("<div class='page_rotator'>");
       
          for(i=1;i<=(nop+1);i++)
          {
              
              out.print(" <a href='rmessages.jsp?mese="+i+"' onclick='rmessages.jsp?mese="+i+"' name='a"+i+"'>");
                      out.print(i);
                      out.print("</a>");
          }
 
       out.print("</div>");
            
}
catch(Exception e)
{
}
  
    %>
            </div>
        </div>
    </div>
</body>
</html>