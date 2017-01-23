 <%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
 
 <%
      int uid=(int)Integer.parseInt(session.getAttribute("uid").toString());
      int rid=(int)Integer.parseInt(request.getParameter("mese").toString());
     
            
            
             Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement s2=conn.createStatement();
    ResultSet rs1=s2.executeQuery("select group_owner from groupdetails where groupid="+rid+"");
    Statement stmt=conn.createStatement();
    Statement stmt1=conn.createStatement();
    java.sql.Date date=new java.sql.Date(System.currentTimeMillis());
    java.sql.Time time=new java.sql.Time(System.currentTimeMillis());
    int sid=0;
    if(rs1.next())
        sid=rs1.getInt(1);
    int rs=stmt.executeUpdate("insert into grouprequests(senderid,recieverid,groupid,rtime,rdate,type) value("+uid+","+sid+",'"+rid+"','"+time+"','"+date+"','request')");
 if(rs>0)
     response.sendRedirect("dashboard.jsp");
    
     %>