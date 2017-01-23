<%@page import="java.util.*" import="java.sql.*" import="java.text.*" import="JForum.*" import="java.lang.*"%>


<%
    try
    {     

          Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    String u=session.getAttribute("uid").toString();
    int uid=(int)Integer.parseInt(u);
    String tx=null;
    int i=0;
  while(request.getParameter("t"+i+"")!=null)
         i=i+1;
  String[] a=new String[i+1];
  for(int n=0;n<i;n++)
  {
      tx="t"+n;
      a[n]=(String)request.getParameter(tx);      
  }
  ResultSet rs=stmt.executeQuery("select groupid from groupdetails where group_owner="+uid+" order by g_date,g_time desc");
  java.sql.Date date=new java.sql.Date(System.currentTimeMillis());
  java.sql.Time time=new java.sql.Time(System.currentTimeMillis());
  int gid=0;
  if(rs.next())
  {
     gid=rs.getInt(1);
      
  }
  
 PreparedStatement ps=conn.prepareStatement("select * from userdetails where mailid=?");
 int userid[]=new int[i+1];
 for(int m=0;m<=i;m++)
     userid[i]=0;
 for(int av=0;av<i;av++)
 {
   ps.setString(1,a[av]);
   ResultSet rs1=ps.executeQuery();
   while(rs1.next())
    userid[av]=rs1.getInt("userid");
 }
 
PreparedStatement ps1=conn.prepareStatement("insert into grouprequests(senderid,recieverid,groupid,rtime,rdate,type) values(?,?,?,?,?,?)");
ps1.setInt(1,uid);
ps1.setInt(3,gid);
ps1.setTime(4,time);
ps1.setDate(5,date);
ps1.setString(6,"invite");
int n=0;

for(int b=0;b<i;b++)
{
    if(userid[b]!=0)
    {
        ps1.setInt(2,userid[b]);
       n=ps1.executeUpdate();
    }
}
if(n>0)
    response.sendRedirect("dashboard.jsp");
else
    response.sendRedirect("group.jsp");
    
 
    }
    catch(Exception e)
    {        
         response.sendRedirect("../index.html");
    }
    %>