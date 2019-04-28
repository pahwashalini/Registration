<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="project4.MySQLAccess"%>
     <%@ page import="project4.RegistrationOfCases"%>
     <%@ page import="java.util.ArrayList" %>
<%
String RegSno=request.getParameter("RegSno");
String Regdate=request.getParameter("Regdate");
String mode=request.getParameter("mode");
String place=request.getParameter("place");
String Investigating=request.getParameter("Investigating");
RegistrationOfCases obj=new RegistrationOfCases(Integer.parseInt(RegSno),Regdate,mode,place,Investigating,0);
MySQLAccess a=new MySQLAccess();
String la=a.AddRegistrationOfCase(obj);
ArrayList<RegistrationOfCases> obj2=a.GetRegistrationOfCases();
%>

<%= la%>
<table border="1">

<tr><th>RegistrationSerial No</th><th>Registration Date</th><th>Mode Of Information</th><th>Place Of Occurrence</th><th>Investigating Officer Name</th></tr>
<% for(int i = 0; i < obj2.size(); i++)
{ 
	RegistrationOfCases Regobj=	obj2.get(i);

%>
<tr><td><a href='Registration.jsp?RegNo=<%= Regobj.getRegistrationSerialNo()%>'><%= Regobj.getRegistrationSerialNo()%></a></td><td><%=Regobj.getRegistrationDate()%></td><td><%=Regobj.getModeOfInformation()%></td><td><%=Regobj.getPlaceOfOccurence()%></td><td><%=Regobj.getInvestigatingOfficerName()%></td></tr>
<%} %>
</table>