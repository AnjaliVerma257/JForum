 <%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>
 <%
      int uid=(int)Integer.parseInt(session.getAttribute("uid").toString());
      int rid=(int)Integer.parseInt(request.getParameter("mese"));
      
            
            
             Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    Statement stmt1=conn.createStatement();
    java.sql.Date date=new java.sql.Date(System.currentTimeMillis());
    java.sql.Time time=new java.sql.Time(System.currentTimeMillis());
    ResultSet rs=stmt.executeQuery("select * from grouprequests where request_id="+rid+"");
    int re=0;
    int gid=0;
    int op=0;
    while(rs.next())
    {
        re=rs.getInt("recieverid");
      
        gid=rs.getInt("groupid");
        op=stmt1.executeUpdate("insert into group_followers values("+gid+","+re+",'"+date+"','"+time+"')");
        if(op>0)
        {
         int a=stmt1.executeUpdate("delete from grouprequests where request_id="+rid+"");
         response.sendRedirect("invitations.jsp");
        }
        
    }
     %>