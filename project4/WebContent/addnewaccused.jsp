<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Addnewaccused</title>
</head>
<body>
<center><h2> Registration Of Cases </h2></center>
<form name="form" action="RegisterServlet" method="post" onsubmit="return validate()">
<table align="left">

<tr> 
<td><h4>Accused Details</h4></td>
 </tr>
 <tr>
 <td>Serial No</td>
 <td><input type="text" name="RegSno" /></td>
 </tr>
  <tr>
 <td>Accused</td>
 <td><input type="radio" name="sex"value=k/>Known
 <td><input type="radio" name="sex"value= u/>Unknown
 </td>
 </tr>
<tr>
<td>Name</td>
 <td><input type="text" name="name" /></td>
 </tr>
  <tr>
 <td>Sex:</td>
 <td><input type="radio" name="sex"value=m/>Male
 <td><input type="radio" name="sex"value= f/>Female
 <td><input type="radio" name="sex"value= o/>Others
 </td>
 </tr>
 <tr>
 <td>Parent Name</td>
 <td><input type="text" name="parent" /></td>
 </tr>
 <tr>
  <tr>
 <td>Parentage:</td>
 <td><input type="radio" name="sex"value=fa/>Father
 <td><input type="radio" name="sex"value= mo/>Mother
 <td><input type="radio" name="sex"value= gua/>Guardian
 </td>
 </tr>
 <td>Address</td>
 <td><input type=" text" name="address" /></td>
 </tr>
 
  <tr>
 <td>Year of Birth</td>
 <td><input type="text" name="yob" /></td>
 </tr>
  <tr>
   
 <td>Height(cm)</td>
 <td><input type="text" name="ht" /></td>
 </tr>
  <tr>
   <tr>
 <td>weight(Kg)</td>
 <td><input type="text" name="wt" /></td>
 </tr>
  <tr>
   <tr>
 <td>Serial No</td>
 <td><input type="text" name="RegSno" /></td>
 </tr>
  <tr>
  <tr>
 <td>Missing Body Parts if any</td>
 <td><input type="text" name="missing" /></td>
 </tr>
  <tr>
 <td><%=(request.getAttribute("errMessage") == null) ? ""
 : request.getAttribute("errMessage")%></td>
 </tr>
   <tr>
 <td></td>
 <td><input type="submit" value="Edit"></input><input
 type="reset" value="Save"></input> <input type="submit" value="Back" onclick="form.action='Registration.jsp'></td>
 </tr>
 
</table>
</form>
 
</body>
</html>
 
 