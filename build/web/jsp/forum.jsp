<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/dashboard.css" media="all" type="text/css">
<%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>
   Forums
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
        <h1 class="title">Forums</h1>
            <div id="main_partition">
<%
    try
    {
       

    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
   String s=session.getAttribute("uid").toString();
       int uid=(int)Integer.parseInt(s);
    int no_of_forums=0;
    
    ResultSet rs=stmt.executeQuery("select * from userdetails where userid='"+uid+"'");
    if(rs.next())
    {}
    else
        response.sendRedirect("../index.html?call=forum");
    
    rs=stmt.executeQuery("select count(*) from forum_followers where foll_id='"+uid+"'");
   if(rs.next())
       no_of_forums=(int)rs.getInt(1);
   
       
   int a[]=new int[no_of_forums];
   java.sql.Date jd[]=new java.sql.Date[no_of_forums];
   java.sql.Time jt[]=new java.sql.Time[no_of_forums];
   ResultSet rs1=stmt.executeQuery("select * from forum_followers where foll_id='"+uid+"'");
   
   
   
   int x=0;
   while(rs1.next())
   {
       a[x]=rs1.getInt("forum_id");
       jd[x]=rs1.getDate("join_date");
       jt[x]=rs1.getTime("join_time");
       x++;
   }
   StringBuilder str=new StringBuilder();
    if(no_of_forums==1)
           {
           str=str.append("select * from forum where forum_id="+a[0]+"");
           
           }
    else
    {
   for(int i=0;i<no_of_forums;i++)
   {
       if(i==0)
       {
          
           str=str.append("select * from forum where forum_id in");
           str=str.append("(");
           str=str.append(Integer.toString(a[i]));
           str=str.append(", ");
           
       }
       else if(i==(no_of_forums-1))
       {
           str=str.append(Integer.toString(a[i]));
           str=str.append(")");
           str=str.append("order by f_date,f_time desc");
       }  
        else
       {
           str=str.append(Integer.toString(a[i]));
           str=str.append(",");
   }
   }
    }
   String fi=str.toString();
   int id;
   java.sql.Date date=null;
   java.sql.Time time;
   int modrtr;
   String desc;
   PreparedStatement ps=conn.prepareStatement(fi);
         int l=0;
      
       ResultSet rs2=ps.executeQuery();
       String username=null;
       out.println("<ul class='forum_lst'>");
             while(rs2.next())
       {
      
       id=(rs2.getInt("forum_id"));
       date=rs2.getDate("f_date");
       time=rs2.getTime("f_time");
       modrtr=(rs2.getInt("modrtr"));
       desc=(rs2.getString("f_desc"));     
       DateFormat df = new SimpleDateFormat("dd MMM,yyyy");  
       String forum_date = df.format(date);     
       SimpleDateFormat sdf = new SimpleDateFormat("hh:mm a");
       String forum_time=sdf.format(time);
       String join_date=df.format(jd[l]);
       String join_time=sdf.format(jt[l]);
       Statement s1=conn.createStatement();
      ResultSet rs8=s1.executeQuery("select name from userdetails where userid="+modrtr+"");
            while(rs8.next())
       {
          username=rs8.getString("name");
       }
       out.print("<li><h3><a href='disp_forum.jsp?id="+id+"' class=''>"+desc+""+"</a></h3>");
       out.println("<p class='crt_desc'>"+"Created By: "+username+""+"      On: "+forum_date+""+"  "+forum_time+""+"</p><br><br>");
       out.println("<p class='follow_desc'>"+"Following Since: "+join_date+""+"  "+join_time+""+"</p>");
       out.print("</li>");
       l=l+1;
       }
out.println("</ul>");
     
       
       
       
       
       
       
       
       
    }   
   
    
    catch(Exception e)
    {
      
    }
    %>
            </div>
    </div>
            
</body>
</html>
