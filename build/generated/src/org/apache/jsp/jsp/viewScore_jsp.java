package org.apache.jsp.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;
import java.text.*;
import JForum.*;
import java.lang.*;

public final class viewScore_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 3.2 Final//EN\">\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <script>\n");
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
      out.write("    \n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("      \n");
      out.write("      <title>Take Test</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"../css/dashboard.css\" media=\"all\" type=\"text/css\">\n");
      out.write("        <meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\">\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("          <body>\n");
      out.write("            <div id=\"header\" >\n");
      out.write("    <a href=\"logout.jsp\" onclick='javascript:changeLocation();' class=\"logout_btn\">Logout</a>    \n");
      out.write("    \n");
      out.write("    <div class=\"navbar\">\n");
      out.write("    <ul>\n");
      out.write("        <li><a href=\"../html/dashboard.html\">Home</a></li>\n");
      out.write("        <li>\n");
      out.write("            <a href=\"../html/dashboard.html\">Resources</a>\n");
      out.write("            <ul>\n");
      out.write("                <li><a href=\"#\">Resources</a></li>\n");
      out.write("                <li><a href=\"#\">Videos</a></li>\n");
      out.write("                <li><a href=\"#\">PDF's</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </li>      \n");
      out.write("        \n");
      out.write("        <li>\n");
      out.write("            <a href=\"../html/account_settings.html\">Settings</a>\n");
      out.write("            <ul>\n");
      out.write("                <li><a href=\"#\" style='width:200px;'>Change Password</a></li>\n");
      out.write("                <li><a href=\"#\" style='width:200px;'>Account Details</a></li>\n");
      out.write("                <li><a href=\"#\" style='width:200px;'>Change E-mail-Id</a></li>\n");
      out.write("                <li><a href=\"#\" style='width:200px;'>Change Security Question</a></li>\n");
      out.write("                <li><a href=\"#\" style='width:200px;'>Delete Account</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </li>           \n");
      out.write("        <li><a href=\"#\">Test</a>\n");
      out.write("            <ul>\n");
      out.write("                <li><a href=\"#\">Take Test</a></li>\n");
      out.write("                <li><a href=\"#\">View Score</a></li>\n");
      out.write("                <li><a href=\"#\">Previous Score</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </li>\n");
      out.write("    </ul>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("</div>\n");
      out.write("<div id=\"sidebar\">\n");
      out.write("    <h3 class=\"sidebar_title\">Title</h3>\n");
      out.write("    <ul>\n");
      out.write("        <li><a href=\"../html/nmessage.html\">Send New Message</a></li>\n");
      out.write("        <li><a href=\"rmessages.jsp?mese=0\" onclick='javascript:branchrMsg();'>Recieved Messages</a></li>\n");
      out.write("    </ul>\n");
      out.write("    <h3 class=\"sidebar_title\">Title</h3>\n");
      out.write("    <ul>\n");
      out.write("        <li><a href=\"smessages.jsp?mese=0\" onclick='javascript:branchsMsg();'> Sent Messages</a></li>\n");
      out.write("        <li><a href=\"../html/createforum.html\">Create New Forum</a></li>\n");
      out.write("        <li><a href=\"forum.jsp\" onclick='javascript:branchsToForum();'>Forums</a></li>\n");
      out.write("    </ul>\n");
      out.write("    <h3 class=\"sidebar_title\">Title</h3>\n");
      out.write("    <ul>\n");
      out.write("        <li><a href=\"../html/creategroup.html\">Create New Group</a></li>\n");
      out.write("        <li><a href=\"../html/group.html\">Groups</a></li>\n");
      out.write("    </ul>\n");
      out.write("</div>\n");
      out.write("              \n");
      out.write("     <div id=\"page\">    \n");
      out.write("        <h1 class=\"title\">Take Test</h1>\n");
      out.write("            <div id=\"main_partition\">\n");
      out.write("                \n");

  

    try
    {
         int uid=(int)Integer.parseInt(session.getAttribute("uid").toString());           
        int testid=(int)Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery("select * from test_scores where takerid="+uid+"");
    Statement stmt1=conn.createStatement();
    ResultSet rs1=null;
    int tid=0;
    java.sql.Date d1=null;
    java.sql.Time t1=null;
    String desc=null;
    int score=0;
    while(rs.next())
    {
        tid=rs.getInt("testid");
        score=rs.getInt("score");
        rs1=stmt1.executeQuery("select description from test where test_id="+tid+"");
         DateFormat df = new SimpleDateFormat("dd MMM,yyyy");  
       String date = df.format(d1);     
       SimpleDateFormat sdf = new SimpleDateFormat("hh:mm a");
       String time=sdf.format(t1); 
        while(rs1.next())
            desc=rs1.getString("description");
    
     out.println("<div style='background-color:#CC6600; width:60%;'><br>");
    out.println("<b style='color:#660033; background-color:#FF5050; font-size:large; padding:5px 5px 5px 5px; '>"+desc+"</b><br><br>");
    out.println("<b style='color:white;'>Test Taken On:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+""+date+""+"<br><br><br>");
    out.println("<b style='color:white;'>At:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+""+time+""+"<br><br><br>");
    out.println("<b style='color:white;'>Score:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+""+score+""+"/20<br><br><br>");    
    out.println("<br><br></div><br><br>");
            }
    }
    catch(Exception e)
    {}
    
      out.write("\n");
      out.write("    \n");
      out.write("    </div>\n");
      out.write("            </div>\n");
      out.write("            </body>\n");
      out.write("            </html>");
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
