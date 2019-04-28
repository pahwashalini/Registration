<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Addproperty</title>
</head>
<body>
<center><h2> Registration Of Cases </h2></center>
<form name="form" action="RegisterServlet" method="post" onsubmit="return validate()">
<table align="left">

 <tr>
<td><h4>Properties Details</h4></td>
 </tr>
  <tr>

 <td>Serial No</td>
 <td><input type="text" name="RegSno" /></td>
 </tr>
  <tr>
 <td>Property Status</td>
 <td><input type="radio" name="sex"value=sto/>Stolen
 <td><input type="radio" name="sex"value= invo/>Involved
 
 </td>
 </tr>
  <tr>
 <td>Property Description</td>
 <td><input type="text" name="RegSno" /></td>
 </tr>
 
 <tr>
 <td>Estimated Value</td>
 <td><input type="text" name="RegSno" /></td>
 </tr> 
  <tr>
 <td><%=(request.getAttribute("errMessage") == null) ? ""
 : request.getAttribute("errMessage")%></td>
 </tr>
  <tr>
 <td></td>
 <td><input type="submit" value="Edit"></input><input
 type="reset" value="Delete"></input></td>
 </tr>
 </table>
</body>
</html>