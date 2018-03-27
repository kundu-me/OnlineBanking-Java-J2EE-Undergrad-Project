<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
</head>
<body>
<script type="text/javascript">
function validation()
{
	var old=document.getElementById("OldPassword").value;
	var new1=document.getElementById("password1").value;
	var new2=document.getElementById("password2").value;
	if(old==null|| old=="")
	{
		alert("Enter Old Password !");
		document.getElementById("statusmsg").innerHTML="Enter Old Password !";
		return false;
	}
	if(new1==null|| new1=="")
	{
		alert("Enter New Password !");
		document.getElementById("statusmsg").innerHTML="Enter New Password !";
		return false;
		
	}
	if(new2==null|| new2=="")
	{
		alert("Enter Confirm Password !");
		document.getElementById("statusmsg").innerHTML="Enter Confirm Password !";
		return false;
	}
	
	if(new1!=new2)
	{
		alert("Confirm Password Did Not Match!");
		document.getElementById("statusmsg").innerHTML="Confirm Password Did not Match!";
		return false;
	}
}
function comparePassword()
{
	var new1=document.getElementById("password1").value;
	var new2=document.getElementById("password2").value;
	
	if(new1==new2)
	{
		document.getElementById("statusmsg").innerHTML="Confirm Password Matched!";
	}
	else
	{
		document.getElementById("statusmsg").innerHTML="Confirm Password Did not Match!";
	}

}
</script>
<form name="changePassword">
<table border="1" align="center" width="400" >
<tr bgcolor=#d8d8d8>
	<th colspan="2" align="center">
	Change Password
	</th>
</tr>
<tr>
	<td colspan="2">
	<p id="statusmsg"><b></b></p>
	</td>
</tr>
<tr>
	<td>
   	Account No.
   	</td>
   	<td>
   	<input type="text" id="accountno" name="accountno" >
   	</td>
</tr>
<tr>
   	<td>
    Old Password
    </td>
    <td>
    <input type="password" id="OldPassword" name="OldPassword">
    </td>
</tr>
<tr>
   	<td>
    New Password
    </td>
    <td>
    <input type="password" id="password1" name="password1">
    </td>
</tr>
<tr>
   	<td>
    Confirm Password
    </td>
    <td>
    <input type="password" id="password2" name="password2" onkeyup="comparePassword()">
    </td>
</tr>

<tr align="center">
	<td colspan="2" rowspan="3">
	<button type="button" onclick='closeThewindow()' style="border-style:outset;cursor:pointer;background-color:blue;">Close</button>
	&nbsp;
	<button type="button" onclick='resetFunction()' style="border-style:outset;cursor:pointer;background-color:blue;">Reset</button>
	&nbsp;
	<button type="button" onclick='return validation()' style="border-style:outset;cursor:pointer;background-color:blue;">Change Password</button>
	</td>
</tr>
</table>
</form>
</body>
</html>