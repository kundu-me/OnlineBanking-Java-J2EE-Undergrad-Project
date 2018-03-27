<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Current Balance</title>
</head>
<body>
<script type="text/javascript">
function validation()
{
	var pass=document.getElementById("password").value;
	if(pass==null||pass=="")
	{
		alert("Enter Account Password !");
		document.getElementById("statusmsg").innerHTML="Enter Account Password !";
		return false;
	}
	xmlhttpPost("CheckBalanceAjax.jsp");	
}

function xmlhttpPost(strURL)
{
		var xmlHttpReq = false;
		var self = this;
	
		// Mozilla/Safari
		if (window.XMLHttpRequest)
		{
			self.xmlHttpReq = new XMLHttpRequest();
		}
	
		// IE
		else if (window.ActiveXObject) 
		{
			self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
		}
	
		self.xmlHttpReq.open('POST', strURL, true);
		self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		self.xmlHttpReq.onreadystatechange = function()
		{
			if (self.xmlHttpReq.readyState == 4) 
			{
				updatepage(self.xmlHttpReq.responseText);
			}
		};
		self.xmlHttpReq.send(getquerystring());
	
}

function getquerystring()
{
	var accountno=document.getElementById("accountno").value;
	var password=document.getElementById("password").value;
	var word = accountno+","+password;
	qstr = 'w=' + escape(word); // NOTE: no '?' before querystring
	return qstr;
}

function updatepage(str)
{
	var vString=str.split("|");
	
	var str0=vString[0];
	var str1=vString[1];
	alert(str0+"   "+str1);
	
	if(str0=="0")
	{
		document.getElementById("statusmsg").innerHTML="";
		document.getElementById("remarksmsg").innerHTML=str1;
	}
	else if(str0=="1")
	{
		document.getElementById("balanceTable").deleteRow(3);
		document.getElementById("balanceL").innerHTML="SB Account Balance";
		document.getElementById("balanceV").innerHTML=str1;
	}
}
</script>
<form name="checkbalance">
<table border="1" align="center" width="400" id="balanceTable">
<tr bgcolor=#d8d8d8>
	<th colspan="2" align="center">
	SB Account Balance
	</th>
</tr>
<tr>
	<td colspan="2">
	<p id="statusmsg"><b></b></p>
	<p id="remarksmsg"><b></b></p>
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
   	<td id="passL">
    Password
    </td>
    <td id="passV">
    <input type="password" id="password" name="password">
    </td>
</tr>
<tr>
	<td id="balanceL">&nbsp;
	</td>
	<td id="balaceV">&nbsp;
	</td>
</tr>
<tr align="center">
	<td colspan="2" rowspan="3">
	<button type="button" onclick='resetFunction()' style="border-style:outset;cursor:pointer;background-color:blue;">Reset</button>
	&nbsp;
	<button type="button" onclick='return validation()' style="border-style:outset;cursor:pointer;background-color:blue;">Show Balance</button>
	</td>
</tr>
</table>
</form>
</body>
</html>