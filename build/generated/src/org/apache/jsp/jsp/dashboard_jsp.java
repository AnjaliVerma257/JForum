package org.apache.jsp.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;
import java.text.*;
import JForum.*;
import java.lang.*;

public final class dashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<link rel=\"stylesheet\" href=\"../css/dashboard.css\" media=\"all\" type=\"text/css\">\n");
      out.write("\n");
      out.write("<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\">\n");
      out.write("<title>\n");
      out.write("   Dashboard\n");
      out.write("</title>\n");
      out.write("\n");
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
      out.write("            <a href=\"../html/account_settings.html\">Settings</a>\n");
      out.write("            <ul>\n");
      out.write("                <li><a href=\"../html/changepassword.html\" style='width:200px;'>Change Password</a></li>\n");
      out.write("                <li><a href=\"userdetails.jsp\" style='width:200px;'>Account Details</a></li>\n");
      out.write("                <li><a href='invitations.jsp' style='width:200px;'>Invitations</a></li>\n");
      out.write("                <li><a href=\"#\" style='width:200px;'>Change E-mail-Id</a></li>\n");
      out.write("                <li><a href=\"../html/changesq.html\" style='width:200px;'>Change Security Question</a></li>\n");
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
      out.write("                <div class=\"small_div\">\n");
      out.write("                    ");

                         Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery("select * from forum order by f_date,f_time desc limit 0,6");
                       out.println("<a href='viewallforum.jsp'>Latest Forums</a>");
                        out.println("<ul>");
                        String fdesc=null;
    while(rs.next())
    {
     fdesc=rs.getString("f_desc");
     out.println("<li>"+""+fdesc+""+"</li>");
    }                        
                        out.println("</ul>");
                        conn.close();
                    
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                <div class=\"small_div\">\n");
      out.write("                    ");

                         Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jforum?","root","system");    
    Statement stmt1=conn1.createStatement();
    ResultSet rs1=stmt1.executeQuery("select * from groupdetails order by g_date,g_time desc limit 0,6");
                       out.println("<a href='viewallgroup.jsp'> Latest Groups </a>");
                        out.println("<ul>");
                        String gdesc=null;
    while(rs1.next())
    {
     gdesc=rs1.getString("group_name");
     out.println("<li>"+""+gdesc+""+"</li>");
    }                        
                        out.println("</ul>");
                    
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
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
