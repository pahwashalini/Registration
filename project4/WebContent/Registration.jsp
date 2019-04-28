<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="project4.MySQLAccess"%>
     <%@ page import="project4.RegistrationOfCases"%>
  
<!DOCTYPE html>
<% 
String RegNo= request.getParameter("RegNo");
String readonly="";
RegistrationOfCases obj2=null;
if(RegNo!=null)
{
MySQLAccess a=new MySQLAccess();
obj2=a.GetRegistrationByRegNo(Integer.parseInt(RegNo));
if(obj2.getFreeze()==1)
	readonly="readonly='readonly'"; 
}	
	%>
	
<html>
<head>
<meta charset="ISO-8859-1">
<title>REgistration</title>
</head>
<body>
<center><h2> Registration Of Cases </h2></center>
<form name="form" action="process.jsp" method="post" onsubmit="return validate()">
<table align="left" border="1">

 <tr>
 <td>Registration Serial No</td>
 <td colspan="3"><input type="text" id="RegSno" <%=readonly %>  value='<%=obj2!=null?obj2.getRegistrationSerialNo():""%>' name="RegSno" /></td>
 </tr> 
 <tr>
 <tr>
 <td>Registration Date</td>
 <td colspan="3"><input type="text" <%=readonly %>  value='<%=obj2!=null?obj2.getRegistrationDate():""%>' name="Regdate" /><span style="font-size:9px;"><br>Date format: YYYY-MM-DD</span></td>
 </tr>
 <tr>
 <!-- <a href="accused.jsp?Regno="+$("#RegSno").val())>gkjh</a>-->
 <td>Mode Of Information:</td>
 <td><input type="radio"  name="mode"  value="o">Oral</td>
 <td><input type="radio"  name="mode"  value= "w">Written</td>
 <td><input type="button" name="know"  onclick="$('#div1').toggle();" value="known"> 
 </td>
 </tr>
 
 <tr>
 <td> 
 <div id="div1">
 <table>
 <tr>
 <td>Place</td>
 <td><input type="text" name="jhjk" /></td>
 </tr>
 <tr>
 </table> 
 </div>
 </td>
  <tr>
  
  
  
 <td>Place Of Occurence</td>
 <td><input type="text" name="place" <%=readonly %>  value='<%=obj2!=null?obj2.getPlaceOfOccurence():" "%>' /></td>
 </tr>
 <tr>
 <td>Investigating Officer Name</td>
 <td><input type="text" name="Investigating" <%=readonly %> value='<%=obj2!=null?obj2.getInvestigatingOfficerName():" "%>'/></td>
 </tr>
  <tr>
<td><h4>Complainant Details</h4></td>
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
  <td>Parentage:</td>
 <td><input type="radio" name="sex"value=f/>Father
 <td><input type="radio" name="sex"value= m/>Mother
 <td><input type="radio" name="sex"value= g/>Guardian
 </td>
 </tr>
 <tr>
 <td>Address</td>
 <td><input type=" text" name="address" /></td>
 </tr>
 <tr>
<td><h4>Accused details</h4></td>
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
 <tr>
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
 <td>weight(Kg)</td>
 <td><input type="text" name="wt" /></td>
 </tr>
   <tr>
 <td>Serial No</td>
 <td><input type="text" name="RegSno" /></td>
 </tr>
  <tr>
 <td>Missing Body Parts if any</td>
 <td><input type="text" name="missing" /></td>
 </tr>

   <tr>
 <td><a href="addnewaccused.jsp">Add Another Accused</a></td>
 </tr>
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
 <td><a href="addproperty.jsp">Add Another property</a></td>
 </tr>
  <tr>
 <td><%=(request.getAttribute("errMessage") == null) ? ""
 : request.getAttribute("errMessage")%></td>
 </tr>
 <tr>
 <td></td>
 <td><input type="submit"  <%=readonly %> value="Save"></input>
 <input
 type="submit" value="Freeze" onclick="form.action='Freeze.jsp?RegNo=<%=RegNo %>';"></input></td>
 </tr>
</table>
</form>
</body>
</html>