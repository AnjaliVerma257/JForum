package org.apache.jsp.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;
import java.text.*;
import JForum.*;
import java.lang.*;

public final class createTest_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 3.2 Final//EN\">\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<link rel=\"stylesheet\" href=\"../css/dashboard.css\" media=\"all\" type=\"text/css\">\n");
      out.write("<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\">\n");
      out.write("<title>\n");
      out.write("   Dashboard\n");
      out.write("</title>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("function changeLocation() {\n");
      out.write("          window.location.href = '../jsp/logout.jsp';\n");
      out.write("}\n");
      out.write("function branchsMsg() { \n");
      out.write("\n");
      out.write("          window.location.href = '../jsp/smessages.jsp?mese=0';\n");
      out.write("}\n");
      out.write("function branchrMsg() { \n");
      out.write("\n");
      out.write("          window.location.href = '../jsp/rmessages.jsp?mese=0';\n");
      out.write("}\n");
      out.write("function branchsToForum()\n");
      out.write("{\n");
      out.write("    window.location.href='../jsp/forum.jsp';\n");
      out.write("}\n");
      out.write("function crTest()\n");
      out.write("{\n");
      out.write("    window.location.href='TestProcess.jsp';\n");
      out.write("}\n");
      out.write(" \n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body link=\"#000000\" vlink=\"#000000\" alink=\"#000000\">\n");
      out.write("<div id=\"header\" >\n");
      out.write("    <a href=\"../jsp/logout.jsp\" class=\"logout_btn\">Logout</a>    \n");
      out.write("    \n");
      out.write("    <div class=\"navbar\">\n");
      out.write("    <ul>\n");
      out.write("        <li><a href=\"dashboard.jsp\">Home</a></li>\n");
      out.write("        <li>\n");
      out.write("            <a href=\"../resources/resouces.html\">Resources</a>\n");
      out.write("            <ul>\n");
      out.write("                <li><a href=\"#\">Resources</a></li>\n");
      out.write("                <li><a href=\"#\">PDF's</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </li>      \n");
      out.write("        \n");
      out.write("        <li>\n");
      out.write("            <a href=\"account_settings.html\">Settings</a>\n");
      out.write("            <ul>\n");
      out.write("                <li><a href=\"../html/changepassword.html\" style='width:200px;'>Change Password</a></li>\n");
      out.write("                <li><a href=\"userdetails.jsp\" style='width:200px;'>Account Details</a></li>\n");
      out.write("                <li><a href=\"invitations.jsp\" style='width:200px;'>Invitations</a></li>\n");
      out.write("                <li><a href=\"#\" style='width:200px;'>Change E-mail-Id</a></li>\n");
      out.write("                <li><a href=\"#\" style='width:200px;'>Change Security Question</a></li>\n");
      out.write("                <li><a href=\"deleteaccount.jsp\" style='width:200px;'>Delete Account</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </li>           \n");
      out.write("        <li><a href=\"#\">Test</a>\n");
      out.write("            <ul>\n");
      out.write("                <li><a href=\"viewTests.jsp\">Take Test</a></li>\n");
      out.write("                <li><a href=\"#\">View Score</a></li>\n");
      out.write("                </ul>\n");
      out.write("        </li>\n");
      out.write("    </ul>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("</div>\n");
      out.write("<div id=\"sidebar\">\n");
      out.write("    <h3 class=\"sidebar_title\">Messages</h3>\n");
      out.write("    <ul>\n");
      out.write("        <li><a href=\"../html/nmessage.html\">Send New Message</a></li>\n");
      out.write("        <li><a href=\"smessages.jsp?mese=0\" > Sent Messages</a></li>\n");
      out.write("        <li><a href=\"rmessages.jsp?mese=0\" >Received Messages</a></li>\n");
      out.write("    </ul>\n");
      out.write("    <h3 class=\"sidebar_title\">Forum</h3>\n");
      out.write("    <ul>        \n");
      out.write("        <li><a href=\"../html/createforum.html\">Create New Forum</a></li>\n");
      out.write("        <li><a href=\"forum.jsp\" >View Forums</a></li>\n");
      out.write("    </ul>\n");
      out.write("    <h3 class=\"sidebar_title\">Group</h3>\n");
      out.write("    <ul>\n");
      out.write("        <li><a href=\"invitations.jsp\">Group Invitations</a></li>\n");
      out.write("        <li><a href=\"../html/creategroup.html\">Create New Group</a></li>\n");
      out.write("        <li><a href=\"group.jsp\">View Groups</a></li>\n");
      out.write("    </ul>\n");
      out.write("</div>\n");
      out.write("    \n");
      out.write("    <div id=\"page\">    \n");
      out.write("        \n");
      out.write("            <div id=\"main_partition\"> \n");
      out.write("            \n");
      out.write("        ");

        
   
            Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    String decr=request.getParameter("name");
    if(decr==null)
        response.sendRedirect("../html/createTest.html");
    java.sql.Time time=new java.sql.Time(System.currentTimeMillis());
    java.sql.Date date=new java.sql.Date(System.currentTimeMillis());
    int n=0;
    if(decr!=null)
    n=stmt.executeUpdate("insert into test(description,cdate,ctime) values('"+decr+"','"+date+"','"+time+"')");
    ResultSet rs=stmt.executeQuery("select * from test where description='"+decr+"'");
    int test_id=0;
    while(rs.next())
        test_id=rs.getInt("test_id");
   
    out.println("<label name='x' value='"+test_id+"' visible='false'>");
    out.println("<form action='TestProcess.jsp?test="+test_id+"' method='post'>");
    if(n>0)
    {  
        for(int i=1;i<=20;i++)
        {
            out.println("<hr><br><b>Question: &nbsp;"+""+i+""+"</b><br><br>");
            out.println("<textarea name='que"+i+"'style='min-height:120px; min-width:800px; max-height:100px; max-width:800px;'></textarea>");
            out.println("<ol type='a'style='elevation:level'><br>");
            out.println("<li><textarea name='a"+i+" 'style='min-height:80px; min-width:600px; max-height:80px; max-width:600px;'></textarea><br></li>");
            out.println("<li><textarea name='b"+i+"' style='min-height:80px; min-width:600px; max-height:80px; max-width:600px;'></textarea><br></li>");
            out.println("<li><textarea name='c"+i+"' style='min-height:80px; min-width:600px; max-height:80px; max-width:600px;'></textarea><br></li>");
            out.println("<li><textarea name='d"+i+"' style='min-height:80px; min-width:600px; max-height:80px; max-width:600px;'></textarea><br></li>");
            out.println("<li><textarea name='e"+i+"' style='min-height:80px; min-width:600px; max-height:80px; max-width:600px;'></textarea><br><br></li>");
            out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp &nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
            out.println("Correct answer:      &nbsp;&nbsp;&nbsp;&nbsp;<select name='ans"+i+"' style='width:200px;'>");
            out.println("<option name='a'>A</option>");
            out.println("<option name='b'>B</option>");
            out.println("<option name='c'>C</option>");
            out.println("<option name='d'>D</option>");
            out.println("<option name='e'>E</option>");
            out.println("</select>");
            
            if(i!=20)
            out.println("</ol><br><br><hr>");
            else
            out.println("</ol><hr><br>");    
        }
    out.println("<input type='submit' name='b1' value='CREATE TEST' style='width:200px; height:60px;  font:Calibri; background-color:silver; margin-left:400px; font-size:x-large; align:right;' onclick='javascript:crTest();'></form>");
            
    }
    
      out.write("\n");
      out.write("        \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("    </div>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
