<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Latest News</title>
<link rel="stylesheet" href="css/AdminTableStyle.css">
<script>
function displayDate()
{
	var d = new Date();
	var x = document.getElementById("displaydate");
	x.innerHTML=d.toDateString()+" "+d.toLocaleTimeString();
}
function validation()
{
	var errorElement=document.getElementById("errormsg");
	var errorMessage=" **Error : ";
	var a=document.forms["LatestNews"]["heading"].value;
	if(a==null || a=="" )
	{
	alert("Heading Cannot be Blank !");
	var text="Enter The Heading Of The News ";
	var error=errorMessage+text;
	errorElement.innerHTML=error;
	errorElement.style.color="red";
	document.getElementById("heading").focus();
	return false;
	}
	if(a.length>25 )
	{
	alert("Heading Cannot be Greater Than 25 Characters !");
	var text="Enter The Heading Of The News Within 25 Words";
	var error=errorMessage+text;
	errorElement.innerHTML=error;
	errorElement.style.color="red";
	document.getElementById("heading").focus();
	return false;
	}
		
	var b=document.forms["LatestNews"]["details"].value;
	if(b==null || b=="" )
	{
	alert("News Details Cannot be Blank !");
	var text="Enter The Details Of The News ";
	var error=errorMessage+text;
	errorElement.innerHTML=error;
	errorElement.style.color="red";
	document.getElementById("details").focus();
	return false;
	}
	
}

</script>
</head>
<body onload="displayDate()">
<form name="LatestNews" action="UpdateLatestNewsServlet" method="post" >
<table class="CSSFormAdmin" align="center">
<tr>
	<th colspan="2">
	Update Latest News
	</th>
</tr>
<tr bgcolor=#888888>
	<td colspan="2" align="center">
	Enter The Heading And Details for the News to Update
	</td>
</tr>
<tr>
	<td colspan="2">
	<p id="instruction"><font color="red"><b>
	Do not Press F5 or Refresh while filling up this 
	</b></font>	</p>
	<p id="errormsg">
	</p>
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	Current TimeStamp 
	</td>
	<td><b>
	<label id="displaydate"></label></b>
	</td>
</tr>
<tr bgcolor=#d8d8d8>
	<td>
	News Heading
	</td>
	<td>
		<textarea name="heading" id="heading" placeholder="Withinh 25 Words" rows="3" cols="30"></textarea>
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td>
	News Details
	</td>
	<td>
	<textarea name="details" id="details" placeholder="Detailed Description Of The News..." rows="6" cols="30"></textarea>
	</td>
</tr>
<tr bgcolor=#ffffff>
	<td colspan="2">
	<center>
	<input type="reset" value="Reset">
	<button name="Submit" onclick="return validation()" >Submit</button>
	</center>
	</td>
</tr>
</table>
</form>
</body>
</html>