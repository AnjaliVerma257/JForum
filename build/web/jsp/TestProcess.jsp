<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/dashboard.css" media="all" type="text/css">
<%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>
   Test Created
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
                    {
                       
                    
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    String tid=(String)request.getParameter("test");
    int test_id=Integer.parseInt(tid);
    out.println(test_id);
    String ques[]=new String[21];
    String opt_a[]=new String[21];
    String opt_b[]=new String[21];
    String opt_c[]=new String[21];
    String opt_d[]=new String[21];
    String opt_e[]=new String[21];
    String ans[]=new String[21];
    String que=null;
    String opa=null;
    String opb=null;
    String opc=null;
    String opd=null;
    String ope=null;
    String answ=null;
    
    for(int i=1;i<=20;i++)
    {
        que="que"+i;
        ques[i]=request.getParameter(que);
         opa="a"+i;
        opt_a[i]=request.getParameter(opa);
         opb="b"+i;
         opt_b[i]=request.getParameter(opb);
         opc="c"+i;
         opt_c[i]=request.getParameter(opc);
         opd="d"+i;
         opt_d[i]=request.getParameter(opd);
         ope="e"+i;
         opt_e[i]=request.getParameter(ope);
         answ="ans"+i;
         ans[i]=request.getParameter(answ);
        
    }
    int n=0;
    //PreparedStatement ps=conn.prepareStatement(");
    //ps.setInt(1,test_id);
    ResultSet rs=null;
    for(int i=1;i<=20;i++ )
    {/*
        ps.setString(2,ques[i]);
        ps.setString(3,opt_a[i]);
        ps.setString(4,opt_b[i]);
        ps.setString(5,opt_c[i]);
        ps.setString(6,opt_d[i]);
        ps.setString(7,opt_e[i]);
        ps.setString(8,ans[i]);
        ps.setInt(3,i);
        int n=ps.executeUpdate();*/
         n=stmt.executeUpdate("insert into test_questions values("+test_id+",'"+ques[i]+"','"+opt_a[i]+"','"+opt_b[i]+"','"+opt_c[i]+"','"+opt_d[i]+"','"+opt_e[i]+"','"+ans[i]+"',"+i+")");
        
    }    
    if(n>0)
    response.sendRedirect("viewTests.jsp");
   
    
    
                }
                catch(Exception e)
                {}
                    
                %>
              

</div>
    </div>
</body>