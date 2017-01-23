<%-- 
    Document   : changePage
    Created on : Apr 29, 2014, 1:21:36 AM
    Author     : COLLEGE PROJECT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%
    
 int pno=(int)(Integer.parseInt(request.getParameter("mese")));
 response.sendRedirect("messages.jsp");
 
   }   
%>