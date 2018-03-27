<%@page import="org.dao.ComplainBoxDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Compose Email||Bank Of Bengal</title>
  <link rel="stylesheet" href="css/EmailStyle.css">
</head>
<body onload="loadFunctions()">
<script type="text/javascript">
var problem;
var signature;
function loadFunctions()
{
	getDetails();
	getSignature();
}
function getDetails()
{
	document.getElementById("serial").value=window.opener.document.getElementById("serialSession").value.trim();
	document.getElementById("email").value=window.opener.document.getElementById("emailSession").value;
	document.getElementById("subject").value=window.opener.document.getElementById("subjectSession").value;
	problem=window.opener.document.getElementById("detailsSession").value;
}
function getSignature()
{
	var element=document.getElementById("signature");
	if(element.checked==true)
	{
		var n=document.getElementById("serial").value;
		n=n.trim();
		var element=document.getElementById("solution");
		var salutation="Dear Sir/Madam,\n";
		var problemString="\nCOMPLAIN No. : "+n+"\n"+problem +"\n";
		var solution="\nSOLUTION OR SUGGESTION :\n\n\n\n";
		var name="Mr. Nirmallya Kundu";
		var signature="-Thanks & Regards\n"+name+"\nAdministrator\nBank Of Bengal";
		
		element.value=salutation + problemString + solution +signature;
	}
	else
	{
		var element=document.getElementById("solution");
		element.value="";
	}
}
</script>
  <section class="container">
    <div class="login">
      <h1>Compose Reply To Send</h1>
      <form method="post" action="ComplainReplyServlet" name="account">
      <table>
      	<tr>
      		<td width="150" colspan="2">
      		<p><h4>
      		<input type="hidden" name="serial" id="serial">
      		<input type="text" name="email" placeholder="To" id="email"></h4></p>
      		</td>
      </tr>
	<tr>
      		<td width="150" colspan="2">
      		<p><h4><input type="text" name="subject" id="subject" placeholder="Subject"></h4></p>
      		</td>
      </tr>
      <tr>
      		<td width="150" colspan="2">
      		<h6>Signature <input type="checkbox" checked="checked" name="signature" id="signature" onchange="getSignature()">
      		<br>
      		<textarea rows="20" cols="50" name="solution" id="solution" placeholder="Enter Your Message Here ..."></textarea></h6>
      		</td>
      </tr>
      <tr>
      <td colspan="2">
      <label id="msg" style="color: red; font-family: Times New Roman; font-size: 15px"></label>
      </td>
      </tr>
      </table>
       <p class="submit"><input type="submit" name="commit" value="Send"></p>
      </form>
    </div>
  </section>
 </body>
</html>
