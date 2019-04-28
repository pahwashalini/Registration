<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="project4.MySQLAccess"%>
<% MySQLAccess a=new MySQLAccess();
String regNo=String.valueOf(request.getParameter("RegNo"));
String aerror=a.Freeze(regNo );
%>
<%=aerror%>
<a href='Registration.jsp'>Back</a>