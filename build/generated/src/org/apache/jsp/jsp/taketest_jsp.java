package org.apache.jsp.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;
import java.text.*;
import JForum.*;
import java.lang.*;

public final class taketest_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("      <title>Subscribed Forums</title>\n");
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
      out.write("        <h1 class=\"title\">Groups</h1>\n");
      out.write("            <div id=\"main_partition\">\n");
      out.write("                <form name=\"f1\" method=\"post\" action=\"checkResult.jsp\">\n");

  

    try
    {
        int testid=(int)Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery("select * from test where test_id="+testid+"");
    String tdesc=null;
    while (rs.next())
    {
        tdesc=rs.getString("description");        
    }
    out.print("<pre style='font-family:monotype corsiva; font-size:xx-large; color:black; margin-left:150px'>"+tdesc+""+"</pre><hr>");
     Statement stmt1=conn.createStatement();
     ResultSet rs1=stmt.executeQuery("select * from test_questions where testid="+testid+"");
     int g=1;
     while(rs1.next())
     {
out.println("Que."+g+""+")&nbsp;&nbsp;&nbsp;"+""+rs1.getString("question")+""+"<br><br>");
out.println("<input type='radio' name='"+rs1.getString("que_id")+"' value='a'>"+""+rs1.getString("opt_a")+""+"</input><br>");
out.println("<input type='radio' name='"+rs1.getString("que_id")+"' value='b'>"+""+rs1.getString("opt_b")+""+"</input><br>");
out.println("<input type='radio' name='"+rs1.getString("que_id")+"' value='c'>"+""+rs1.getString("opt_c")+""+"</input><br>");
out.println("<input type='radio' name='"+rs1.getString("que_id")+"' value='d'>"+""+rs1.getString("opt_d")+""+"</input><br>");
out.println("<input type='radio' name='"+rs1.getString("que_id")+"' value='e'>"+""+rs1.getString("opt_e")+""+"</input><br>");
out.println("<br><hr><br>");
g=g+1;
     }
     out.println("<input type='submit' bame='b1' value='Get Result' onclick='bResult();'>");
            }
    catch(Exception e)
    {}
    
      out.write("\n");
      out.write("    </form>\n");
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
