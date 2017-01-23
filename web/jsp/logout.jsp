<%-- 
    Document   : logout
    Created on : Apr 25, 2014, 11:46:08 PM
    Author     : COLLEGE PROJECT
--%>
<%@page import="java.sql.*" language="java"%>
<%
   

   out.println(session.getAttribute("uid"));
   session.invalidate();
   response.sendRedirect("../index.html");
  
    
    
    
    %>
